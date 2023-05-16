import 'package:bookly/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/book_model/book_model.dart';
import '../../../../../core/utils/app_router.dart';

class SimilarBooksItem extends StatelessWidget {
  const SimilarBooksItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: book);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: CustomBookImage(
          borderRadius: 8.0,
          imgUrl: book.volumeInfo.imageLinks?.thumbnail,
        ),
      ),
    );
  }
}
