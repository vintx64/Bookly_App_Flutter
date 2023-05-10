import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../home/data/models/bookly_model/book_model.dart';

abstract class SearchBooks {
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String bookName});
}
