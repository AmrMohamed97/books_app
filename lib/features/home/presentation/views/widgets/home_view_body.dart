import 'package:books_app/core/utiles/text_styles.dart';
import 'package:books_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:books_app/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:books_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:books_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:books_app/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        const BestSellerListView(),
      ],
    );
  }
}

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
           return FeaturedBooksListView(books: state.books,);
        } else if (state is FeaturedBooksError) {
          return Text(state.message);
        }else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
