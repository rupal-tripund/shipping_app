import 'package:flutter/material.dart';

import 'package:dropdown_search/dropdown_search.dart';


class NewOrderDetails extends StatelessWidget {


  TextEditingController orderNumber = TextEditingController();
  TextEditingController retailerName = TextEditingController();
  TextEditingController NumOfItems = TextEditingController();
  TextEditingController ProductList = TextEditingController();
  TextEditingController billingAddress = TextEditingController();
  TextEditingController shippingAddress  = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                              height: 55,
                              // width: MediaQuery.of(context).size.width*0.4,
                              margin: EdgeInsets.only(right: 10, bottom: 10),
                              child: TextFormField(
                                controller: NumOfItems,

                                decoration: const InputDecoration(
                                  prefixIcon: const Icon(Icons.numbers_outlined),
                                  border: OutlineInputBorder(),
                                  labelText: 'Number of Items',
                                ),
                              ),
                            )
                        ),

                        Expanded(
                          // height: MediaQuery.of(context).size.height*0.095,
                          // width: MediaQuery.of(context).size.width*0.4,
                          child: Container(
                            margin: EdgeInsets.only(right: 10, bottom: 10),
                            child: DropdownSearch<String>(
                              popupProps: PopupProps.menu(
                                showSelectedItems: true,

                              ),
                              items: ["Brazil", "Italia", "Tunisia", 'Canada', 'Canada', ],
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 20.0,bottom:20, left:10),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              onChanged: print,
                              selectedItem: "Choose a Product",

                            ),
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
    );
  }
}




