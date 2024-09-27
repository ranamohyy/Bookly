import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_books/lib/features/HomePage/data/models/repo/home_repo/view.dart';

import '../../../../../../core/dio_helper/view.dart';
import '../../../../../../core/error/failures.dart';
import '../../book_model/view.dart';

 class HomeRepoImpl implements HomeRepo {
   final DioHelper dioHelper;

   HomeRepoImpl(this.dioHelper);

   @override
   Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
     try {
       var data = await dioHelper.get(
           endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
       List<BookModel>books = [];
       for (var item in data['items']) {
         try {
           books.add(BookModel.fromJson(item));
         } catch (e) {
           books.add(BookModel.fromJson(item));
         }
       }

       return right(books);
     } catch (e) {
       if (e is DioException) {
         return left(ServerFailure.fromDioException(e));
       }
       return left(ServerFailure(e.toString(),
       ),
       );
     }
   }

   @override
   Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
     try {
       var data = await dioHelper.get(
           endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');

       List<BookModel>books = [];
       for (var item in data ['items']) {
         books.add(BookModel.fromJson(item));
       }

       return right(books);
     } catch (e) {
       if (e is DioException) {
         return left(ServerFailure.fromDioException(e));
       }
       return left(
         ServerFailure(e.toString(),
         ),
       );
     }
   }

   @override
   Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
       {required String categories}) async {
     try {
       var data = await dioHelper.get(
           endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');
       List<BookModel>books = [];
       for (var item in data['items']) {
         books.add(BookModel.fromJson(item));
       }

       return right(books);
     } catch (e) {
       if (e is DioException) {
         return left(ServerFailure.fromDioException(e));
       }
       return left(ServerFailure(e.toString(),
       ),
       );
     }
   }
 }
