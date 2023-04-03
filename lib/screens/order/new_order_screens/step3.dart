import 'package:flutter/material.dart';

import '../../../constants/styles.dart';

class orderStepThree extends StatefulWidget {

  @override
  State<orderStepThree> createState() => _orderStepThreeState();
}

class _orderStepThreeState extends State<orderStepThree> {
  // int _activeStepIndex = 0;

  var stepButtonLabel = "Next";

  List items = [
    {
      'id': 1,
      'image': 'assets/images/01.jpg',
      'name': 'Mobile',
      'description': 'Latest android smart phone',
      'price': 10000
    },
    {
      'id': 1,
      'image': 'assets/images/01.jpg',
      'name': 'TV',
      'description': 'Latest android smart phone',
      'price': 20000
    },
    {
      'id': 2,
      'image': 'assets/images/01.jpg',
      'name': 'Tab',
      'description': 'Latest android smart phone',
      'price': 15000
    },
    {
      'id': 3,
      'image': 'assets/images/01.jpg',
      'name': 'Laptop',
      'description': 'Latest android smart phone',
      'price': 40000
    },
    {
      'id': 4,
      'image': 'assets/images/01.jpg',
      'name': 'Earphones',
      'description': 'Latest android smart phone',
      'price': 1000
    },
    {
      'id': 5,
      'image': 'assets/images/01.jpg',
      'name': 'Monitor',
      'description': 'Latest android smart phone',
      'price': 5000
    }
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order#",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400]),
                          ),
                          const Text(
                            "123456",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Retailer",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400]),
                          ),
                          const Text(
                            "Test Description",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.877,
                              height: MediaQuery.of(context).size.height * 0.06,
                              color: Style.blueAccentPageBackgroundColor,
                              child: const Padding(
                                  padding: EdgeInsets.only(top: 8, left: 5),
                                  child: Text(
                                    "Items: 4",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.white),
                                  ))),
                          Container(
                            height: MediaQuery.of(context).size.width*0.4,
                            width: MediaQuery.of(context).size.width * 0.877,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Image.asset(
                                            items[index]['image'],
                                            width: 50,
                                            height: 100,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              items[index]['name'],
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              items[index]['description'],
                                              style: TextStyle(
                                                  color: Colors.grey[600]),
                                            ),
                                            Text(
                                              "View Details",
                                              style: TextStyle(
                                                color: Style
                                                    .blueAccentPageBackgroundColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 8.0),
                                        // color: Style.blueAccentPageBackgroundColor,
                                        child: Text(
                                          "₹${items[index]['price']}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.green,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: items.length,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.877,
                            height: MediaQuery.of(context).size.height * 0.07,
                            color: Style.blueAccentPageBackgroundColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text(
                                      "Total",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Text(
                                      "₹10000",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )))
          ),
        );

  }
}




