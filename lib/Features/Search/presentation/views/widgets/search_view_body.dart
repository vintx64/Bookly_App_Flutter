import 'package:bookly/Features/Search/presentation/views/widgets/search_result.dart';
import 'package:bookly/Features/home/data/models/bookly_model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomSearchTextField(),
            ),
            SearchResult(),
            Text(
              'Search Result',
              style: Styles.textStyly18.copyWith(fontFamily: 'Montserrat'),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(child: SearchResultListView()),
          ],
        ),
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            // child: BookListViewItem(),
            child: Text(''),
          );
        }));
  }
}
