import 'package:favorite_places/Screens/add_place_form.dart';
import 'package:favorite_places/providers/places_provider.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Added Places ...'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPlace(),
                      ));
                },
                icon: const Icon(
                  Icons.add_location_alt,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ),
        body: PlacesList(places: userPlaces));
  }
}
