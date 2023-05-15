import 'package:bookly/core/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<BookModel>>> featchFeaturedBooks() async {
    try {
      var data = await _apiService.get(
          endPoint:
              'volumes?q=subject:fantasy&Sorting=relevance &Filtering=free-ebooks&maxResults=40&download=epub');
      List<BookModel> featuredBooks = [];
      for (var item in data['items']) {
        featuredBooks.add(BookModel.fromJson(item));
      }
      return right(featuredBooks);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> featchSimilarBooks(
      {required String category}) async {
    try {
      var data = await _apiService.get(
          endPoint:
              'volumes?q=subject:$category&Sorting=relevance &Filtering=free-ebooks&maxResults=40&download=epub');
      List<BookModel> featuredBooks = [];
      if (data['items'] != null) {
        for (var item in data['items']) {
          featuredBooks.add(BookModel.fromJson(item));
        }
      }
      return right(featuredBooks);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
    try {
      var data = await _apiService.get(
          endPoint:
              'volumes?q=subject:Fiction &Filtering=free-ebooks&maxResults=40&download=epub');
      List<BookModel> newestBooks = [];
      for (var item in data['items']) {
        newestBooks.add(BookModel.fromJson(item));
      }
      return right(newestBooks);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
