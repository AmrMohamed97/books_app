import 'package:books_app/constants.dart';
import 'package:books_app/core/utiles/api_services.dart';
import 'package:books_app/core/utiles/functions/add_books_to_box.dart';
import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchNewestBooks({int startIndex = 0});
  Future<List<BookEntity>> fetchFeaturedBooks({int startIndex = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int startIndex = 0}) async {
    Map<String, dynamic> data = await apiServices.get(
        endPonit:
            'volumes?Filtering=free-ebooks&sorting=featured&startIndex${startIndex * 10}&q=programming');
    List<BookEntity> books = getBooksList(data);
    addBooksToBox(books, kfeaturedBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int startIndex = 0}) async {
    Map<String, dynamic> data = await apiServices.get(
        endPonit:
            'volumes?Filtering=free-ebooks&sorting=newest&startIndex${startIndex * 10}&q=computer science');
    List<BookEntity> books = getBooksList(data);
    addBooksToBox(books, knewestBooks);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var book in data['items']) {
      books.add(BookModel.fromJsom(book));
    }
    return books;
  }
}
