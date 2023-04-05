import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../../constants/styles.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _OTPController = TextEditingController();

class CheckOTP extends StatelessWidget {
  const CheckOTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)?.settings.arguments as Set<String>;
    if(argument.elementAt(0).isEmpty){
      Navigator.pop(context, '/forgetPassword/send-otp');
      _emailController..text = "";
      _OTPController..text = "";
    }
    _emailController..text = argument.elementAt(0);
    _OTPController..text = "";
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
        Navigator.pop(context, '/forgetPassword/send-otp');
        _emailController..text = "";
        _OTPController..text = "";
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
  final _formOTPKey = GlobalKey<FormState>();
  List<FocusNode> _nodes = [];
  List<Color> _colors = [];

  void _addDataInList(){
    for(int i = 0; i < 2; i++){
      _nodes.add(FocusNode());
      _colors.add(Style.defaultTextFieldIconColor);
    }
    _changeIconColor();
  }

  void _changeIconColor() {
    for(int i = 0; i < _nodes.length; i++){
      _nodes[i].addListener(() {
        setState(() {
          if(_colors[i] != Style.errorTextFieldIconColor){
            if(_nodes[i].hasFocus){
              _colors[i] = Style.blueAccentPageBackgroundColor;
            }else{
              _colors[i] = Style.defaultTextFieldIconColor;
            }
          }
        });
      });
    }
  }

  @override
  void initState(){
    super.initState();
    _addDataInList();
  }

  @override
  void dispose() {
    super.dispose();
    for(int i = 0; i < _nodes.length; i++){
      _nodes[i].dispose();
    }
    _nodes = [];
    _colors = [];
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
              key: _formOTPKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    focusNode: _nodes[0],
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email ,color: _colors[0]),
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
                          _colors[0] = Style.errorTextFieldIconColor;
                        });
                        return 'This field is required';
                      }else if(!EmailValidator.validate(value)){
                        setState(() {
                          _colors[0] = Style.errorTextFieldIconColor;
                        });
                        return 'Invalid Email';
                      }else{
                        setState(() {
                          if(_nodes[0].hasFocus){
                            _colors[0] = Style.blueAccentPageBackgroundColor;
                          }else{
                            _colors[0] = Style.defaultTextFieldIconColor;
                          }
                        });
                        return null;
                      }
                    },
                  ),

                  SizedBox(
                    height: Style.paddingHeight,
                  ),
                  TextFormField(
                    focusNode: _nodes[1],
                    maxLength: 4,
                    controller: _OTPController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_clock ,color: _colors[1]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                      ),
                      hintText: 'OTP',
                    ),
                    validator: (value){
                      if(value!.isEmpty) {
                        setState(() {
                          _colors[1] = Style.errorTextFieldIconColor;
                        });
                        return 'This field is required';
                      }else if(!RegExp(r"^\d+$").hasMatch(value)){
                        setState(() {
                          _colors[1] = Style.errorTextFieldIconColor;
                        });
                        return 'Invalid OTP';
                      }else if(value.length < 3){
                        setState(() {
                          _colors[1] = Style.errorTextFieldIconColor;
                        });
                        return 'Invalid OTP';
                      }else{
                        setState(() {
                          if(_nodes[1].hasFocus){
                            _colors[1] = Style.blueAccentPageBackgroundColor;
                          }else{
                            _colors[1] = Style.defaultTextFieldIconColor;
                          }
                        });
                        return null;
                      }
                    },
                  ),

                  SizedBox(
                    height: Style.paddingHeight * 5,
                  ),

                  InkWell(
                    onTap: () {
                      if(_formOTPKey.currentState!.validate()){
                        Navigator.pushReplacementNamed(context, '/forgetPassword/reset-password');
                        _emailController..text = "";
                        _OTPController..text = "";
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
                              'Submit',
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