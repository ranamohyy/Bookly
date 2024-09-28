import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../HomePage/data/models/book_model/view.dart';
import '../manager/similar_books_cubit/similar_books_cubit.dart';
import '../widgets/body_book_details.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.bookModel.volumeInfo.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
    return BookDetailsBody(
      bookModel: widget.bookModel,
    );
  }
}
