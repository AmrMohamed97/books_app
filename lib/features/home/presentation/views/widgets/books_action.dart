import 'package:books_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            title: '19.99 €',
          ),
        ),
        Expanded(
          child: CustomButton(
            backgroundColor: Color(0xffEF8262),
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            title: 'free Preview',
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
