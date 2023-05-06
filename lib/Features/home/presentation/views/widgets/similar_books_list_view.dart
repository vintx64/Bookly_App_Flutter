import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarListBooksView extends StatelessWidget {
  const SimilarListBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(
                imgUrl:
                    'https://img.freepik.com/premium-vector/ninja-boy-meditation-mode_7814-625.jpg',
              ),
            );
          }),
    );
  }
}
