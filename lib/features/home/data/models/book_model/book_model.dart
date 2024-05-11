 
import 'package:books_app/features/home/domain/entity/book_entity.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

class BookModel extends BookEntity {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

   BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }): super(
    bookId: id!,
    imageUrl: volumeInfo?.imageLinks?.thumbnail,
    title: volumeInfo!.title!,
    author: volumeInfo.authors?.first??'private',
    rate: volumeInfo.averageRating?? 0,
    ratingCount: volumeInfo.ratingsCount?? 0,
  );

  factory BookModel.fromJsom(Map<String, dynamic> json) => BookModel(
        kind: json['kind'] as String?,
        id: json['id'] as String?,
        etag: json['etag'] as String?,
        selfLink: json['selfLink'] as String?,
        volumeInfo: json['volumeInfo'] == null
            ? null
            : VolumeInfo.fromJsom(json['volumeInfo'] as Map<String, dynamic>),
        saleInfo: json['saleInfo'] == null
            ? null
            : SaleInfo.fromJsom(json['saleInfo'] as Map<String, dynamic>),
        accessInfo: json['accessInfo'] == null
            ? null
            : AccessInfo.fromJsom(json['accessInfo'] as Map<String, dynamic>),
        searchInfo: json['searchInfo'] == null
            ? null
            : SearchInfo.fromJsom(json['searchInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJsom() => {
        'kind': kind,
        'id': id,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo?.toJsom(),
        'saleInfo': saleInfo?.toJsom(),
        'accessInfo': accessInfo?.toJsom(),
        'searchInfo': searchInfo?.toJsom(),
      };

 
}
