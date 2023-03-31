import 'package:flutter/material.dart';
import 'package:shipping_app/constants/styles.dart';
import 'package:shipping_app/shared/side_menu.dart';
import 'package:shipping_app/shared/top_navigation.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:shipping_app/shared/bottom_navigation.dart';

import 'add_order_detail.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _activeStepIndex = 0;

  TextEditingController orderNumber = TextEditingController();
  TextEditingController retailerName = TextEditingController();
  TextEditingController NumOfItems = TextEditingController();
  TextEditingController ProductList = TextEditingController();
  TextEditingController billingAddress = TextEditingController();
  TextEditingController shippingAddress  = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
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

  List<Step> stepList() => [
        //Step 1
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('New Order'),
          content: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height*0.55,
              width:MediaQuery.of(context).size.height*0.85,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: orderNumber,
                      decoration: const InputDecoration(
                        prefixIcon: const Icon(Icons.numbers_outlined),
                        border: OutlineInputBorder(),
                        labelText: 'Order Number',
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                        controller: retailerName,
                        decoration: const InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(),
                          labelText: 'Order Retailer Name',
                        ),
                      ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                          Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.08,
                                width: MediaQuery.of(context).size.width*0.4,
                                margin: EdgeInsets.only(right: 10, bottom: 10),
                                child: TextFormField(
                                controller: NumOfItems,

                                decoration: const InputDecoration(
                                prefixIcon: const Icon(Icons.numbers_outlined),

                                labelText: 'Number of Items',
                                ),
                                ),
                              )
                          ),

                      Expanded(
                        // height: MediaQuery.of(context).size.height*0.095,
                        // width: MediaQuery.of(context).size.width*0.4,
                        child: DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            showSelectedItems: true,

                          ),
                          items: ["Brazil", "Italia", "Tunisia", 'Canada', 'Canada', ],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(

                            ),
                          ),
                          onChanged: print,
                          selectedItem: "Choose a Product",

                        ),
                      ),
                    ],
                    ),

                    const SizedBox(
                      height: 8,
                    ),
                      TextFormField(
                        controller: billingAddress,
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: const Icon(Icons.home),
                          border: OutlineInputBorder(),
                          labelText: 'Billing Address',
                        ),
                      ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: shippingAddress,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: const Icon(Icons.home),
                        border: OutlineInputBorder(),
                        labelText: 'Shipping Address',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Step 2
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('Address'),
            content: Container(
              height: MediaQuery.of(context).size.height*0.6,
              child:AddOrderDetails()
            )),
        //Step 3
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('Confirm'),
            content: Container(
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
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Style.blueAccentPageBackgroundColor,
      drawer: SideMenu(),
      appBar: const TopNavBar(),
      body: SafeArea(
    child: SingleChildScrollView(
    child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text(
                " New Order",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),

            ],
          ),
        ),

// Categories Widgets
        Container(
          padding: EdgeInsets.only(top: 30),
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
                padding: const EdgeInsets.only(left: 1.0,right: 1.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.8,
                  child: Stepper(
                    type: StepperType.horizontal,
                    currentStep: _activeStepIndex,
                    controlsBuilder: (BuildContext context, ControlsDetails controls) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 160,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: controls.onStepContinue,
                              child: _activeStepIndex != 2
                                  ? const Text("Next")
                                  : const Text("Make Payment"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Style.blueAccentPageBackgroundColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: controls.onStepCancel,
                              child: const Text('Cancel'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Style.blueAccentPageBackgroundColor,
                                  side: const BorderSide(
                                    width: 1.0,
                                    color: Colors.lightBlueAccent,
                                  )),
                            ),
                          ),
                        ],
                      );
                    },
                    steps: stepList(),
                    onStepContinue: () {
                      if (_activeStepIndex < (stepList().length - 1)) {
                        setState(() {
                          _activeStepIndex += 1;
                        });
                      } else {
                        print('Submited');
                      }
                    },
                    onStepCancel: () {
                      if (_activeStepIndex == 0) {
                        return;
                      }

                      setState(() {
                        _activeStepIndex -= 1;
                      });
                    },
                    onStepTapped: (int index) {
                      setState(() {
                        _activeStepIndex = index;
                      });
                    },
                  ),
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

