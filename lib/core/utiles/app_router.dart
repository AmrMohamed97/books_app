import 'package:books_app/features/home/presentation/views/book_detail_view.dart';
import 'package:books_app/features/home/presentation/views/home_view.dart';
import 'package:books_app/features/search/presentation/views/search_view.dart';
import 'package:books_app/features/splash_screen/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String homeView = '/HomeView';
  static const String bookDetail = '/bookDetail';
  static const String searchView = '/searchVieew';
  static final route = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, index) => const HomeView(),
      ),
      GoRoute(
        path: bookDetail,
        builder: (context,state)=> const BookDetailView(),
        ),
        GoRoute(
        path: searchView,
        builder: (context,state)=> const SearchView(),
        ),
    ],
  );
}
