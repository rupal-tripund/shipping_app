import 'package:flutter/material.dart';
import 'package:shipping_app/constants/styles.dart';
import 'package:shipping_app/screens/welcome_screen.dart';
import 'package:shipping_app/shared/bottom_navigation.dart';


class ListByCategory extends StatefulWidget {
  const ListByCategory({Key? key}) : super(key: key);

  @override
  State<ListByCategory> createState() => _ListByCategoryState();
}

class _ListByCategoryState extends State<ListByCategory> {
  static String title = 'Electronics';
  List items = [{'id':1,'image':'assets/images/01.jpg','name':'Mobile','description':'Latest android smart phone', 'price':10000},
    {'id':1,'image':'assets/images/01.jpg','name':'TV','description':'Latest android smart phone', 'price':20000},
    {'id':2,'image':'assets/images/01.jpg','name':'Tab','description':'Latest android smart phone', 'price':15000},
    {'id':3,'image':'assets/images/01.jpg','name':'Laptop','description':'Latest android smart phone', 'price':40000},
    {'id':4,'image':'assets/images/01.jpg','name':'Earphones','description':'Latest android smart phone', 'price':1000},
    {'id':5,'image':'assets/images/01.jpg','name':'Monitor','description':'Latest android smart phone', 'price':5000}
                ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

        title: Text(title),
        backgroundColor: Style.loginPageBackgroundColor,
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            elevation: 7,
            shadowColor:Style.loginPageBackgroundColor,
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
              child: Row(

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
                              color:Style.loginPageBackgroundColor,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Style.loginPageBackgroundColor,
                    ),
                    child: Text(
                    "₹"+items[index]['price'].toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),


                  )

                ],
              ),
                  ),
            ),
          ),
        );

      },
      itemCount: items.length,
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
