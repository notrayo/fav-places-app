import 'package:location/location.dart';
import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  Location? pickedLocation;
  var _isGettingLocation = false;

  //getting current location method

  void _getCurrentLocation() async {
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
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();
    //testing if it works

    setState(() {
      _isGettingLocation = false;
    });

    print(locationData.latitude);
    print(locationData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'no location data yet',
      textAlign: TextAlign.center,
      style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
    );

    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator(
        color: Colors.green,
      );
    }

    return Column(
      children: [
        Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Colors.white70.withOpacity(0.3))),
            alignment: Alignment.center,
            child: previewContent),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
                onPressed: _getCurrentLocation,
                icon: const Icon(Icons.location_on),
                label: const Text('Current Loc')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.map),
                label: const Text('Select from Maps'))
          ],
        )
      ],
    );
  }
}
