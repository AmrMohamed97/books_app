import 'package:books_app/core/error/failure.dart';
import 'package:books_app/core/use_case/use_case.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, NoParams> {
  final HomeRepo homeRepo;
  FetchNewestBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParams? params]) {
    return homeRepo.fetchNewestBooks();
  }
}
