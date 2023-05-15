import 'package:bookly/Features/Search/data/repos/search_repo.dart';
import 'package:bookly/core/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());
  final SearchRepo searchRepo;
  bool _closed = false;
  @override
  Future<void> close() {
    _closed = true;
    return super.close();
  }

  Future<void> fetchSearchedBooks({required String bookName}) async {
    if (_closed) return;
    emit(SearchLoading());

    var result = await searchRepo.searchBooks(bookName: bookName);
    result.fold((failure) {
      if (_closed) return;
      emit(SearchFailure(failure.errMessage));
    }, (books) {
      if (_closed) return;
      emit(SearchSuccess(books));
    });
  }
}
