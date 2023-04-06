import 'package:flutter/material.dart';
import 'package:shipping_app/constants/styles.dart';
import '../screens/order/history.dart';
import '../screens/order/new_order_screens/new_order_screen.dart';
import '../widgets/profile_settings.dart';

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
          color: Style.blueAccentPageBackgroundColor,
        ),
      ),
      InkWell(
        child: ListTile(
          leading: Icon(Icons.person),

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
          onTap: (){
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileSettingScreen(),
              ),
                  (route)=>false,
            );
          },
        ),
      ),
    InkWell(
    child:
      ListTile(
        leading: Icon(Icons.add),
        title: Text(
            ' New Orders',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey[800]
          ),
        ),

        onTap: (){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => newOrderMultipleForm(),
            ),
                (route)=>false,
          );
        },
      ),
    ),
      ListTile(
        leading: Icon(Icons.notification_important_sharp),
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
      InkWell(
        child: ListTile(
          leading: Icon(Icons.bookmark_border),
          title: Text(
            'All Orders',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[800]
            ),
          ),
          onTap: (){
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => GetHistory(),
              ),
              (route)=>false,
            );
          },
        ),
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.settings),
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
        leading: Icon(Icons.info_outline),
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
        leading: Icon(Icons.indeterminate_check_box_sharp),
        title: Text(
          'Terms & Condition',
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[800]
          ),
        ),
        onTap: null,
      ),
      ListTile(
        leading: Icon(Icons.indeterminate_check_box_sharp),
        title: Text(
          'Logout',
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
