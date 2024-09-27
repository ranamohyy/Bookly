part of 'similar_books_cubit.dart';

abstract class SimilarBooksStates {}

final class SimilarBooksInitial extends SimilarBooksStates {}

class SimilarBooksLoadingState extends SimilarBooksStates {}

class SimilarBooksFailureState extends SimilarBooksStates {
  final String errMessage;

  SimilarBooksFailureState({required this.errMessage});
}
class SimilarBooksSuccessState extends SimilarBooksStates {
  final List <BookModel> books;

  SimilarBooksSuccessState(this.books);

}