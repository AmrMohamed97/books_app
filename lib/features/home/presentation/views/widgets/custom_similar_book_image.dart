import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomSimilarBookImage extends StatelessWidget {
  const CustomSimilarBookImage({super.key, required this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: image ??
              'http://books.google.com/books/content?id=gL34DwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
