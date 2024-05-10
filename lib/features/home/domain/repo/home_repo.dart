import 'package:books_app/core/error/failure.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int startIndex = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int startIndex = 0});
}
