import 'package:flutter/material.dart';

import '../../../../../core/helperWidgets/styleText/stlyes.dart';
class DetailsBook extends StatefulWidget {
  const DetailsBook({super.key, required this.authorName, required this.titleBook});
  final String authorName;
  final String titleBook;

  @override
  State<DetailsBook> createState() => _DetailsBookState();
}

class _DetailsBookState extends State<DetailsBook> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(widget.titleBook,

          style: Styles.textStyle17,
          textAlign: TextAlign.center,

        ),
        const SizedBox(height: 6,),
        Opacity(
          opacity: 0.5,
          child: Text(widget.authorName,
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w300,
                color:

                const Color(0xffFFFFFF),
              )

          ),
        ),
        const SizedBox(height: 12,),],

    );
  }
}
