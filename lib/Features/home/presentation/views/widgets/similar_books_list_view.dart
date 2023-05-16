import 'package:bookly/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_item.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/book_model/book_model.dart';
import '../../../../../core/utils/styles.dart';

class SimilarListBooksView extends StatelessWidget {
  const SimilarListBooksView({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSucess) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.books.isNotEmpty)
                  const Text(
                    'You can also like',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                if (state.books.isNotEmpty)
                  const SizedBox(
                    height: 16.0,
                  ),
                if (state.books.isNotEmpty)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.books.length,
                      itemBuilder: (context, index) => SimilarBooksItem(
                        book: state.books[index],
                      ),
                    ),
                  ),
              ],
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Text(
                  state.errMessage,
                  style: Styles.textStyly14,
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<SimilarBooksCubit>(context)
                        .fetchSimilarBooks(
                            category:
                                book.volumeInfo.categories?[0] ?? 'success');
                  },
                  child: const Text('try again'),
                ),
              ],
            ),
          );
        } else {
          return const SimilarBooksShimmer();
        }
      },
    );
  }
}
