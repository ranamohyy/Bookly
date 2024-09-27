import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
    required this.backgroundColor,
    this.borderRadius, required this.textStyle,
    required this.text});

final Color backgroundColor;
final BorderRadius? borderRadius;
final TextStyle textStyle;
final Text text;
  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height: 48,
      child: TextButton(

style:TextButton.styleFrom(
  backgroundColor: backgroundColor,
  shape: RoundedRectangleBorder(
      borderRadius:borderRadius ?? BorderRadiusDirectional.circular(16)
  ),),



        onPressed: (){},


        child: Text(
         "$text",
          style: textStyle,

        ),
      ),
    );
  }
}
