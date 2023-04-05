import 'package:flutter/material.dart';

import '../../../constants/styles.dart';

class addOrderDetails extends StatefulWidget {
  const addOrderDetails({Key? key}) : super(key: key);

  @override
  State<addOrderDetails> createState() => _addOrderDetailsState();
}

class _addOrderDetailsState extends State<addOrderDetails> {
  TextEditingController orderNumber = TextEditingController();
  TextEditingController retailerName = TextEditingController();
  TextEditingController NumOfItems = TextEditingController();
  TextEditingController ProductList = TextEditingController();
  TextEditingController billingAddress = TextEditingController();
  TextEditingController shippingAddress  = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  String _items = "";
  List<String> _itemList = [
    "Mobile",
    "TV",
    "AC",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Order Detail',
              style: TextStyle(
                fontSize: Style.sizeSubTitle * 1.3,
                fontWeight: FontWeight.w400,
                color: Style.textColorLight,
              ),
            ),
          ),
          SizedBox(
            height: Style.paddingHeight,
          ),
          TextFormField(
            controller: orderNumber,
            decoration: const InputDecoration(
              prefixIcon: const Icon(Icons.numbers_outlined),
              border: OutlineInputBorder(),
              hintText: 'Order Number',
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
              hintText: 'Order Retailer Name',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                    height: 55,
                    child: TextFormField(
                      controller: NumOfItems,
                      decoration: const InputDecoration(
                        prefixIcon: const Icon(Icons.numbers_outlined),
                        border: OutlineInputBorder(),
                        hintText: 'Number of Items',
                      ),
                    ),
                  )
              ),
              SizedBox(
                width: Style.paddingWidth,
              ),
              Expanded(
                child: Container(
                  height: 55,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        hintText: 'Choose a Product',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                      value: _items.isEmpty ? null : _items,
                      isDense: true,
                      isExpanded: true,
                      onChanged: (newValue) {
                        setState(() {
                          _items = newValue!;
                        });
                      },
                      items: _itemList.map(
                              (item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }
                      ).toList(),
                    ),
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
              hintText: 'Billing Address',
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
              hintText: 'Shipping Address',
            ),
          ),
        ],
      ),
    );
  }
}




