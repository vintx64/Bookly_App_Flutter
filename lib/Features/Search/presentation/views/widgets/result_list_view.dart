import 'package:bookly/Features/home/data/models/bookly_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newset_books_list_view_item.dart';
import 'package:flutter/material.dart';

class ResultListView extends StatelessWidget {
  const ResultListView({super.key, required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 24.0),
        physics: const BouncingScrollPhysics(),
        itemCount: books.length,
        itemBuilder: (context, index) =>
            NewsetBooksListViewItem(bookModel: books[index]),
      ),
    );
  }
}
