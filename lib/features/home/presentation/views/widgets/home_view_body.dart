import 'package:books_app/core/utiles/text_styles.dart';
import 'package:books_app/features/home/presentation/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:books_app/features/home/presentation/manager/newest_book_cubit/newest_book_state.dart';
import 'package:books_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:books_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:books_app/features/home/presentation/views/widgets/featured_books_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomeAppBar(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.29,
                child: const FeaturedBooksListViewBlocBuilder(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.055,
              ),
              const Padding(
                padding: EdgeInsetsDirectional.only(start: 20.0),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle16,
                ),
              ),
              // const Expanded(child: BestSellerListView()),
            ],
          ),
        ),
        const BestSellerListViewBlocBuilder(),
      ],
    );
  }
}

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if (state is NewestBookSuccess) {
          return BestSellerListView(books: state.books,);
        } else if (state is NewestBookError) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text(state.message)),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
