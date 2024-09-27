import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_router.dart';
import '../../../../../core/helperWidgets/appLoading/custom_loading_indicator.dart';
import '../../../../../core/helperWidgets/custom_error_widget/view.dart';
import '../../manager/featured_books_cubit/featured_books_cubit.dart';
import 'custom_book_image.dart';

class FeaturedListViewBooks extends StatelessWidget {
  const FeaturedListViewBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .399,
          child: ListView.builder(
            padding:  const EdgeInsets.symmetric(horizontal: 2),
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.kBookDetailsView,
                    extra: state.books[index],
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomBookImage(
                      imageUrl:
                      state.books[index].volumeInfo.imageLinks?.thumbnail??''),
                ),
              );
            } ),
        );
      } else if (state is FeaturedBooksFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else if (state is FeaturedBooksLoading) {
        return const CustomAppLoading();
      }
      return const SizedBox();
    });
  }
}
