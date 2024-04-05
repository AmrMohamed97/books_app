import 'package:books_app/features/home/domain/entity/book_entity.dart';
 import 'package:books_app/features/home/presentation/views/home_view.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_detail_view_body.dart';
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
        builder: (context, state) {
          BookEntity book = state.extra! as BookEntity;
          return BookDetailViewBody(book: book,);
        
        },
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
