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
    var size = MediaQuery.of(context).size;
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
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: (size.height / 75), horizontal: (size.width / 90)),
              prefixIcon: const Icon(Icons.numbers_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 0.90 , color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 0.95, color: Colors.grey),
              ),
              hintText: 'Order Number',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: retailerName,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: (size.height / 75), horizontal: (size.width / 90)),
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 0.90 , color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 0.95, color: Colors.grey),
              ),
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
                  child: TextFormField(
                    controller: NumOfItems,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: (size.height / 75), horizontal: (size.width / 90)),
                      prefixIcon: const Icon(Icons.numbers_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(width: 0.90 , color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(width: 0.95, color: Colors.grey),
                      ),
                      hintText: 'Number of Items',
                    ),
                  )
              ),
              SizedBox(
                width: Style.paddingWidth,
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: (size.height / 80), horizontal: (size.width / 90)),
                      prefixIcon: const Icon(Icons.shopping_cart),
                      hintText: 'Product',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(width: 0.90 , color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(width: 0.95, color: Colors.grey),
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
            ],
          ),

          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: billingAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: (size.height / 75), horizontal: (size.width / 90)),
              prefixIcon: const Icon(Icons.home),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 0.90 , color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 0.95, color: Colors.grey),
              ),
              hintText: 'Billing Address',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: shippingAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: (size.height / 75), horizontal: (size.width / 90)),
              prefixIcon: const Icon(Icons.home),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 0.90 , color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 0.95, color: Colors.grey),
              ),
              hintText: 'Shipping Address',
            ),
          ),
        ],
      ),
    );
  }
}




