import 'package:books_app/core/utiles/app_router.dart';
import 'package:books_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverList.builder(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.bookDetail);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: BestSellerListViewItem(),
          ),
        ),
      ),
    );
  }
}
