import 'package:flutter/material.dart';
import '../../constants/styles.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../product/Order_history.dart';
import 'download_Invoice.dart';
import 'package:readmore/readmore.dart';

class GetOrderDetails extends StatelessWidget {
  const GetOrderDetails({Key? key}) : super(key: key);

  Future<void> getInvoice() async{
    final PdfDocument document = PdfDocument();
    final page = document.pages.add();
    page.graphics.drawString(
        "Invoice",
        PdfStandardFont(
            PdfFontFamily.helvetica,
            30
        )
    );
    List<int> bytes = await document.save();
    document.dispose();
    saveFile(bytes, "Invoice$DateTime.now().pdf");
  }

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
          'View Order Details',
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
          padding: EdgeInsets.symmetric(
            horizontal: Style.paddingWidth * 1.2,
            vertical: Style.paddingHeight * 1.2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Order No : ',
                    style: TextStyle(
                      fontSize: Style.sizeSubTitle,
                      fontWeight: FontWeight.bold,
                      color: Style.blueAccentPageBackgroundColor,
                    ),
                  ),
                  Text(
                    '5689045673',
                    style: TextStyle(
                      fontSize: Style.sizeSubTitle,
                      fontWeight: FontWeight.w400,
                      color: Style.textColorLight,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Style.paddingHeight / 2,
              ),
              Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Order Description : ',
                      style: TextStyle(
                        fontSize: Style.sizeSubTitle,
                        fontWeight: FontWeight.bold,
                        color: Style.blueAccentPageBackgroundColor,
                      ),
                    ),
                    WidgetSpan(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: Style.paddingHeight / 3.5,
                          ),
                          ReadMoreText(
                            'Samsung AUE60 Crystal 4k UHD Smart TV. Powerful 4K upscaling ensures you get up to 4K resolution for the content you love. You will also experience more lifelike color expressions due to its sophisticated color mapping technology. ',
                            trimLines: 2,
                            colorClickableText: Style.textColorGrey,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: ' show more',
                            trimExpandedText: ' show less',
                            style: TextStyle(
                              fontSize: Style.sizeSubTitle,
                              fontWeight: FontWeight.w400,
                              color: Style.textColorLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Style.paddingHeight / 2,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Order Date : ',
                    style: TextStyle(
                      fontSize: Style.sizeSubTitle,
                      fontWeight: FontWeight.bold,
                      color: Style.blueAccentPageBackgroundColor,
                    ),
                  ),
                  Text(
                    '27-03-23',
                    style: TextStyle(
                      fontSize: Style.sizeSubTitle,
                      fontWeight: FontWeight.w400,
                      color: Style.textColorLight,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Style.paddingHeight / 3,
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: Style.paddingHeight / 3,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'No Of Items : ',
                    style: TextStyle(
                      fontSize: Style.sizeSubTitle,
                      fontWeight: FontWeight.bold,
                      color: Style.blueAccentPageBackgroundColor,
                    ),
                  ),
                  Text(
                    '5',
                    style: TextStyle(
                      fontSize: Style.sizeSubTitle,
                      fontWeight: FontWeight.w400,
                      color: Style.textColorLight,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Style.paddingHeight / 2,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Pickup From : ',
                      style: TextStyle(
                        fontSize: Style.sizeSubTitle,
                        fontWeight: FontWeight.bold,
                        color: Style.blueAccentPageBackgroundColor,
                      ),
                    ),
                    WidgetSpan(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: Style.paddingHeight / 3.5,
                          ),
                          ReadMoreText(
                            'Shop no 5, kamal sagar,90 feet road, airoli, navi mumbai.',
                            trimLines: 2,
                            trimMode: TrimMode.Line,
                            colorClickableText: Style.textColorGrey,
                            trimCollapsedText: 'show more',
                            trimExpandedText: 'show less',
                            style: TextStyle(
                                fontSize: Style.sizeSubTitle,
                                fontWeight: FontWeight.w400,
                                color: Style.textColorLight),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Style.paddingHeight / 3,
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: Style.paddingHeight / 3,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Amount : ',
                    style: TextStyle(
                      fontSize: Style.sizeSubTitle,
                      fontWeight: FontWeight.bold,
                      color: Style.blueAccentPageBackgroundColor,
                    ),
                  ),
                  Text(
                    '50000',
                    style: TextStyle(
                      fontSize: Style.sizeSubTitle,
                      fontWeight: FontWeight.w400,
                      color: Style.textColorLight,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Style.paddingHeight / 2,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Amount paid : ',
                    style: TextStyle(
                      fontSize: Style.sizeSubTitle,
                      fontWeight: FontWeight.bold,
                      color: Style.blueAccentPageBackgroundColor,
                    ),
                  ),
                  Text(
                    '50000',
                    style: TextStyle(
                      fontSize: Style.sizeSubTitle,
                      fontWeight: FontWeight.w400,
                      color: Style.textColorLight,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Style.paddingHeight,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: getInvoice,
                    child: Text(
                      "View Invoice",
                      style: TextStyle(
                        fontSize: Style.sizeSubTitle,
                        fontWeight: FontWeight.bold,
                        color: Style.textColorDark,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

