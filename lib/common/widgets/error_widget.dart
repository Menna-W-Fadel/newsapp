import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({required this.errorMessange,super.key});
  final String errorMessange;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessange),
    );
  }
}
