import 'dart:developer';

import 'package:books_app/constants.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getFeaturedBooks({int startIndex = 0});
  List<BookEntity> getNewestBooks({int startIndex=0});
}

class HomeLocalDatasourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> getFeaturedBooks({int startIndex = 0}) {
    var box = Hive.box<BookEntity>(kfeaturedBooks);
    int startPage = startIndex * 10;
    int endPage = (startIndex + 1) * 10;
    int length = box.values.length - 1;
    if (startPage >= length) {
      return [];
    }
    if (endPage > length && length > startPage) {
      return box.values.toList().sublist(startPage, length + 1);
    }
    List<BookEntity> books = box.values.toList().sublist(startPage, endPage);
    return books;
  }

  @override
  List<BookEntity> getNewestBooks({int startIndex=0}) {
    var box = Hive.box<BookEntity>(knewestBooks);
    int startPage=startIndex*10;
    int endPage=startIndex+1*10;
    int length=box.values.length-1;
    if(startPage>=length){
      return [];
    }
    if(startPage<length && endPage>length){
      return box.values.toList().sublist(startPage,length+1);
    }
    List<BookEntity> books = box.values.toList().sublist(startPage,endPage);
    return books;
  }
}
