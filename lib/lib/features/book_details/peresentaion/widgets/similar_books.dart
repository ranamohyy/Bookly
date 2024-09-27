import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_books/lib/core/helperWidgets/appLoading/custom_loading_indicator.dart';
import 'package:google_books/lib/features/HomePage/presentation/views/widgets/custom_book_image.dart';
import 'package:google_books/lib/features/book_details/peresentaion/manager/similar_books_cubit/similar_books_cubit.dart';

import '../../../../core/helperWidgets/custom_error_widget/view.dart';


class SimilarBooksListview extends StatefulWidget {
  const SimilarBooksListview({super.key});

  @override
  State<SimilarBooksListview> createState() => _SimilarBooksListviewState();
}

class _SimilarBooksListviewState extends State<SimilarBooksListview> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksStates>(
      builder: (context, state) {
        if (state is SimilarBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: Expanded(
              child: ListView.builder(
                  itemCount: state.books.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomBookImage(
                        imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                            '',
                      ),
                    );
                  }),
            ),
          );
        }
        else if (state is SimilarBooksFailureState) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SimilarBooksLoadingState){
          return const CustomAppLoading();
        }return const SizedBox();
      },
    );
  }
}
