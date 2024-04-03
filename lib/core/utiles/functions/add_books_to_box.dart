import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:hive/hive.dart';

Future<void> addBooksToBox(List<BookEntity> books,String boxName) async {
  var box = Hive.box<BookEntity>(boxName);
  await box.addAll(books);
}
