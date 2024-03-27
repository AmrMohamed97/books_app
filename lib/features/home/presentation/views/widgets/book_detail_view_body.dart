 import 'package:books_app/features/home/presentation/views/widgets/book_detail_section.dart';
import 'package:books_app/features/home/presentation/views/widgets/custom_book_detail_app_Bar.dart';
 import 'package:books_app/features/home/presentation/views/widgets/simillar_book_section.dart';
 import 'package:flutter/material.dart';

class BookDetailViewBody extends StatelessWidget {
  const BookDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding:   EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              children: [
                  SafeArea(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                  CustomBookDetailAppBar(),
                  BookDetailSection(),
                  Expanded(
                  child: SizedBox(
                    height: 47,
                  ),
                ),
                  SimillarBookSection(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
