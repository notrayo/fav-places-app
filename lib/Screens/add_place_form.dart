import 'package:favorite_places/Screens/home_screen.dart';
import 'package:favorite_places/providers/places_provider.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlace extends ConsumerStatefulWidget {
  AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  final _formKey = GlobalKey<FormState>();

  final _locationTitleController = TextEditingController();

  @override
  void dispose() {
    _locationTitleController.dispose();
    super.dispose();
  }

  //@override
  void _savePlace() {
    final enteredText = _locationTitleController.text;

    if (_formKey.currentState!.validate()) {
      ref.read(userPlacesProvider.notifier).addPlace(enteredText);
      _locationTitleController.clear();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => const HomeScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Location Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _locationTitleController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('Location Name'),
                    ),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 1 ||
                          value.trim().length > 50) {
                        return 'please re-enter the location name';
                      }
                      return null;
                    },
                    // onSaved: (value) {
                    //   _enteredName = value!;
                    // },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ImageInput(),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton.icon(
                    onPressed: _savePlace,
                    icon: const Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        //backgroundColor: const Color.fromARGB(255, 240, 208, 24),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        )),
                    label: const Text(
                      'Add Place',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
