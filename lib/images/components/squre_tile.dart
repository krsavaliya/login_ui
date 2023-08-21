// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SquereTile extends StatelessWidget {
  final String imagePath;
  const SquereTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200]),
      child: Image.asset(
        imagePath,
        height: 40,
      ),  
    );
  }
}
  