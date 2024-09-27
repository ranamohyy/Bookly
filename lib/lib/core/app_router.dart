import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_books/lib/features/HomePage/data/models/repo/home_repo/home_repo_impelmentation.dart';
import 'package:google_books/lib/features/HomePage/presentation/views/home_view.dart';
import 'package:google_books/lib/features/book_details/peresentaion/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:google_books/lib/features/book_details/peresentaion/views/view.dart';
import '../features/HomePage/data/models/book_model/view.dart';
import '../features/HomePage/presentation/views/widgets/body_home_view.dart';
import '../features/Splash/presentation/views/splash_view.dart';
import 'get_it.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const HomePageBody(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) =>

         BookDetailsView(bookModel: state.extra as BookModel),
        ),

    ],
  );
}
