import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_detail_section.dart';
import 'package:books_app/features/home/presentation/views/widgets/custom_book_detail_app_Bar.dart';
import 'package:books_app/features/home/presentation/views/widgets/simillar_book_section.dart';
import 'package:flutter/material.dart';

class BookDetailViewBody extends StatelessWidget {
  const BookDetailViewBody({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              children: [
                const SafeArea(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                const CustomBookDetailAppBar(),
                BookDetailSection(
                  book: book,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 40,
                  ),
                ),
                const SimillarBookSection(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
