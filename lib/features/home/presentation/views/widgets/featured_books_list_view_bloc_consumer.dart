import 'package:books_app/core/widgets/custom_fading_widget.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:books_app/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:books_app/features/home/presentation/views/widgets/featured_book_list_view_loading.dart';
import 'package:books_app/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() =>
      _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState
    extends State<FeaturedBooksListViewBlocBuilder> {
  final List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationError) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedBooksError) {
          return Text(state.message);
        } else {
          return const CustomFadingWidget(child: FeaturedBookListViewLooding());
        }
      },
    );
  }
}
