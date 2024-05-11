import 'package:books_app/core/widgets/custom_fading_widget.dart';
import 'package:books_app/features/home/presentation/views/widgets/newest_book_list_view_item_loading.dart';
import 'package:flutter/material.dart';

class BestSellerListViewLoading extends StatelessWidget {
  const BestSellerListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverList.builder(
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: CustomFadingWidget(child: NewestBookListViewItemLoading()),
        ),
      ),
    );
  }
}
