import 'package:flutter/material.dart';
import '../../constants/styles.dart';
class BannerWidget extends StatelessWidget {
  dynamic categories = {1:'Electronics',2:'Hair Appliances',3:'Beauty Products', 4:'Grocery', 5:'Kitchen Appliances',6:'Men',7:'Women Ethnic'};
  BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.start,
            children: [
            for (int i=1; i<8; i++)
            Container(

              height: 50,
              decoration: BoxDecoration(
                borderRadius:
                  BorderRadius.circular(10),
                color: Colors.white,
              boxShadow:[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                      spreadRadius:1,
                      blurRadius: 6
                )
              ]),

                child: Row(
                children: [
            Padding(
              padding: EdgeInsets.all(2),
              child: Image.asset("assets/banners/$i.jpg",
              height: 200,

              ),

            ),


                ],
              ),
            )
            ],
            ),
            )
      ],
    );
  }
}