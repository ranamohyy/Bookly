import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_books/lib/features/HomePage/data/models/book_model/view.dart';
import 'package:google_books/lib/features/HomePage/data/models/repo/home_repo/view.dart';
part 'similar_books_state.dart';
class SimilarBooksCubit extends Cubit<SimilarBooksStates> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category})async{
    emit (SimilarBooksLoadingState());
        var result = await homeRepo.fetchSimilarBooks(categories: category);
    result.fold(
            (failure){
              emit(SimilarBooksFailureState(
                errMessage: failure.errMessage
              ));

            },


            (books){emit(SimilarBooksSuccessState(books));


            });

  }


}
