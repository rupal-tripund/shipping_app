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
      onPressed: () {
        Navigator.pop(context);
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
  bool? _check = false;
  final _formKey = GlobalKey<FormState>();
  List<FocusNode> _nodes = [];
  List<Color> _colors = [];

  void _addDataInList(){
    for(int i = 0; i < 5; i++){
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
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    focusNode: _nodes[0],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person,color: _colors[0]),
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
                        setState(() {
                          _colors[0] = Style.errorTextFieldIconColor;
                        });
                        return 'This field is required';
                      }else if(!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                        setState(() {
                          _colors[0] = Style.errorTextFieldIconColor;
                        });
                        return 'Name field accept alphabets only';
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
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: _colors[1]),
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
                          _colors[1] = Style.errorTextFieldIconColor;
                        });
                        return 'This field is required';
                      }else if(!EmailValidator.validate(value)){
                        setState(() {
                          _colors[1] = Style.errorTextFieldIconColor;
                        });
                        return 'Invalid Email';
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
                    height: Style.paddingHeight,
                  ),
                  TextFormField(
                    focusNode: _nodes[2],
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                        child: Icon(Icons.local_shipping , color: _colors[2]),
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
                        setState(() {
                          _colors[2] = Style.errorTextFieldIconColor;
                        });
                        return 'This field is required';
                      }else if(!RegExp(r'^[#.\da-zA-Z\s,-]+$').hasMatch(value)){
                        setState(() {
                          _colors[2] = Style.errorTextFieldIconColor;
                        });
                        return 'Invalid shipping address';
                      }else{
                        setState(() {
                          if(_nodes[2].hasFocus){
                            _colors[2] = Style.blueAccentPageBackgroundColor;
                          }else{
                            _colors[2] = Style.defaultTextFieldIconColor;
                          }
                        });
                        return null;
                      }
                    },
                    maxLines: 5,
                  ),

                  SizedBox(
                    height: Style.paddingHeight,
                  ),

                  CheckboxListTile( //checkbox positioned at left
                    value: _check,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      setState(() {
                        _check = value;
                        if(_check == true){

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
                    focusNode: _nodes[3],
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                        child: Icon(Icons.account_balance_wallet, color: _colors[3]),
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
                        setState(() {
                          _colors[3] =Style.errorTextFieldIconColor;
                        });
                        return 'This field is required';
                      }else if(!RegExp(r'^[#.\da-zA-Z\s,-]+$').hasMatch(value)){
                        setState(() {
                          _colors[3] =Style.errorTextFieldIconColor;
                        });
                        return 'Invalid billing address';
                      }else{
                        setState(() {
                          if(_nodes[3].hasFocus){
                            _colors[3] = Style.blueAccentPageBackgroundColor;
                          }else{
                            _colors[3] = Style.defaultTextFieldIconColor;
                          }
                        });
                        return null;
                      }
                    },
                    maxLines: 5,
                  ),

                  SizedBox(
                    height: Style.paddingHeight,
                  ),

                  TextFormField(
                    focusNode: _nodes[4],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone, color:_colors[4]),
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
                        setState(() {
                          _colors[4] =Style.errorTextFieldIconColor;
                        });
                        return 'This field is required';
                      }else if(!RegExp(r'^(?:[+0]9)?\d{10}$').hasMatch(value)){
                        setState(() {
                          _colors[4] =Style.errorTextFieldIconColor;
                        });
                        return 'Invalid phone number';
                      }else{
                        setState(() {
                          if(_nodes[4].hasFocus){
                            _colors[4] = Style.blueAccentPageBackgroundColor;
                          }else{
                            _colors[4] = Style.defaultTextFieldIconColor;
                          }
                        });
                        return null;
                      }
                    },
                  ),

                  SizedBox(
                    height: Style.paddingHeight * 3,
                  ),

                  InkWell(
                    onTap: () {
                      if(_formKey.currentState!.validate()){
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






