import 'package:flutter/material.dart';

class CustomBookDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomBookDetailAppBar ({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),


        ),
        actions: [
          IconButton(onPressed: (){},
              icon:const Icon(Icons.shopping_cart_outlined))

        ],
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
