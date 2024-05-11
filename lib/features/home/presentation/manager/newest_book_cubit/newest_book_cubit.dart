import 'package:books_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:books_app/features/home/presentation/manager/newest_book_cubit/newest_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.featchNewestBookUseCase) : super(NewestBookInitial());
  FetchNewestBooksUseCase featchNewestBookUseCase;

  Future<void> getNewestBooks({int startIndex = 0}) async {
    if (startIndex == 0) {
      emit(NewestBookLoading());
    } else {
      emit(NewestBookPaginationLoading());
    }
    var result = await featchNewestBookUseCase.call(startIndex);
    result.fold(
      (failure) {
        if (startIndex == 0) {
          emit(NewestBookError(failure.message));
        }
        emit(NewestBookPaginationError(failure.message));
      },
      (books) {
        emit(NewestBookSuccess(books));
      },
    );
  }
}
