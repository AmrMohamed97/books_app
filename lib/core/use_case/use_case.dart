import 'package:books_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call([P? params]);
}

class NoParams {}
