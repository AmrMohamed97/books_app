import 'package:books_app/core/utiles/app_router.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key, required this.books,
  });
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverList.builder(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.bookDetail,extra: books[index]);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: BestSellerListViewItem(book: books[index],),
          ),
        ),
        itemCount: books.length,
      ),
    );
  }
}
