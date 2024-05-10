import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:books_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  final ScrollController _scrollController = ScrollController();
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    _scrollController.addListener(scrollListener);
    super.initState();
  }
  Future<void> scrollListener() async {
      if (_scrollController.hasClients &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.7) {
        if (isLoading == false) {
          isLoading = true;
          await  BlocProvider.of<FeaturedBooksCubit>(context)
              .getFeaturedBooks(startIndex: nextPage++);
          isLoading = false;
        }
      }
    }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => CustomBookImage(
        image: widget.books[index].imageUrl ?? '',
      ),
      itemCount: widget.books.length,
    );
  }
}
