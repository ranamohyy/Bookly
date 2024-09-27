import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../book_model/view.dart';

abstract class HomeRepo{
   Future<Either<Failure,List<BookModel>>> fetchNewestBooks()  ;         //arguments
  Future<Either<Failure,List<BookModel>>>fetchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>>fetchSimilarBooks( {required String categories });
}