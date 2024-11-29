import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String imagePath;
  final String title;
  final Color containerColor;
  const CategoryModel(
      {required this.id,
      required this.imagePath,
      required this.title,
      required this.containerColor});
}
