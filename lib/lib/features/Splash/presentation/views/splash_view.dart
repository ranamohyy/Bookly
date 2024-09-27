import 'package:flutter/material.dart';
import 'package:google_books/lib/features/Splash/presentation/views/widgets/body_splash_view.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: SplashViewBody(),
    );
  }
}
