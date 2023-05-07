import 'package:bookly/Features/home/data/models/bookly_model/book_model.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks();
  Future<Either<Failure, List<BookModel>>> featchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> featchSimilarBooks(
      {required String category});
}
