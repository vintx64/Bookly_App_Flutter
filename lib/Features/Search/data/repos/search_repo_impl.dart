import 'package:bookly/Features/Search/data/repos/search_repo.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/Features/home/data/models/bookly_model/book_model.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  SearchRepoImpl(this._apiService);
  final ApiService _apiService;
  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String bookName}) async {
    try {
      var data = await _apiService.get(
          endPoint:
              'volumes?q=intitle:$bookName&Filtering=free-ebooks&download=epub');
      List<BookModel> books = [];
      if (data['items'] != null) {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
