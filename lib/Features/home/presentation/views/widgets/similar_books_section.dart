import 'package:bookly/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/book_model/book_model.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        SimilarListBooksView(
          book: book,
        ),
      ],
    );
  }
}
