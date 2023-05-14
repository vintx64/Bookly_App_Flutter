import 'package:bookly/Features/Search/data/repos/search_repo.dart';
import 'package:bookly/Features/home/data/models/bookly_model/book_model.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks({required String bookName}) async {
    emit(SearchLoading());

    var result = await searchRepo.searchBooks(bookName: bookName);
    result.fold((failure) {
      emit(SearchFailure(failure.errMessage));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}
