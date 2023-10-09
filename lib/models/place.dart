import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();

class Place {
  final String id;
  final String title;
  final File image;
  final String description;

  Place({required this.title, required this.image, required this.description})
      : id = uuid.v4();
}
