import 'package:books_app/core/utiles/text_styles.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:books_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:books_app/features/home/presentation/views/widgets/custom_similar_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailSection extends StatelessWidget {
  const BookDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.17),
          child: const CustomSimilarBookImage(),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          'The jungle Book',
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Rudyard kipling',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const Bookrating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: BooksAction(),
        ),
      ],
    );
  }
}
