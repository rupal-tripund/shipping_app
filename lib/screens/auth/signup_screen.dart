import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../constants/styles.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Style.blueAccentPageBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              // hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  // heading
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: HeadingWidget(),
                    ),
                  ),

                  // textField
                  Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: FormWidget(),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: Style.paddingWidth, vertical: Style.paddingHeight),
      decoration:  BoxDecoration(
        color: Style.blueAccentPageBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          // back arrow
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.topLeft,
              child: BackArrowWidget(),
            ),
          ),

          // header text
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: MainHeading(),
            ),
          ),

        ],
      ),
    );
  }
}


class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_circle_left_outlined),
      color: Style.iconBackgroundColor,
      iconSize: Style.sizeIcon,
    );
  }
}

class MainHeading extends StatelessWidget {
  const MainHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Create an account',
          style: TextStyle(
            fontSize: Style.sizeTitle,
            fontWeight: FontWeight.bold,
            color: Style.textColorDark,
          ),
        ),
      ],
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool? check = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: Style.paddingWidth, vertical: Style.paddingHeight),
      decoration: BoxDecoration(
        color: Style.primaryBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width < 450
                  ? Style.paddingHeight : Style.paddingHeight * 3,
              vertical: MediaQuery.of(context).size.width < 450
                  ? Style.paddingHeight : Style.paddingHeight * 3,
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                      ),
                      hintText: 'Name',
                    ),
                    validator: (value){
                      if(value!.isEmpty) {
                        return 'This field is required';
                      }else if(!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                        return 'Name field accept alphabets only';
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: Style.paddingHeight,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                      ),
                      hintText: 'Email',
                    ),
                    validator: (value){
                      if(value!.isEmpty) {
                        return 'This field is required';
                      }else if(!EmailValidator.validate(value)){
                        return 'Invalid Email';
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: Style.paddingHeight,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                        child: Icon(Icons.local_shipping),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                      ),
                      hintText: 'Shipping Address',
                    ),
                    validator: (value){
                      if(value!.isEmpty) {
                        return 'This field is required';
                      }else if(!RegExp(r'^[#.\da-zA-Z\s,-]+$').hasMatch(value)){
                        return 'Invalid shipping address';
                      }else{
                        return null;
                      }
                    },
                    maxLines: 5,
                  ),

                  SizedBox(
                    height: Style.paddingHeight,
                  ),

                  CheckboxListTile( //checkbox positioned at left
                    value: check,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        check = value;
                        if(check == true){

                        }else{

                        }
                      });
                    },
                    title: Text(
                      "Do you want same shipping address in billing address",
                      style: TextStyle(
                        fontSize: Style.sizeSubTitle,
                        color: Style.textColorLight,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: Style.paddingHeight,
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                        child: Icon(Icons.account_balance_wallet),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                      ),
                      hintText: 'Billing Address',
                    ),
                    validator: (value){
                      if(value!.isEmpty) {
                        return 'This field is required';
                      }else if(!RegExp(r'^[#.\da-zA-Z\s,-]+$').hasMatch(value)){
                        return 'Invalid billing address';
                      }else{
                        return null;
                      }
                    },
                    maxLines: 5,
                  ),

                  SizedBox(
                    height: Style.paddingHeight,
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                      ),
                      hintText: 'Phone number',
                    ),
                    validator: (value){
                      if(value!.isEmpty) {
                        return 'This field is required';
                      }else if(!RegExp(r'^(?:[+0]9)?\d{10}$').hasMatch(value)){
                        return 'Invalid phone number';
                      }else{
                        return null;
                      }
                    },
                  ),

                  SizedBox(
                    height: Style.paddingHeight * 3,
                  ),

                  InkWell(
                    onTap: () {
                      if(formKey.currentState!.validate()){
                      }
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Sign up',
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

                  SizedBox(
                    height: Style.marginLink,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have an account ?',
                        style: TextStyle(
                          fontSize: Style.sizeSubTitle,
                          color: Style.textColorLight,
                        ),
                      ),
                      Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: Style.sizeSubTitle,
                          color: Style.blueAccentPageBackgroundColor,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






