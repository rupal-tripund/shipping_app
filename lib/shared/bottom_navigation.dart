import 'package:flutter/material.dart';
import 'package:shipping_app/constants/styles.dart';
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Style.loginPageBackgroundColor,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.backpack_sharp),
            label: 'Order'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Buy Again'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Account'
        )
      ],
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
