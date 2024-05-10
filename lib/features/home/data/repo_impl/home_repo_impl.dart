import 'package:books_app/core/error/failure.dart';
import 'package:books_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:books_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
 
class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl({required this.homeLocalDataSource,required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int startIndex = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.getFeaturedBooks(startIndex: startIndex);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks(startIndex: startIndex);
      return right(books);
    } catch (error) {
      if (error is DioException) {
         return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int startIndex=0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.getFeaturedBooks(startIndex: startIndex);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks(startIndex: startIndex);
      return right(books);
    } catch (error) {
      if (error is DioException) {
       return left(ServerFailure.fromDioError(error));
    }
    return left(ServerFailure(error.toString()));
    }
  }
}
