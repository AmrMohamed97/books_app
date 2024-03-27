import 'package:books_app/core/utiles/text_styles.dart';
import 'package:books_app/features/home/presentation/views/widgets/similler_book_list_view.dart';
import 'package:flutter/material.dart';

class SimillarBookSection extends StatelessWidget {
  const SimillarBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'you can also like',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const SimillarBooksListView(),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
