import 'dart:io';
import 'package:shipping_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:shipping_app/shared/bottom_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';


class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController shippingController = TextEditingController();
  TextEditingController billingController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  final ImagePicker _picker = ImagePicker();
  File? selectedImage;


  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

        title: Text('Profile Setting'),
        backgroundColor: Style.loginPageBackgroundColor,
      ),
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),

            Container(

              child: Stack(

                children: [

                  Align(


                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        getImage(ImageSource.camera);
                      },
                      child: selectedImage == null
                          ? Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffD6D6D6)),
                        child: Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      )
                          : Container(

                        width: 120,
                        height: 120,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(selectedImage!),
                                fit: BoxFit.fill),
                            shape: BoxShape.circle,
                            color: Color(0xffD6D6D6)),
                      ),
                    ),
                  ),
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

                        'Name', Icons.person_outlined, nameController,(String? input){

                      if(input!.isEmpty){
                        return 'Name is required!';
                      }

                      if(input.length<5){
                        return 'Please enter a valid name!';
                      }

                      return null;

                    }

                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        'Email', Icons.mail_lock_outlined, emailController,(String? input){

                      if(input!.isEmpty){
                        return 'Email is required!';
                      }

                      if(input.length<5){
                        return 'Please enter a valid email!';
                      }

                      return null;

                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        'Shipping Address', Icons.home_outlined, shippingController,(String? input){

                      if(input!.isEmpty){
                        return 'Shipping Address is required!';
                      }

                      return null;

                    },onTap: ()async{},readOnly: true),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget('Billing Address', Icons.home_outlined,
                        billingController,(String? input){
                          if(input!.isEmpty){
                            return 'Billing Address is required!';
                          }

                          return null;
                        },onTap: ()async{},readOnly: true),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget('Contact No.',
                        Icons.contact_phone_outlined, contactController,(String? input){
                          if(input!.isEmpty){
                            return 'Contact No. is required!';
                          }

                          return null;
                        },onTap: ()async{},readOnly: true),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          color:Style.loginPageBackgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: InkWell(
                        onTap: () async{},
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'UPDATE ',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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

  Widget greenButton(String title, Function onPressed) {
    return MaterialButton(

      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

      onPressed: () => onPressed(),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
