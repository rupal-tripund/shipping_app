import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../../constants/styles.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) : super(key: key);

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
      onPressed: () {
        Navigator.pop(context, '/login');
      },
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
          'Forgot password',
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
  final _formEmailKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  Color _emailColor = Style.defaultTextFieldIconColor;
  final _emailFocus = FocusNode();

  void _changeIconColorOnFocus(){
    _emailFocus.addListener(() {
      setState(() {
        if(_emailColor != Style.errorTextFieldIconColor){
          if(_emailFocus.hasFocus){
            _emailColor = Style.blueAccentPageBackgroundColor;
          }else{
            _emailColor = Style.defaultTextFieldIconColor;
          }
        }
      });
    });
  }
  @override
  void initState() {
    super.initState();
    _changeIconColorOnFocus();
  }
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
              key: _formEmailKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    focusNode: _emailFocus,
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email ,color: _emailColor),
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
                        setState(() {
                          _emailColor = Style.errorTextFieldIconColor;
                        });
                        return 'This field is required';
                      }else if(!EmailValidator.validate(value)){
                        setState(() {
                          _emailColor = Style.errorTextFieldIconColor;
                        });
                        return 'Invalid Email';
                      }else{
                        setState(() {
                          if(_emailFocus.hasFocus){
                            _emailColor = Style.blueAccentPageBackgroundColor;
                          }else{
                            _emailColor = Style.defaultTextFieldIconColor;
                          }
                        });
                        return null;
                      }
                    },
                  ),

                  SizedBox(
                    height: Style.paddingHeight * 8,
                  ),

                  InkWell(
                    onTap: () {
                      if(_formEmailKey.currentState!.validate()){
                        Navigator.pushReplacementNamed(
                          context,
                          "/forgetPassword/send-otp",
                          arguments: {_emailController.value.text}
                        );
                        _emailController..text = "";
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
                              'Send OTP',
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
      ),
    );
  }
}






