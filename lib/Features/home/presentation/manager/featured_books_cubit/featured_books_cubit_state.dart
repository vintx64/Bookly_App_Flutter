part of 'featured_books_cubit_cubit.dart';

abstract class FeaturedBooksCubitState extends Equatable {
  const FeaturedBooksCubitState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksCubitInitial extends FeaturedBooksCubitState {}

class FeaturedBooksCubitLoading extends FeaturedBooksCubitState {}

class FeaturedBooksCubitFailure extends FeaturedBooksCubitState {
  final String errMessage;

  const FeaturedBooksCubitFailure(this.errMessage);
}

class FeaturedBooksCubitSucess extends FeaturedBooksCubitState {
  final List<BookModel> books;

  const FeaturedBooksCubitSucess(this.books);
}
