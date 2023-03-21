import 'package:flutter/material.dart';
import 'package:shipping_app/screens/welcome_screen.dart';
import 'package:shipping_app/screens/home_screen.dart';
import 'package:shipping_app/screens/auth/signup_screen.dart';
import 'package:shipping_app/screens/auth/login.dart';
import 'constants/styles.dart';
import 'package:shipping_app/constants/size_config.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (contexts, constraints){
          return OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Style.primaryThemeColor,
                    scaffoldBackgroundColor: Style.primaryBackgroundColor,
                  ),
                  home: HomePage(),
                );
              }
          );
        }
    );
  }
}

