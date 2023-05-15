import 'package:bookly/Features/Search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/Features/Search/presentation/views/widgets/result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/styles.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          if (state.books.isEmpty) {
            return const Center(
              child: Text(
                'No Results',
                style: Styles.textStyly14,
              ),
            );
          } else {
            return ResultListView(
              books: state.books,
            );
          }
        } else if (state is SearchFailure) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    state.errorMessage,
                    style: Styles.textStyly14,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Lottie.asset(
                    'assets/lotties/error.json',
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ],
              ),
            ),
          );
        } else if (state is SearchLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: LinearProgressIndicator(),
          );
        } else {
          return const Text(
            'Search for any book',
            style: Styles.textStyly14,
          );
        }
      },
    );
  }
}
