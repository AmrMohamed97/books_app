 import 'package:books_app/core/widgets/custom_fading_widget.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/presentation/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:books_app/features/home/presentation/manager/newest_book_cubit/newest_book_state.dart';
import 'package:books_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:books_app/features/home/presentation/views/widgets/best_seller_list_view_loading.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewBlocConsumer extends StatefulWidget {
  const BestSellerListViewBlocConsumer({
    super.key,
  });

  @override
  State<BestSellerListViewBlocConsumer> createState() =>
      _BestSellerListViewBlocConsumerState();
}

class _BestSellerListViewBlocConsumerState
    extends State<BestSellerListViewBlocConsumer> {
  final List<BookEntity> newBooks = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBookCubit, NewestBookState>(
      listener: (context, state) {
        if (state is NewestBookPaginationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
        if (state is NewestBookSuccess) {
          newBooks.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is NewestBookSuccess ||
            state is NewestBookPaginationLoading ||
            state is NewestBookPaginationError) {
              
          return BestSellerListView(
            books: newBooks,
          );
        } else if (state is NewestBookError) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text(state.message)),
          );
        } else {
          return const BestSellerListViewLoading();
        }
      },
    );
  }
}
