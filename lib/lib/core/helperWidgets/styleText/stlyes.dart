import 'package:flutter/material.dart';

import '../../../../constants.dart';

abstract class Styles{
  static var textStyle20 = const TextStyle(
    decoration:TextDecoration.none,

    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const textStyle18 =TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w600,
    decoration:TextDecoration.none,
    color: Colors.white,


  );
  static const textStyle15 =TextStyle(
    decoration:TextDecoration.none,

    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Color(0xff707070),


  );
  static const textStyle17 =TextStyle(
    decoration:TextDecoration.none,

    fontSize: 17,
    fontWeight: FontWeight.w500,


  );
  static const textStyle30 =TextStyle(
    decoration:TextDecoration.none,

    fontSize: 30,
      fontWeight: FontWeight.w500,
  );
}