import 'package:bookly/Features/home/data/models/bookly_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failures.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> featchFeaturedBooks() {
    // TODO: implement featchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellersBooks() {
    // TODO: implement fetchBestSellersBooks
    throw UnimplementedError();
  }
}
