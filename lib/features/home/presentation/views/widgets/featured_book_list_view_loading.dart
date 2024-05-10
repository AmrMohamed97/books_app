import 'package:books_app/features/home/presentation/views/widgets/custom_image_looding.dart';
import 'package:flutter/material.dart';

class FeaturedBookListViewLooding extends StatelessWidget {
  const FeaturedBookListViewLooding({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => const CustomImageLoading()
    );
  }
}