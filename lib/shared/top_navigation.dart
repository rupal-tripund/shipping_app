import 'package:flutter/material.dart';

import '../constants/styles.dart';

class TopNavBar extends StatelessWidget implements PreferredSize {
  const TopNavBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              size: 35,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      backgroundColor: Style.loginPageBackgroundColor,
      actions: [
        Container(
          padding: EdgeInsets.only(right: 20, top: 5),
            child: Icon(
          Icons.shopping_cart,
          size: 35.0,
        ),
        
        )

      ],

    );
  }

  @override
  Widget get child => throw UnimplementedError();
}
