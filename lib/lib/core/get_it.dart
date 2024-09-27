import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:google_books/lib/core/dio_helper/view.dart';
import 'package:google_books/lib/features/HomePage/data/models/repo/home_repo/home_repo_impelmentation.dart';
final getIt=GetIt.instance;

void setupServiceLocator(){
  getIt.registerSingleton<DioHelper>(DioHelper(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<DioHelper>(),

  ));

  
}