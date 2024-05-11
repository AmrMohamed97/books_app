import 'package:books_app/core/utiles/text_styles.dart';
import 'package:books_app/features/home/presentation/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:books_app/features/home/presentation/views/widgets/newest_book_list_view_bloc_consumer.dart';
import 'package:books_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:books_app/features/home/presentation/views/widgets/featured_books_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  ScrollController controller = ScrollController();
  int nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    controller.addListener(controllerListener);
    super.initState();
  }

  void controllerListener() async {
    if (controller.hasClients &&
        controller.position.pixels >=
            0.7 * controller.position.maxScrollExtent) {
      if (isLoading == false) {
        isLoading = true;
        await BlocProvider.of<NewestBookCubit>(context)
            .getNewestBooks(startIndex: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
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
                  'Newest Books',
                  style: Styles.textStyle16,
                ),
              ),
              // const Expanded(child: BestSellerListView()),
            ],
          ),
        ),
        const NewestBookListViewBlocConsumer(),
      ],
    );
  }
}
