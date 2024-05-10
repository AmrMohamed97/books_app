import 'package:books_app/core/error/failure.dart';
import 'package:books_app/core/use_case/use_case.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class FeatchFeaturedBookUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;
  FeatchFeaturedBookUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int? params]) {
    return homeRepo.fetchFeaturedBooks(startIndex: params??0 );
  }
}
