import 'package:flutter/material.dart';
import 'package:shipping_app/screens/order/tracker.dart';
import 'package:shipping_app/shared/side_menu.dart';
import '../../constants/styles.dart';
import '../../shared/bottom_navigation.dart';
import 'cancel_order.dart';
import 'view_order_detail.dart';

class GetHistory extends StatefulWidget {
  const GetHistory({Key? key}) : super(key: key);

  @override
  State<GetHistory> createState() => _GetHistoryState();
}

class _GetHistoryState extends State<GetHistory> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 60,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        centerTitle: true,
        title: Text(
          'Order History',
          style: TextStyle(
            color: Style.textColorDark,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
              colors: [Style.blueAccentPageBackgroundColor, Style.blueAccentPageBackgroundColor],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
            },
          ),
        ],
        bottom: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 60,
          elevation: 0.0,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          backgroundColor: Style.blueAccentPageBackgroundColor,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Center(
              child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
            child: _getOrderHistory(),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class _getOrderHistory extends StatefulWidget {
  const _getOrderHistory({Key? key}) : super(key: key);

  @override
  State<_getOrderHistory> createState() => _getOrderHistoryState();
}

class _getOrderHistoryState extends State<_getOrderHistory> {
  List items = [];
  void _getItems(){
    items = [
      {'id':1,'order_no':'1233','name':'Mobile','description':'Latest android smart phone', 'status':'Pending'},
      {'id':1,'order_no':'2323','name':'TV','description':'Latest android smart phone', 'status':'Active'},
      {'id':2,'order_no':'3423','name':'Tab','description':'Latest android smart phone', 'status':'Active'},
      {'id':3,'order_no':'2342','name':'Laptop','description':'Latest android smart phone', 'status':'Active'},
      {'id':4,'order_no':'3423','name':'Earphones','description':'Latest android smart phone', 'status':'Pending'},
      {'id':5,'order_no':'3242','name':'Monitor','description':'Latest android smart phoneLatest android smart phoneLatest android smart phoneLatest android smart phoneLatest android smart phoneLatest android smart phoneLatest android smart phoneLatest android smart phoneLatest android smart phoneLatest android smart phone', 'status':'Active'}
    ];
  }
  @override
  void initState() {
    super.initState();
    _getItems();
  }
  @override
  void dispose() {
    super.dispose();
    items = [];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GetOrderDetails(),
                ),
              );
            },
            title: Text(
              items[index]['name'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              items[index]['description'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: PopupMenuButton<_menuItems>(
              padding: EdgeInsets.all(0.0),
              itemBuilder: (context) => [
                PopupMenuItem<_menuItems>(
                    child: ListTile(
                      title: Text("Order Details"),
                      leading: Icon(Icons.file_present),
                    ),
                    value: _menuItems.orderDetail,
                ),
                PopupMenuItem<_menuItems>(
                  child: ListTile(
                    title: Text("Track Order"),
                    leading: Icon(Icons.location_on),
                  ),
                  value: _menuItems.orderTrack,
                ),
                PopupMenuItem<_menuItems>(
                  child: ListTile(
                    title: Text("Cancel Order"),
                    leading: Icon(Icons.close),
                  ),
                  value: _menuItems.orderCancel,
                ),
              ],
              onSelected: (value) {
                switch (value){
                  case _menuItems.orderDetail:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GetOrderDetails(),
                        ),
                    );
                    break;
                  case _menuItems.orderTrack:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrackOrder(),
                      ),
                    );
                    break;
                  case _menuItems.orderCancel:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CancelOrder(),
                      ),
                    );
                    break;
                }
              },
            ),
            dense: false,
          ),
        );
      },
    );
  }
}

enum _menuItems{
  orderDetail, orderTrack, orderCancel
}