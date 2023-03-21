import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shipping_app/shared/bottom_navigation.dart';
import 'package:shipping_app/widgets/CategoriesWidget.dart';
import 'package:shipping_app/widgets/banners.dart';
import '../../constants/styles.dart';
import 'package:shipping_app/screens/auth/login.dart';
import 'package:shipping_app/screens/auth/signup_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.loginPageBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20, left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Style.loginPageBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                blurRadius: 2)
                          ]),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          CupertinoIcons.profile_circled,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet.",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 250,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search here...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.filter_list),
                  ],
                ),
              ),
// Categories Widgets
              Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0,right: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Category",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Style.loginPageBackgroundColor,
                            ),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Style.loginPageBackgroundColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    CategoriesWidget(),
                    BannerWidget(),
                    SizedBox(height: 10,),
                    Container(
                      color: Style.loginPageBackgroundColor,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Text(
                            "Terms & Condition",
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed  .",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
