import 'package:flutter/material.dart';
import '../../constants/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';



class BannerWidget extends StatelessWidget {
  dynamic categories = {1:'Electronics',2:'Hair Appliances',3:'Beauty Products', 4:'Grocery', 5:'Kitchen Appliances',6:'Men',7:'Women Ethnic'};
  BannerWidget({Key? key}) : super(key: key);

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          CarouselSlider(
            items: imgList
                .map((item) => Container(
              child: Center(
                child: Image.network(
                  item,
                  fit: BoxFit.cover,

                  width: 500,
                ),
              ),
            ))
                .toList(),
            options: CarouselOptions(
              height: 60,
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,

            ),
          ),


        ],
      ),
    );
    // return Column(
    //   children: [
    //
    //         SingleChildScrollView(
    //           scrollDirection: Axis.horizontal,
    //         child: Row(
    //          // mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //         for (int i=1; i<6; i++)
    //         Container(
    //
    //           height: 50,
    //           decoration: BoxDecoration(
    //             borderRadius:
    //               BorderRadius.circular(10),
    //             color: Colors.white,
    //           ),
    //
    //             child: Row(
    //             children: [
    //         Padding(
    //           padding: EdgeInsets.all(2),
    //           child: Image.asset("assets/banners/$i.jpg",
    //           height: 200,
    //             width: 150,
    //
    //
    //           ),
    //
    //         ),
    //
    //
    //             ],
    //           ),
    //         )
    //         ],
    //         ),
    //         )
    //   ],
    // );
  }
}