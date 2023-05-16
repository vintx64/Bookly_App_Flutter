import 'package:flutter/material.dart';

import '../../../../../core/book_model/book_model.dart';
import '../../../../../core/utils/styles.dart';

class BooksDescription extends StatelessWidget {
  const BooksDescription({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 32.0),
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //desc
          const Text(
            'description:',
            style: Styles.textStyly16,
          ),
          Text(
            bookModel.volumeInfo.description ?? 'there is no description',
            style: Styles.textStyly14,
          ),
          const SizedBox(
            height: 6.0,
          ),

          //language
          const Text(
            'language:',
            style: Styles.textStyly16,
          ),
          Text(
            bookModel.volumeInfo.language ?? '-',
            style: Styles.textStyly14,
          ),
          const SizedBox(
            height: 6.0,
          ),

          //publisher
          const Text(
            'publisher:',
            style: Styles.textStyly16,
          ),
          Text(
            bookModel.volumeInfo.publisher ?? '-',
            style: Styles.textStyly14,
            maxLines: 2,
          ),
          const SizedBox(
            height: 6.0,
          ),

          //publish date
          const Text(
            'published at:',
            style: Styles.textStyly16,
          ),
          Text(
            bookModel.volumeInfo.publishedDate ?? '-',
            style: Styles.textStyly14,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
