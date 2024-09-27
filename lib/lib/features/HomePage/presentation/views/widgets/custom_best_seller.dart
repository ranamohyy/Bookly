import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_books/lib/core/app_router.dart';
import 'package:google_books/lib/features/HomePage/presentation/manager/newest_books_cubit/newset_books_cubit.dart';
import '../../../../../core/helperWidgets/appLoading/custom_loading_indicator.dart';
import '../../../../../core/helperWidgets/custom_error_widget/view.dart';
import '../../../../../core/helperWidgets/styleText/stlyes.dart';
import 'custom_book_image.dart';
import 'item_rate_view.dart';

class CustomBestSellerItem extends StatelessWidget {
  const CustomBestSellerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksStates>(
        builder: (context, state) {
      if (state is NewestBooksSuccessState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
              children: List.generate(
            state.books.length,
            (index) =>
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kBookDetailsView,
                      extra: state.books[index],
                    );
                  },
                  child: SizedBox(
                    height: 125,
                    child: Row(children: [
                      SizedBox(
                          height: 160,
                          width: 85,
                          child: CustomBookImage(
                              imageUrl: state.books[index].volumeInfo.imageLinks
                                      ?.thumbnail ??
                                  '')),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              child: Text(
                                state.books[index].volumeInfo.title!,
                                style: Styles.textStyle18,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              state.books[index].volumeInfo.authors![0],
                              style: Styles.textStyle18.copyWith(
                                color: Colors.white.withOpacity(.5),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                Text(
                                  "free",
                                  style: Styles.textStyle18.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                                // const SizedBox(width: 30,),
                                const Spacer(),
                                ItemRateView(
                                  rating: state
                                          .books[index].volumeInfo.averageRating
                                          ?.round() ??
                                      0,
                                  count: state.books[index].volumeInfo
                                          .ratingsCount ??
                                      0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                )),
          )),
        );
      }
      else if (state is NewestBooksLoadingState) {
        return const CustomAppLoading();
      } else if (state is NewestBooksFailureState) {
        return CustomErrorWidget(errMessage: state.errMessage);
      }
      return const SizedBox();
    });
  }
}
