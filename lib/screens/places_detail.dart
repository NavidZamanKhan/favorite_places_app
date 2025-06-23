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
      body: Center(
        child: Text(place.id, style: const TextStyle(color: Colors.black)),
      ),
    );
  }
}
