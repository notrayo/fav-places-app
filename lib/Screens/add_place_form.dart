import 'package:flutter/material.dart';

class AddPlace extends StatelessWidget {
  AddPlace({super.key});
  final _formKey = GlobalKey<FormState>();

  void _savePlace() {
    _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter description of location'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Location Description'),
                  ),
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
                ElevatedButton(
                  onPressed: _savePlace,
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      //backgroundColor: const Color.fromARGB(255, 240, 208, 24),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      )),
                  child: const Text(
                    'Add Place',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
