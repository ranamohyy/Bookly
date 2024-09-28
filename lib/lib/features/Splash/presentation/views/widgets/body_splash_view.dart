import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:google_books/lib/core/app_router.dart';
import '../../../../../../constants.dart';
import '../../../../../core/helperWidgets/image_helper/assets.dart';
import '../../../../HomePage/presentation/views/home_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {

    navigateToHome();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.of(context).push(
            MaterialPageRoute(builder:(context) => const HomePage()));
            },
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetsData.logo),
          const SizedBox(
            height: 10,
          ),
          Animate(
            delay: const Duration(
              seconds: 5,
            ),
            child: const Text(
              "Read Free Books",
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
            ).animate().animate(onPlay: (controller) => controller.lowerBound,value: 0.1).slideY(begin: 9, end: 0,),
          )
        ],
      ),
    );
    
  }
  void navigateToHome(){
    Timer(kTranstionDuration, () {
      Get.to(const HomePage(), transition: Transition.fade);

    });
    Future.delayed(
        const  Duration(seconds: 5),
            (){
          GoRouter.of(context).push(AppRouter.kHomeView);

        });

  }
}
