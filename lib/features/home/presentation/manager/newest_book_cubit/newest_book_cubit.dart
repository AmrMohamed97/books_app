 import 'package:books_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:books_app/features/home/presentation/manager/newest_book_cubit/newest_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.featchNewestBookUseCase) : super(NewestBookInitial());
  FetchNewestBooksUseCase featchNewestBookUseCase;

  Future<void> getNewestBooks() async {
    emit(NewestBookLoading());
    var result = await featchNewestBookUseCase.call();
    result.fold(
      (failure) {
        emit(NewestBookError(failure.message)); 
      }, 
      (books) {
        emit(NewestBookSuccess(books));
      },
      );  
  }

}