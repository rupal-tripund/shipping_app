import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shipping_app/constants/styles.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: SafeArea(
        top: false,
        child: CurvedNavigationBar(
          index: _index,
          items: [
            Icon(Icons.home, size: Style.sizeIcon / 1.3, color: _index == 0 ? Style.textColorDark : Style.textColorGrey),
            Icon(Icons.manage_accounts, size: Style.sizeIcon / 1.3, color: _index == 1 ? Style.textColorDark : Style.textColorGrey),
            Icon(Icons.notifications, size: Style.sizeIcon / 1.3, color: _index == 2 ? Style.textColorDark : Style.textColorGrey),
            Icon(Icons.settings, size: Style.sizeIcon / 1.3, color: _index == 3 ? Style.textColorDark : Style.textColorGrey)
          ],
          height: 60,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 200),
          color: Colors.grey.shade100,
          buttonBackgroundColor: Colors.blue,
          backgroundColor: Style.primaryBackgroundColor,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}

