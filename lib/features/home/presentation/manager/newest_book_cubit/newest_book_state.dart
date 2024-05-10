import 'package:books_app/features/home/domain/entity/book_entity.dart';

abstract class NewestBookState {}

class NewestBookInitial extends NewestBookState {}
class NewestBookLoading extends NewestBookState {}  
class NewestBookPaginationLoading extends NewestBookState {}  
class NewestBookSuccess extends NewestBookState {
  final List<BookEntity> books; 
  NewestBookSuccess(this.books);    
}
class NewestBookError extends NewestBookState {
  final String message; 
  NewestBookError(this.message);    
}
class NewestBookPaginationError extends NewestBookState {
  final String message; 
  NewestBookPaginationError(this.message);    
}