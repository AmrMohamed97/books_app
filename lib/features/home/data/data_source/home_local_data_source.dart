import 'package:books_app/constants.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getFeaturedBooks();
  List<BookEntity> getNewestBooks();
}

class HomeLocalDatasourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> getFeaturedBooks() {
    var box = Hive.box<BookEntity>(kfeaturedBooks);
    List<BookEntity> books = box.values.toList();
    return books;
  }

  @override
  List<BookEntity> getNewestBooks() {
    var box = Hive.box<BookEntity>(knewestBooks);
    List<BookEntity> books = box.values.toList();
    return books;
  }
}
