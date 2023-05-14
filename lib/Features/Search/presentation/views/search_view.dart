import 'package:bookly/Features/Search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/Features/Search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/models/bookly_model/book_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    BlocProvider.of<SearchCubit>(context)
        .fetchSearchedBooks(bookName: widget.bookModel.volumeInfo.title![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchViewBody(
          bookModel: widget.bookModel,
        ),
      ),
    );
  }
}
