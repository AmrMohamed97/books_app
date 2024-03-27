import 'package:books_app/constants.dart';
import 'package:books_app/core/utiles/assets_data.dart';
import 'package:books_app/core/utiles/text_styles.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetsData.testImage),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Harry Potter and the Deathly Hallows ',
                          style: Styles.textStyle20.copyWith(
                            fontFamily: kGTSectraFine,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Text(
                          'J. K. Rowling',
                          style: Styles.textStyle14,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '19.99 €',
                                style: Styles.textStyle20
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const Bookrating(),
                            ])
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
