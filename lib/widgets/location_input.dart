import 'dart:convert';
import 'dart:async';
import 'package:favorite_places_app/models/place.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectLocation});

  final void Function(PlaceLocation location) onSelectLocation;

  @override
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;

  String get locationImage {
    if (_pickedLocation == null) {
      return "";
    }
    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;
    return "https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C$lat,$lng&key=AIzaSyCCqRYUmzm_8FVLA058QVCTOyqT_VmSUZQ";
  }

  var isGettingLocation = false;

  void _getCurrentLocation() async {
    Location location = Location();

    try {
      // Check if location service is enabled
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          _showErrorSnackBar('Location services are disabled');
          return;
        }
      }

      // Check location permissions
      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          _showPermissionDeniedDialog();
          return;
        }
      }

      // Check if permission is permanently denied
      if (permissionGranted == PermissionStatus.deniedForever) {
        _showPermissionDeniedDialog();
        return;
      }

      setState(() {
        isGettingLocation = true;
      });

      // Add debug information
      print('Starting location request...');

      // Get location with timeout
      LocationData locationData;
      try {
        locationData = await location.getLocation().timeout(
          const Duration(seconds: 15),
          onTimeout: () {
            throw TimeoutException(
              'Location request timed out',
              const Duration(seconds: 15),
            );
          },
        );
      } catch (e) {
        setState(() {
          isGettingLocation = false;
        });
        _showErrorSnackBar('Failed to get location: ${e.toString()}');
        return;
      }

      final lat = locationData.latitude;
      final lng = locationData.longitude;
      if (lat == null || lng == null) {
        setState(() {
          isGettingLocation = false;
        });
        _showErrorSnackBar('Could not determine location coordinates');
        return;
      }

      // Get address from coordinates with timeout
      try {
        final url = Uri.parse(
          "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyCCqRYUmzm_8FVLA058QVCTOyqT_VmSUZQ",
        );
        final response = await http
            .get(url)
            .timeout(
              const Duration(seconds: 10),
              onTimeout: () {
                throw TimeoutException(
                  'Geocoding request timed out',
                  const Duration(seconds: 10),
                );
              },
            );

        if (response.statusCode != 200) {
          throw Exception(
            'Geocoding API returned status code: ${response.statusCode}',
          );
        }

        final resData = json.decode(response.body);
        if (resData['status'] != 'OK' ||
            resData['results'] == null ||
            resData['results'].isEmpty) {
          throw Exception('Geocoding API error: ${resData['status']}');
        }

        final address = resData['results'][0]["formatted_address"];

        setState(() {
          _pickedLocation = PlaceLocation(
            latitude: lat,
            longitude: lng,
            address: address,
          );
          isGettingLocation = false;
        });
        widget.onSelectLocation(_pickedLocation!);
        print('Location obtained successfully: $lat, $lng - $address');
      } catch (e) {
        setState(() {
          isGettingLocation = false;
        });
        _showErrorSnackBar('Failed to get address: ${e.toString()}');
      }
    } catch (e) {
      setState(() {
        isGettingLocation = false;
      });
      _showErrorSnackBar('Location error: ${e.toString()}');
    }
  }

  void _showErrorSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void _showPermissionDeniedDialog() {
    if (mounted) {
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: const Text('Location Permission Required'),
              content: const Text(
                'This app needs location permission to get your current location. '
                'Please enable location permission in your device settings.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    _openAppSettings();
                  },
                  child: const Text('Open Settings'),
                ),
              ],
            ),
      );
    }
  }

  void _openAppSettings() {
    // This would require additional packages like app_settings
    // For now, just show a message
    _showErrorSnackBar(
      'Please manually enable location permission in device settings',
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      "No Location Chosen",
      textAlign: TextAlign.center,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
    );
    if (_pickedLocation != null) {
      previewContent = ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Image.network(
          locationImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
    if (isGettingLocation) {
      previewContent = CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      );
    }

    return Column(
      children: [
        Container(
          height: 160,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
            ),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              label: const Text("Get Current Location"),
              icon: const Icon(Icons.location_on_outlined),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text("Select on Map"),
              icon: Icon(Icons.map_outlined),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
