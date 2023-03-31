import 'package:flutter/material.dart';
import 'package:shipping_app/screens/auth/forgetPassword/EmailVerification.dart';
import 'package:shipping_app/screens/auth/forgetPassword/resetPassword.dart';
import 'package:shipping_app/screens/auth/forgetPassword/sendOTP.dart';
import 'package:shipping_app/screens/auth/login.dart';
import 'package:shipping_app/screens/auth/signup_screen.dart';

import 'package:shipping_app/screens/welcome_screen.dart';

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
                  initialRoute: '/',
                  routes: {
                    '/' : (context) => const  WelcomeScreen(),
                    '/login': (context) => const Login(),
                    '/signUp': (context) => const SignupPage(),
                    '/forgetPassword/email-verification': (context) => const CheckEmail(),
                    '/forgetPassword/send-otp': (context) => const CheckOTP(),
                    '/forgetPassword/reset-password': (context) => const ResetPassword(),
                  },
                );
              }
          );
        }
    );
  }
}

