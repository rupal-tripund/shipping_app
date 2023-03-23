import 'package:flutter/material.dart';
import 'package:shipping_app/constants/styles.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
      padding: EdgeInsets.all(0),
    children: [
      UserAccountsDrawerHeader(
      accountName: Text('Tripund'),
      accountEmail: Text('User@Tripund.com'),
      currentAccountPicture: CircleAvatar(
      child: ClipOval(
      child: Image.asset(
          'assets/user.png',
        width: 90,
        height: 90,
        fit:BoxFit.cover
      ),
      ),
      ),
        decoration: BoxDecoration(
          color: Style.loginPageBackgroundColor,
        ),
      ),
      ListTile(
        leading: Icon(Icons.shopping_basket),
        title: Text(
          ' Account',
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[800]
          ),
        ),
        // trailing: ClipOval(
        //   child: Container(
        //     color: Colors.red,
        //     width: 20,
        //     height: 20,
        //     child: Center(child: Text('8', style: TextStyle(color: Colors.white, fontSize: 12.0),)),
        //   ),
        // ),
        onTap: null,
      ),
      ListTile(
        leading: Icon(Icons.shopping_basket),
        title: Text(
            ' New Orders',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey[800]
          ),
        ),
        // trailing: ClipOval(
        //   child: Container(
        //     color: Colors.red,
        //     width: 20,
        //     height: 20,
        //     child: Center(child: Text('8', style: TextStyle(color: Colors.white, fontSize: 12.0),)),
        //   ),
        // ),
        onTap: null,
      ),
      ListTile(
        leading: Icon(Icons.shopping_basket),
        title: Text(
          ' Notification',
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[800]
          ),
        ),
        trailing: ClipOval(
          child: Container(
            color: Colors.red,
            width: 20,
            height: 20,
            child: Center(child: Text('8', style: TextStyle(color: Colors.white, fontSize: 12.0),)),
          ),
        ),
        onTap: null,
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text(
          'All Orders',
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[800]
          ),
        ),
        onTap: null,
      ),
      ListTile(
        leading: Icon(Icons.policy),
        title: Text(
          'Settings',
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[800]
          ),
        ),
        onTap: null,
      ),
      ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text(
          'About Us',
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[800]
          ),
        ),
        onTap: null,
      ),
      ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text(
          'Terms & Condition',
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[800]
          ),
        ),
        onTap: null,
      ),
      ],
    ),
    );
  }
}
