
import 'package:flutter/material.dart';
import '../../constants/styles.dart';

class CategoriesWidget extends StatefulWidget {
  CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  static const mainContainerColor = Colors.white;
  int pageNo = 0;
  dynamic categories = {
    1: 'Electronics',
    2: 'Hair Appliances',
    3: 'Beauty Products',
    4: 'Grocery',
    5: 'Kitchen Appliances',
    6: 'Men',
    7: 'Women Ethnic'
  };
  late final PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: 350,
          child: PageView.builder(
            controller: PageController(),
            onPageChanged: (index){
              pageNo = index;
              setState(() {

              });
            },
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    return child!;
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    color: mainContainerColor,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/images/' +
                                              '$index' +
                                              '1.jpg'))),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/images/' +
                                              '$index' +
                                              '2.jpg'))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/images/' +
                                              '$index' +
                                              '3.jpg'))),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/images/' +
                                              '$index' +
                                              '4.jpg'))),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
            },
            itemCount: 2,
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                2,
                    (index) => Container(
                  margin: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.circle,
                    size: 10.0,
                    color: pageNo == index?Style.loginPageBackgroundColor:Colors.grey.shade300,
                  ),
                ))),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
