import 'package:books_app/features/home/domain/entity/book_entity.dart';

abstract class FeaturedBooksState {}
class FeaturedBooksInitial extends FeaturedBooksState {}
class FeaturedBooksLoading extends FeaturedBooksState {}
class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;
  FeaturedBooksSuccess(this.books);
}
class FeaturedBooksError extends FeaturedBooksState {
  final String  message;
  FeaturedBooksError(this.message);
} 