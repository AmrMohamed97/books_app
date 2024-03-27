import 'package:books_app/constants.dart';
import 'package:books_app/core/utiles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bookrating extends StatelessWidget {
  const Bookrating({
    super.key,
    this.mainAxisAlignment,
  });
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
        const Text(
          '4.5',
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '(2457)',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
