import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AspectRatio(
        aspectRatio: 2.3 / 4,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/test_image.png'),
            ),
          ),
        ),
      ),
    );
  }
}
