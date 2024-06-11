 import 'package:books_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:books_app/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featchFeaturedBookUseCase)
      : super(FeaturedBooksInitial());
  FeatchFeaturedBookUseCase featchFeaturedBookUseCase;

  Future<void> getFeaturedBooks({int startIndex = 0}) async {
    if (startIndex == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await featchFeaturedBookUseCase.call(startIndex);
    result.fold(
      (failure) {
        if (startIndex == 0) {
          emit(FeaturedBooksError(failure.message));
        } else {
          emit(FeaturedBooksPaginationError(failure.message));
        }
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
