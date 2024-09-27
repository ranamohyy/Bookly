import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/helperWidgets/styleText/stlyes.dart';

class ItemRateView extends StatelessWidget {
   const ItemRateView({super.key, required this.rating, required this.count,  this.mainAxisAlignment=MainAxisAlignment.start});
final num rating;
final int count;
   final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        size: 14,
        ),
        const SizedBox(width: 6,),
         Text(rating.toString(),
          style: Styles.textStyle18,

        ),
        const SizedBox(width: 8,),

        Opacity(
          opacity: 0.5,
          child: Text("($count)",

    style: Styles.textStyle18.copyWith(
    fontWeight: FontWeight.w300,
    color:

    const Color(0xffFFFFFF),

            ),),

          ),

      ],
    );
  }
}
