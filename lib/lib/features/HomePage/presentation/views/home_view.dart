import 'package:flutter/material.dart';
import 'package:google_books/lib/features/HomePage/presentation/views/widgets/body_home_view.dart';
import 'package:google_books/lib/features/HomePage/presentation/views/widgets/custom_appBar_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),

      body: HomePageBody(
     ),
    );
  }
}

