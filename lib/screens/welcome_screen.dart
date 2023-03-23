import 'package:flutter/material.dart';
import 'package:shipping_app/constants/styles.dart';
import 'package:shipping_app/responsive_helper.dart';
import 'package:shipping_app/screens/auth/signup_screen.dart';
import 'package:shipping_app/screens/auth/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.blueAccentPageBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70.0)
                    )
                ),
                child: Image.asset('assets/logo.png'),
              ),
            ),
          ),
          Expanded(

            child: Center(
              child: Container(
                decoration:const BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70)
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
                      Text("Welcome",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            wordSpacing: 2,
                          )),

                      Text(
                        "Lorem ipsum dolor sit amet.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.08),
                      Container(
                        child: ResponsiveWidget(
                          mobile: Column(
                            children: [
                              Material(
                                color:Colors.lightBlue[400] ,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignupPage(),

                                        ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8,horizontal: 110),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Material(
                                color:Colors.lightBlue[400] ,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Login(),

                                        ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8,horizontal: 120),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                              // Text(
                              //   "Copyright @2023.",
                              //   textAlign: TextAlign.center,
                              //   style: TextStyle(
                              //       fontSize: 10,
                              //       color: Colors.grey.withOpacity(0.6),
                              //       fontWeight: FontWeight.bold
                              //   ),
                              // )
                            ],
                          ),
                          tab: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Material(
                                color:Colors.lightBlue[400] ,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignupPage(),

                                        ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8,horizontal: 110),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Material(
                                color:Colors.lightBlue[400] ,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Login(),

                                        ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8,horizontal: 110),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ResponsiveWidget(
                      //     mobile: Text(''),
                      //     tab:Center(
                      //       child: Text(
                      //         "         Copyright @2023.",
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //             fontSize: 10,
                      //             color: Colors.grey.withOpacity(0.6),
                      //             fontWeight: FontWeight.bold
                      //         ),
                      //       ),
                      //     ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
