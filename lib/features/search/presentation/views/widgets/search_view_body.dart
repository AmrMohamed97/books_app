import 'package:books_app/core/utiles/text_styles.dart';
import 'package:books_app/core/widgets/custom_text_field.dart';
 import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SafeArea(
                  child: CustomTextField(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'search Items',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        // const BestSellerListView(),
      ],
    );
  }
}
