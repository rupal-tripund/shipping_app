import 'package:flutter/material.dart';
import '../../../constants/styles.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword ({Key? key}) : super(key: key);
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
        Navigator.pop(context, '/forgetPassword/reset-password');

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
          'Reset password',
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
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureText2 = true;
  List<FocusNode> _nodes = [];
  List<Color> _colors = [];
  List<TextEditingController> _controllers = [];

  void _addDataInList(){
    for(int i = 0; i < 2; i++){
      _nodes.add(FocusNode());
      _colors.add(Style.defaultTextFieldIconColor);
      _controllers.add(TextEditingController());
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
      _controllers[i].dispose();
    }
    _nodes = [];
    _colors = [];
    _controllers = [];
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
                    obscureText: _obscureText,
                    controller: _controllers[0],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: _colors[0]),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText =! _obscureText;
                          });
                        },
                        child: Icon(_obscureText
                            ?Icons.visibility
                            :Icons.visibility_off ,
                            color: _colors[0],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                      ),
                      hintText: 'Password',
                    ),
                    validator: (value){
                      if(value!.isEmpty) {
                        setState(() {
                          _colors[0] = Style.errorTextFieldIconColor;
                        });
                        return 'This field is required';
                      }else if(value != _controllers[1].value.text){
                        setState(() {
                          _colors[0] = Style.errorTextFieldIconColor;
                        });
                        return 'password and confirm password do not match';
                      }else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#\\$&*~]).{8,}$').hasMatch(value)){
                        setState(() {
                          _colors[0] = Style.errorTextFieldIconColor;
                        });
                        return 'weak password enter strong password';
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
                    obscureText: _obscureText2,
                    controller: _controllers[1],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: _colors[1]),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText2 =! _obscureText2;
                          });
                        },
                        child: Icon(_obscureText2
                            ?Icons.visibility
                            :Icons.visibility_off,
                          color: _colors[1],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0),
                        borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                      ),
                      hintText: 'Confirm password',
                    ),
                    validator: (value){
                      if(value!.isEmpty) {
                        setState(() {
                          _colors[1]= Style.errorTextFieldIconColor;
                        });
                        return 'This field is required';
                      }else if(value != _controllers[0].value.text){
                        setState(() {
                          _colors[1] = Style.errorTextFieldIconColor;
                        });
                        return 'password and confirm password do not match';
                      }else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#\\$&*~]).{8,}$').hasMatch(value)){
                        setState(() {
                          _colors[1] = Style.errorTextFieldIconColor;
                        });
                        return 'weak password enter strong password';
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
                    height: Style.paddingHeight * 4,
                  ),

                  InkWell(
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        Navigator.pop(context, '/forgetPassword/reset-password');
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
                              'Reset password',
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