import 'package:flutter/material.dart';
import '../../constants/styles.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import '../../shared/bottom_navigation.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: double.infinity,
                    child: Carousel(
                      dotSize: 6.0,
                      dotSpacing: 15.0,
                      dotPosition: DotPosition.bottomCenter,
                      images: [
                        Image.asset('assets/images/01.jpg', fit: BoxFit.cover,),
                        Image.asset('assets/images/01.jpg', fit: BoxFit.cover,),
                        Image.asset('assets/images/01.jpg', fit: BoxFit.cover,),
                        Image.asset('assets/images/01.jpg', fit: BoxFit.cover,),
                      ],
                    ),
                  ),
                ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    Style.paddingHeight,
                    Style.paddingHeight * 2,
                    Style.paddingHeight,
                    Style.paddingHeight,
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  color: Style.primaryBackgroundColor,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Text(
                          'Samsung galaxy S23',
                          style: TextStyle(
                            fontSize: Style.sizeTitle / 1.10,
                            color: Style.textColorLight,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),

                        SizedBox(
                          height: Style.paddingHeight,
                        ),

                        Text(
                          '₹ 59000',
                          style: TextStyle(
                            fontSize: Style.sizeButtonText,
                            color: Style.iconColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),

                        SizedBox(
                          height: Style.paddingHeight,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height / 5,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Text(
                              'All specifications and descriptions provided herein may be different from the actual specifications and descriptions for the product. Samsung reserves the right to make changes to this document and the product described herein, at anytime, without obligation on Samsung to provide notification of such change. All functionality, features, specifications, GUI and other product information provided in this document including, but not limited to, the benefits, design, pricing, components, performance, availability, and capabilities of the product are subject to change without notice or obligation. The contents within the screen are simulated images and are for demonstration purposes only.Color availability may vary depending on country or carrier.Dyes for anodizing the metal frames are made of 10% natural dye.The front and back glass contain an average of 22% recycled content. The back glass deco film contains a minimum of 80% recycled content. The above measurements are based on weight.Glass PET film and recycled glass received environmental claim validationPaper packaging is made of 100% recycled paper, excluding the seal label and shrinkage vinyl. Window protection paper is made of 100% recycled paper. Measurements are based on weight.Expert RAW must be downloaded separately from the Galaxy Store, for free, before use. Supported on S23 Series devices, S22 Series devices, S21 Ultra, S20 Ultra, Note20 Ultra, Z Fold4, Z Fold3 and Z Fold2.',
                              style: TextStyle(
                                fontSize: Style.sizeButtonText,
                                color: Style.textColorLight,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Style.paddingHeight,
                        ),

                        InkWell(
                          onTap: () {
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Buy',
                                    style: TextStyle(
                                      fontSize: Style.sizeButtonText,
                                      fontWeight: FontWeight.bold,
                                      color: Style.textColorDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
