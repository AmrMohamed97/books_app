import 'package:bloc/bloc.dart';
import 'package:books_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:books_app/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featchFeaturedBookUseCase) : super(FeaturedBooksInitial());
  FeatchFeaturedBookUseCase featchFeaturedBookUseCase;
  Future<void> getFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await featchFeaturedBookUseCase.call();
    result.fold(
      (failure) {
        emit(FeaturedBooksError(failure.message));
      }, 
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
      );
  }
}
