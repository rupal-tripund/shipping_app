import 'package:flutter/material.dart';
import '../../constants/styles.dart';
import 'package:shipping_app/screens/list_by_category.dart';

class CategoriesWidget extends StatefulWidget {
  CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  static const mainContainerColor = Colors.white;
  int pageNo = 0;
  dynamic categories = {
    "01": 'Electronics',
    "02": 'Hair Appliances',
    "03": 'Beauty Products',
    "04": 'Grocery',
    "11": 'Kitchen Appliances',
    "12": 'Men',
    "13": 'Women Ethnic',
    "14": 'Test'
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
          width: 330,
          child: PageView.builder(
            controller: PageController(),
            onPageChanged: (index) {
              pageNo = index;
              setState(() {});
            },
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    return child!;
                  },
                  child: Container(
                    margin:
                        EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                    color: mainContainerColor,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ListByCategory(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/${index}1.jpg',
                                          height: 90,
                                          width: 300,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(categories['${index}1'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                              wordSpacing: 2,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/${index}2.jpg',
                                          height: 90,
                                          width: 300,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(categories['${index}2'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                              wordSpacing: 2,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ListByCategory(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/${index}3.jpg',
                                          height: 90,
                                          width: 300,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(categories['${index}3'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                              wordSpacing: 2,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/${index}4.jpg',
                                          height: 90,
                                          width: 300,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(categories['${index}4'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                              wordSpacing: 2,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                        color: pageNo == index
                            ? Style.blueAccentPageBackgroundColor
                            : Colors.grey.shade300,
                      ),
                    ))),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
