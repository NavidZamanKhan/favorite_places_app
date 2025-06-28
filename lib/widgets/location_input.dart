import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {},
              label: const Text("Get Current Location"),
              icon: const Icon(Icons.location_on_outlined),
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text("Select on Map"),
              icon: Icon(Icons.map_outlined),
            ),
          ],
        ),
      ],
    );
  }
}
