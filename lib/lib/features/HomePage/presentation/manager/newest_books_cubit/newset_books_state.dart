part of 'newset_books_cubit.dart';

abstract class NewestBooksStates {}

class NewestBooksState extends NewestBooksStates {}
 class NewestBooksInitialState extends NewestBooksStates {}

 class NewestBooksLoadingState extends NewestBooksStates {}

 class NewestBooksFailureState extends NewestBooksStates {
 final String errMessage;

  NewestBooksFailureState({required this.errMessage});
 }
 class NewestBooksSuccessState extends NewestBooksStates {
 final List <BookModel>books;

  NewestBooksSuccessState(this.books);

 }
