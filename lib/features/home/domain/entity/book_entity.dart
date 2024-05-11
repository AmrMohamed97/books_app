import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity extends HiveObject {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? imageUrl;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? author;
  @HiveField(4)
  final num? rate;
  @HiveField(5)
  final num? ratingCount;

  BookEntity( {
    required this.bookId,
    required this.imageUrl,
    required this.title,
    required this.author,
    this.rate,
    this.ratingCount,
  });
}
