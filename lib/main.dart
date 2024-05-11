import 'package:books_app/constants.dart';
import 'package:books_app/core/utiles/app_router.dart';
import 'package:books_app/core/utiles/functions/instance_locator.dart';
import 'package:books_app/core/utiles/my_observer.dart';
import 'package:books_app/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:books_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:books_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:books_app/features/home/presentation/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kfeaturedBooks);
  await Hive.openBox<BookEntity>(knewestBooks);
  instanceLocator();
  Bloc.observer = MyObserver();
  runApp(const BooksApp());
}

class BooksApp extends StatelessWidget {
  const BooksApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FeatchFeaturedBookUseCase(
              homeRepo: gitIt.get<HomeRepoImpl>(),
            ),
          )..getFeaturedBooks(),
        ),
        BlocProvider(create: (context) {
          return NewestBookCubit(
            FetchNewestBooksUseCase(
              homeRepo: gitIt.get<HomeRepoImpl>(),
            ),
          )..getNewestBooks();
        }),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPackgroundColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        routerConfig: AppRoutes.route,
      ),
    );
  }
}
