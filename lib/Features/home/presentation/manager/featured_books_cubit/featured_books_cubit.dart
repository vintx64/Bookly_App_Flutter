import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/Features/home/data/models/bookly_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_cubit_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksCubitState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksCubitInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturdBooks() async {
    emit(FeaturedBooksCubitLoading());
    var result = await homeRepo.featchFeaturedBooks();
    result.fold((failure) {
      emit(
        FeaturedBooksCubitFailure(failure.errMessage),
      );
    }, (books) {
      emit(
        FeaturedBooksCubitSucess(books),
      );
    });
  }
}
