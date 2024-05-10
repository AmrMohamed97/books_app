import 'package:flutter/material.dart';

class BestSellerListViewItemLoading extends StatelessWidget {
  const BestSellerListViewItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: Colors.grey[400],
                )),
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
                        Container(
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[400],
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Container(
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[400],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: SizedBox(
                                  height: 15,
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: SizedBox(
                                  height: 15,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ]),
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
