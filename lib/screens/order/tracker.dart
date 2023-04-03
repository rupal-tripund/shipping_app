import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../constants/styles.dart';

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
        backgroundColor: Style.blueAccentPageBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left_outlined),
          iconSize: Style.sizeIcon / 1.2,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Track order',
          style: TextStyle(
            fontSize: Style.sizeButtonText * 1.1,
            fontWeight: FontWeight.bold,
            color: Style.textColorDark,
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
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment:  MainAxisAlignment.center,
                     children: <Widget>[
                        Row(
                          children:  <Widget>[
                             IconButton(
                               onPressed: () {},
                               icon: const Icon(Icons.print),
                               color: Colors.green.shade500,
                               iconSize: Style.sizeIcon,
                             ),
                              Expanded(
                                child: Text(
                                  'Order Placed',
                                  style: TextStyle(
                                    fontSize: Style.sizeButtonText,
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
                                 fontSize: Style.sizeButtonText,
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
                   height: Style.sizeButtonText,
                   width: Style.sizeButtonText,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children:  <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.shopping_cart),
                            color: Colors.grey,
                            iconSize: Style.sizeIcon,
                          ),
                          Text(
                            'Picked Up',
                            style: TextStyle(
                              fontSize: Style.sizeButtonText,
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
                                fontSize: Style.sizeButtonText,
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
                  height: Style.sizeButtonText,
                  width: Style.sizeButtonText,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children:  <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.local_shipping),
                            color: Colors.grey,
                            iconSize: Style.sizeIcon,
                          ),
                          Text(
                            'Shipped',
                            style: TextStyle(
                              fontSize: Style.sizeButtonText,
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
                                fontSize: Style.sizeButtonText,
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
                  height: Style.sizeButtonText,
                  width: Style.sizeButtonText,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children:  <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.home),
                            color: Colors.grey,
                            iconSize: Style.sizeIcon,
                          ),
                          Text(
                            'Delivered',
                            style: TextStyle(
                              fontSize: Style.sizeButtonText,
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
                                fontSize: Style.sizeButtonText,
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
                  height: Style.sizeButtonText,
                  width: Style.sizeButtonText,
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
