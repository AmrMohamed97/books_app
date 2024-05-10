import 'package:flutter/material.dart';

class CustomImageLoading extends StatelessWidget {
  const CustomImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AspectRatio(
        aspectRatio: 2.3 / 4,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Container(
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
