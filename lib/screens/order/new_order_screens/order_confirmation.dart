import 'package:flutter/material.dart';
import '../../../constants/styles.dart';


class viewOrderList extends StatefulWidget {
  const viewOrderList({Key? key}) : super(key: key);

  @override
  State<viewOrderList> createState() => _viewOrderListState();
}

class _viewOrderListState extends State<viewOrderList> {
  List _items = [
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
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Order Confirmation',
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
          Align(
            alignment: Alignment.center,
            child: Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:Style.paddingHeight,
                  vertical: Style.paddingWidth,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Order No : ',
                            style: TextStyle(
                            fontSize: Style.sizeSubTitle * 1,
                              fontWeight: FontWeight.bold,
                              color: Style.blueAccentPageBackgroundColor,
                            ),
                          ),
                          Text(
                            '5689045673',
                            style: TextStyle(
                            fontSize: Style.sizeSubTitle * 1,
                              fontWeight: FontWeight.w400,
                              color: Style.textColorLight,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: Style.paddingHeight / 1.5,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Total No of Items : ',
                            style: TextStyle(
                              fontSize: Style.sizeSubTitle * 1,
                              fontWeight: FontWeight.bold,
                              color: Style.blueAccentPageBackgroundColor,
                            ),
                          ),
                          Text(
                            '4',
                            style: TextStyle(
                              fontSize: Style.sizeSubTitle * 1,
                              fontWeight: FontWeight.w400,
                              color: Style.textColorLight,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: Style.paddingHeight / 1.5,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Total Cost : ',
                            style: TextStyle(
                              fontSize: Style.sizeSubTitle * 1,
                              fontWeight: FontWeight.bold,
                              color: Style.blueAccentPageBackgroundColor,
                            ),
                          ),
                          Text(
                            '300000',
                            style: TextStyle(
                              fontSize: Style.sizeSubTitle * 1,
                              fontWeight: FontWeight.w400,
                              color: Style.textColorLight,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: Style.paddingHeight / 1.5,
                      ),
                      Text(
                        'Items : ',
                        style: TextStyle(
                          fontSize: Style.sizeSubTitle * 1,
                          fontWeight: FontWeight.bold,
                          color: Style.blueAccentPageBackgroundColor,
                        ),
                      ),
                      SizedBox(
                        height: Style.paddingHeight / 3,
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 4.5,
                        child: ListView.builder(
                          padding: EdgeInsets.all(0.0),
                          itemCount: _items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                  _items[index]['name'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  _items[index]['description'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





