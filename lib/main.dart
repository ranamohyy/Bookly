  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_books/lib/core/app_router.dart';
import 'package:google_books/lib/core/get_it.dart';
import 'package:google_books/lib/features/HomePage/data/models/repo/home_repo/home_repo_impelmentation.dart';
import 'package:google_books/lib/features/HomePage/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:google_books/lib/features/HomePage/presentation/manager/newest_books_cubit/newset_books_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'lib/features/book_details/peresentaion/manager/similar_books_cubit/similar_books_cubit.dart';
import 'lib/features/book_details/peresentaion/widgets/body_book_details.dart';


void main() {
  setupServiceLocator();
  runApp(const GoogleBooksApp());
}

class GoogleBooksApp extends StatelessWidget {
  const GoogleBooksApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FeaturedBooksCubit(
          getIt.get<HomeRepoImpl>(),
        )..fetchFeaturedBooks()),
        BlocProvider(create: (context) => NewestBooksCubit(
          getIt.get<HomeRepoImpl>())..fetchNewestBooks(),),
           BlocProvider(
               create: (context) => SimilarBooksCubit(
                 getIt.get<HomeRepoImpl>(),
                      ),
        ),

      ],
      child:
      MaterialApp.router(
         routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Bookly ',
          theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor,
       textTheme:GoogleFonts.montserratTextTheme(
         ThemeData.dark().textTheme,

       ),),

      ),
    );
  }
}
