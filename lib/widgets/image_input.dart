import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takeImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 300);

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }

  void _pickImage() {
    final imagePicker = ImagePicker();
    imagePicker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
            onPressed: _takeImage,
            icon: const Icon(Icons.camera),
            label: const Text('Take a picture')),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.image_outlined),
            label: const Text('Pick from gallery'))
      ],
    );

    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _takeImage,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
        decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: Colors.white70.withOpacity(0.3))),
        height: 250,
        width: double.infinity,
        alignment: Alignment.center,
        child: content);
  }
}

// class ImageGallery extends StatefulWidget {
//   const ImageGallery({super.key});

//   @override
//   State<ImageGallery> createState() => _ImageGalleryState();
// }

// class _ImageGalleryState extends State<ImageGallery> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(width: 1, color: Colors.white70.withOpacity(0.3))),
//       height: 250,
//       width: double.infinity,
//       alignment: Alignment.center,
//       child: TextButton.icon(
//           onPressed: () {},
//           icon: const Icon(Icons.add_a_photo_outlined),
//           label: const Text('Choose Photo')),
//     );
//   }
// }
