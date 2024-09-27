
import 'package:flutter/material.dart';
import '../../../../../core/helperWidgets/styleText/stlyes.dart';
import 'Custom_featured_books.dart';
import 'custom_best_seller.dart';

class HomePageBody extends StatelessWidget {
const   HomePageBody({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(physics: BouncingScrollPhysics(), slivers: [

    SliverToBoxAdapter(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FeaturedListViewBooks(),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Best Seller",
              style: Styles.textStyle18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // ),
        ]),
      ),
      SliverToBoxAdapter(
         child: CustomBestSellerItem()
               ),
    ]);
  }
}
