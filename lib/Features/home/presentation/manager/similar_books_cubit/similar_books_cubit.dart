import 'package:bookly/core/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  bool _closed = false;

  @override
  Future<void> close() {
    _closed = true;
    return super.close();
  }

  Future fetchSimilarBooks({required String category}) async {
    if (_closed) return;
    emit(SimilarBooksLoading());
    var result = await homeRepo.featchSimilarBooks(category: category);
    result.fold((failure) {
      if (_closed) return;
      emit(SimilarBooksFailure(failure.errMessage));
    }, (books) {
      if (_closed) return;
      emit(SimilarBooksSucess(books));
    });
  }
}
