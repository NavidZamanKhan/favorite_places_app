import 'dart:io';

import 'package:favorite_places_app/models/place.dart';
import 'package:flutter/material.dart';

class PlacesDetailScreen extends StatelessWidget {
  const PlacesDetailScreen({super.key, required this.place});
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title, style: const TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          Title(
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              place.title,
              style: const TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          const SizedBox(height: 10),
          Text(place.id),
          const SizedBox(height: 10),
          Center(child: Image.file(File(place.image.path))),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
