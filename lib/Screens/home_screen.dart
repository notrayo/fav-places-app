import 'package:favorite_places/Screens/add_place_form.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                  Icons.add_location_outlined,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ),
        body: PlacesList(places: []));
  }
}
