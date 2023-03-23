import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipping_app/shared/bottom_navigation.dart';
import '../../constants/styles.dart';
//ignore: must_be_immutable
class newOrder extends StatelessWidget {

  TextEditingController orderNumberController = TextEditingController();
  TextEditingController retailerNameController = TextEditingController();
  TextEditingController numberOfItemsController = TextEditingController();
  TextEditingController ShippingAddressController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

        backgroundColor: Style.blueAccentPageBackgroundColor,
        title: Text('New Order',
        style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        wordSpacing: 2,
        ),

      ),
      ),

      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

              child: Stack(
                children: [


                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFieldWidget(

                        'Order Number', Icons.numbers_outlined, orderNumberController,(String? input){

                      if(input!.isEmpty){
                        return 'Order Number is required!';
                      }

                      if(input.length<5){
                        return 'Please enter a valid Order Number!';
                      }

                      return null;

                    }

                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        'Retailer Name', Icons.person_outlined, retailerNameController,(String? input){

                      if(input!.isEmpty){
                        return 'Retailer Name is required!';
                      }

                      if(input.length<5){
                        return 'Please enter a valid Retailer Name !';
                      }

                      return null;

                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        'Number of Items', Icons.numbers_outlined, numberOfItemsController,(String? input){

                      if(input!.isEmpty){
                        return 'Number of Items is required!';
                      }

                      if(input.length<5){
                        return 'Please enter a valid Number of Items !';
                      }

                      return null;

                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        'Shipping Address', Icons.home_outlined, ShippingAddressController,(String? input){

                      if(input!.isEmpty){
                        return 'Shipping Address is required!';
                      }

                      return null;

                    },onTap: ()async{},readOnly: true),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color:Colors.lightBlueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: InkWell(
                        onTap: () async{},
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Submit ',
                                style: TextStyle(
                          color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            wordSpacing: 2,

                              ),
    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    // StepTracker(
                    //   dotSize: 10,
                    //   selectedColor: Colors.green,
                    //   unSelectedColor: Colors.red,
                    //   stepTrackerType: StepTrackerType.dotVertical,
                    //   pipeSize: 30,
                    //   steps: [
                    //     Steps(title: Text("STEP 1"), state: TrackerState.none),
                    //     Steps(title: Text("STEP 2"), state: TrackerState.complete),
                    //     Steps(title: Text("STEP 3 "), state: TrackerState.disabled),
                    //   ],
                    // ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigation(),
      );
  }
}

TextFieldWidget(
    String title, IconData iconData, TextEditingController controller,Function validator,{Function? onTap,bool readOnly = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffA7A7A7)),
      ),
      const SizedBox(
        height: 6,
      ),
      Container(

        // height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 1)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          readOnly: readOnly,
          onTap: ()=> onTap!(),
          validator: (input)=> validator(input),
          controller: controller,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffA7A7A7)),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                iconData,

              ),
            ),
            border: InputBorder.none,
          ),
        ),
      )
    ],
  );
}

Widget greenIntroWidgetWithoutLogos({String title = "New Order",String? subtitle}){
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/header_image.png'),
            fit: BoxFit.fill
        )
    ),
    height: Get.height*0.3,
    child: Container(
        height: Get.height*0.1,
        width: Get.width,
        margin: EdgeInsets.only(bottom: Get.height*0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
            if(subtitle != null) Text(subtitle,style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),

          ],
        )),

  );
}

