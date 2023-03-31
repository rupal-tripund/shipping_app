import 'package:flutter/material.dart';
import 'package:shipping_app/constants/styles.dart';
import 'package:shipping_app/screens/order/cancel_order.dart';
import 'package:shipping_app/screens/welcome_screen.dart';
import 'package:shipping_app/shared/bottom_navigation.dart';
import 'package:shipping_app/shared/side_menu.dart';
import 'package:shipping_app/shared/top_navigation.dart';



class ListByCategory extends StatefulWidget {
  const ListByCategory({Key? key}) : super(key: key);

  @override
  State<ListByCategory> createState() => _ListByCategoryState();
}

class _ListByCategoryState extends State<ListByCategory> {
  List items = [{'id':1,'image':'assets/images/1.jpg','name':'Mobile','description':'Latest android smart phone', 'status':'Pending'},
    {'id':1,'image':'assets/images/1.jpg','name':'TV','description':'Latest android smart phone', 'status':'Active'},
    {'id':2,'image':'assets/images/1.jpg','name':'Tab','description':'Latest android smart phone', 'status':'Active'},
    {'id':3,'image':'assets/images/1.jpg','name':'Laptop','description':'Latest android smart phone', 'status':'Active'},
    {'id':4,'image':'assets/images/1.jpg','name':'Earphones','description':'Latest android smart phone', 'status':'Pending'},
    {'id':5,'image':'assets/images/1.jpg','name':'Monitor','description':'Latest android smart phone', 'status':'Active'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar(
      //
      //   title: Text(title),
      //   backgroundColor: Style.blueAccentPageBackgroundColor,
      // ),
      backgroundColor:Style.blueAccentPageBackgroundColor,
      drawer: SideMenu(),
      appBar: const TopNavBar(),
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Text(
                      "Order History ",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),

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
                            hintText: "Search Order No",
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
                          Container(
                            height: MediaQuery.of(context).size
                                .height*0.6,
                            width: MediaQuery.of(context).size
                                .width*0.875,
                            child: ListView.builder(itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Card(
                                    elevation: 7,

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                          onTap: (){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => WelcomeScreen(),

                                                ));
                                          },
                                          child: Column(
                                              children:[
                                              Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [

                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    child: Image.asset(items[index]['image'], width: 50,height: 100, ),
                                                  ),

                                                ),
                                                SizedBox(width: 20,),
                                                Expanded(
                                                  flex: 4,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        items[index]['name'],
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.w900,
                                                        ),
                                                      ),
                                                      SizedBox(height: 25,),
                                                      Text(
                                                        items[index]['description'],
                                                        style: TextStyle(
                                                            color: Colors.grey[600]
                                                        ),
                                                      ),
                                                      Text("View Details",
                                                        style: TextStyle(
                                                          color:Style.blueAccentPageBackgroundColor,
                                                        ),
                                                      ),


                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child:Column(
                                                      children:[
                                                  Container(
                                                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),

                                                  ),
                                                  child: Text(
                                                    items[index]['status'].toString(),
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height:24),

                                              ]
                                          )
                                      )

                                      ],
                                    ),
                                    SizedBox(height: 10.0,),
                                    // Second Element
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:[
                                          Container(
                                            child:Material(
                                              color:Colors.blue[400] ,
                                              borderRadius: BorderRadius.circular(4),
                                              child: InkWell(
                                                onTap: (){
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => CancelOrder(),

                                                      ));
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5,horizontal: 16),
                                                  child: Text(
                                                    "Track View",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,

                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child:items[index]['status'].toString()=='Active'?Material(
                                              color:Colors.redAccent[400] ,
                                              borderRadius: BorderRadius.circular(4),
                                              child: InkWell(
                                                onTap: (){
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => CancelOrder(),

                                                      ));
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5,horizontal: 16),
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,

                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ):null,
                                          ),

                                        ]
                                    )
                                    ]

                                ),
                              ),
                              ),
                              ),
                              );

                            },
                              itemCount: items.length,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 5,),
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
