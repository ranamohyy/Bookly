import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/helperWidgets/image_helper/assets.dart';

 class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(
            top: 40,bottom: 40, left: 30,right: 25),
        child: Row(
        children: [
          Container(
            decoration:const BoxDecoration(
                image: DecorationImage(image: AssetImage(AssetsData.logo),
            )),
            width: 85,
            height: 29,


          ),

            const Spacer(),
            IconButton(
                onPressed: (){},
                icon:  const Icon( FontAwesomeIcons.magnifyingGlass,
                size: 25,
                ))
         ],
        ),
      );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
}
