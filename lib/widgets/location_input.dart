import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

//* A stateful widget that allows users to input location data
class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  //* Variable to store the picked location data
  Location? _pickedLoaction;

  //* Boolean flag to track if location is being retrieved
  var isGettingLocation = false;

  //* Method to get the current location from device GPS
  void _getCurrentLocation() async {
    //* Create a new Location instance
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      isGettingLocation = true;
    });

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;

    final url = Uri.parse(
      "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=YOUR_API_KEY",
    );
    final response = await http.get(url);
    final resData = json.decode(response.body);
    final adress = resData['results'][0]["formatted_address"];

    setState(() {
      isGettingLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //* Default content to show when no location is selected
    Widget previewContent = Text(
      "No Location Chosen",
      textAlign: TextAlign.center,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
    );
    //* Show loading indicator while getting location
    if (isGettingLocation) {
      previewContent = CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      );
    }

    //* A column widget that arranges its children vertically
    return Column(
      children: [
        //* A container widget that displays the location preview area
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
          //* A text widget that shows "No Location Chosen" message or loading indicator
          child: previewContent,
        ),
        //* A row widget that arranges its children horizontally
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //* A text button widget that gets the current location
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
            //* A text button widget that allows selecting location on map
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
