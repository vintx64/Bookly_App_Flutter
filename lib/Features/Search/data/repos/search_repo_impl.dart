import 'package:bookly/Features/Search/data/repos/search_repo.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/Features/home/data/models/bookly_model/book_model.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  SearchRepoImpl(ApiService apiService);

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String bookName}) async {
    try {
      var response = await Dio().get(
          "https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks &q=intitle:$bookName");

      List<BookModel> books = [];
      for (var item in response.data["items"]) {
        books.add(BookModel.fromJson(item));
      }

      return Right(books);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
