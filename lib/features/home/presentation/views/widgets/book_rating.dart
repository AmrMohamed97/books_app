import 'package:books_app/constants.dart';
import 'package:books_app/core/utiles/text_styles.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bookrating extends StatelessWidget {
  const Bookrating({
    super.key,
    this.mainAxisAlignment,
    required this.bookRating,
  });
  final BookEntity bookRating;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        const FaIcon(
          FontAwesomeIcons.solidStar,
          size: 15,
          color: kyellow,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          bookRating.rate.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '(${bookRating.ratingCount})',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
