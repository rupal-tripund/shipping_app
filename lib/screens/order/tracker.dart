import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../constants/styles.dart';
import 'order_history.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_circle_left_outlined),
            iconSize: Style.sizeIcon / 1.2,
            onPressed: () {
              Navigator.pop(context,
                MaterialPageRoute(
                  builder: (context) => ListByCategory(),
                ),
              );
            },
          ),
          title: Text(
            'Track Order',
            style: TextStyle(
              color: Style.textColorDark,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [Colors.blue, Style.blueAccentPageBackgroundColor],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width < 450
                ? Style.paddingHeight : Style.paddingHeight * 3,
            vertical: MediaQuery.of(context).size.width < 450
                ? Style.paddingHeight : Style.paddingHeight * 3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
               TimelineTile(
                 axis: TimelineAxis.vertical,
                 alignment: TimelineAlign.start,
                 endChild: Container(
                   padding: EdgeInsets.symmetric(
                     horizontal: MediaQuery.of(context).size.width < 450
                         ? Style.paddingHeight : Style.paddingHeight * 3,
                     vertical: MediaQuery.of(context).size.width < 450
                         ? Style.paddingHeight : Style.paddingHeight * 3,
                   ),
                   constraints: const BoxConstraints(
                     minHeight: 120,
                   ),
                   child: Column(
                     mainAxisAlignment:  MainAxisAlignment.center,
                     children: <Widget>[
                        Row(
                          children:  <Widget>[
                             IconButton(
                               onPressed: () {},
                               icon: const Icon(Icons.print),
                               color: Colors.green.shade500,
                               iconSize: Style.sizeIcon / 1.2,
                             ),
                              Expanded(
                                child: Text(
                                  'Order Placed',
                                  style: TextStyle(
                                    fontSize: Style.sizeSubTitle,
                                    fontWeight: FontWeight.w400,
                                    color: Style.textColorLight,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  <Widget>[
                            SizedBox(
                              width: Style.paddingWidth * 4,
                            ),
                           Expanded(
                             child: Text(
                               'we have received your order',
                               style: TextStyle(
                                 fontSize: Style.sizeSubTitle,
                                 fontWeight: FontWeight.w300,
                                 color: Style.textColorLight,
                               ),
                             ),
                           ),
                          ],
                        ),
                     ],
                   ),
                 ),
                 indicatorStyle: IndicatorStyle(
                   color: Colors.green.shade500,
                   height: Style.sizeSubTitle,
                   width: Style.sizeSubTitle,
                 ),
                 afterLineStyle: LineStyle(
                   color: Colors.green.shade500,
                 ),
                 beforeLineStyle: LineStyle(
                   color: Colors.green.shade500,
                 ),
                 isFirst: true,
               ),
              TimelineTile(
                axis: TimelineAxis.vertical,
                alignment: TimelineAlign.start,
                endChild: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width < 450
                        ? Style.paddingHeight : Style.paddingHeight * 3,
                    vertical: MediaQuery.of(context).size.width < 450
                        ? Style.paddingHeight : Style.paddingHeight * 3,
                  ),
                  constraints: const BoxConstraints(
                    minHeight: 120,
                  ),
                  child: Column(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children:  <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.shopping_cart),
                            color: Colors.grey,
                            iconSize: Style.sizeIcon / 1.2,
                          ),
                          Text(
                            'Picked Up',
                            style: TextStyle(
                              fontSize: Style.sizeSubTitle,
                              fontWeight: FontWeight.w400,
                              color: Style.textColorLight,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  <Widget>[
                          SizedBox(
                            width: Style.paddingWidth * 4,
                          ),
                          Expanded(
                            child: Text(
                              'your order has been picked up',
                              style: TextStyle(
                                fontSize: Style.sizeSubTitle,
                                fontWeight: FontWeight.w300,
                                color: Style.textColorLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                indicatorStyle: IndicatorStyle(
                  height: Style.sizeSubTitle,
                  width: Style.sizeSubTitle,
                ),
                afterLineStyle: LineStyle(

                ),
                beforeLineStyle: LineStyle(
                ),
              ),
              TimelineTile(
                axis: TimelineAxis.vertical,
                alignment: TimelineAlign.start,
                endChild: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width < 450
                        ? Style.paddingHeight : Style.paddingHeight * 3,
                    vertical: MediaQuery.of(context).size.width < 450
                        ? Style.paddingHeight : Style.paddingHeight * 3,
                  ),
                  constraints: const BoxConstraints(
                    minHeight: 120,
                  ),
                  child: Column(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children:  <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.local_shipping),
                            color: Colors.grey,
                            iconSize: Style.sizeIcon / 1.2,
                          ),
                          Text(
                            'Shipped',
                            style: TextStyle(
                              fontSize: Style.sizeSubTitle,
                              fontWeight: FontWeight.w400,
                              color: Style.textColorLight,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  <Widget>[
                          SizedBox(
                            width: Style.paddingWidth * 4,
                          ),
                          Expanded(
                            child: Text(
                              'your order has been shipped',
                              style: TextStyle(
                                fontSize: Style.sizeSubTitle,
                                fontWeight: FontWeight.w300,
                                color: Style.textColorLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                indicatorStyle: IndicatorStyle(
                  height: Style.sizeSubTitle,
                  width: Style.sizeSubTitle,
                ),
                afterLineStyle: LineStyle(
                ),
                beforeLineStyle: LineStyle(
                ),
              ),
              TimelineTile(
                axis: TimelineAxis.vertical,
                alignment: TimelineAlign.start,
                endChild: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width < 450
                        ? Style.paddingHeight : Style.paddingHeight * 3,
                    vertical: MediaQuery.of(context).size.width < 450
                        ? Style.paddingHeight : Style.paddingHeight * 3,
                  ),
                  constraints: const BoxConstraints(
                    minHeight: 120,
                  ),
                  child: Column(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children:  <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.home),
                            color: Colors.grey,
                            iconSize: Style.sizeIcon / 1.2,
                          ),
                          Text(
                            'Delivered',
                            style: TextStyle(
                              fontSize: Style.sizeSubTitle,
                              fontWeight: FontWeight.w400,
                              color: Style.textColorLight,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  <Widget>[
                          SizedBox(
                            width: Style.paddingWidth * 4,
                          ),
                          Expanded(
                            child: Text(
                              'your order has been delivered',
                              style: TextStyle(
                                fontSize: Style.sizeSubTitle,
                                fontWeight: FontWeight.w300,
                                color: Style.textColorLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                indicatorStyle: IndicatorStyle(
                  height: Style.sizeSubTitle,
                  width: Style.sizeSubTitle,
                ),
                afterLineStyle: LineStyle(
                ),
                beforeLineStyle: LineStyle(
                ),
                isLast: true,
              ),
            ],
          ),
        ),
      )
    );
  }
}
