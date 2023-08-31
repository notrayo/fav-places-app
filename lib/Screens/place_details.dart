import 'package:flutter/material.dart';
import '../models/place.dart';

class PlacesDetailsScreen extends StatelessWidget {
  const PlacesDetailsScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(place.title),
        ),
        body: Stack(
          children: [
            Image.file(
              place.image,
              fit: BoxFit.cover,
            )
          ],
        ));
  }
}
