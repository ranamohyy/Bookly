import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_books/lib/features/HomePage/data/models/repo/home_repo/view.dart';

import '../../../data/models/book_model/view.dart';

part 'newset_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitialState());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoadingState());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure)
    {
      emit(NewestBooksFailureState(errMessage: failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccessState(books));
    });
  }
}
