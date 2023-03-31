import 'dart:convert';
import 'package:shipping_app/screens/auth/forgetPassword/EmailVerification.dart';
import '../../constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:shipping_app/screens/home_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _obscureText =  true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Color _emailColor = Style.defaultTextFieldIconColor;
  Color _passwordColor = Style.defaultTextFieldIconColor;
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  int validate(){
    if(formKey.currentState!.validate()){
      return 1;
    }
    else{
      return 0;
    }
  }

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
     _passwordFocus.addListener(() {
       setState(() {
         if(_passwordColor != Style.errorTextFieldIconColor){
           if(_passwordFocus.hasFocus){
             _passwordColor = Style.blueAccentPageBackgroundColor;
           }else{
             _passwordColor = Style.defaultTextFieldIconColor;
           }
         }
       });
     });
  }

  Future<int> authenticate(String email, String password) async{
    Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email':email,
          'password':password
        }
    );
    print(response.statusCode);
    if(response.statusCode==200){
      var data = jsonDecode(response.body.toString());
      print(data['token']);
      print('Logged in Successfully');
      return 1;
    }
    else{
      print('Logged in failed');
      return 0;
    }
  }
  @override
  void initState() {
    super.initState();
    _changeIconColorOnFocus();
  }

  @override
  Widget build(BuildContext context) {
    var width  = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Style.blueAccentPageBackgroundColor,
      body: SafeArea(

        child: Column(
          children: <Widget>[
            // header container
            Container(
              width: width,
              height: height / 4,
              margin: EdgeInsets.symmetric(
                  horizontal: Style.paddingHeight,
                  vertical: Style.paddingHeight,
              ),
              decoration: BoxDecoration(
                color: Style.blueAccentPageBackgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // back arrow icon
                  Expanded(flex: 1,child: BackArrowWidget()),
                  Expanded(
                    flex: 5,
                      child: Align(
                        alignment: Alignment.center,
                        child: MainHeading(),
                      ),
                  ),
                ],
              ),
            ),
            //login container
            Expanded(
              child: Container(
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    width: width,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width < 450
                          ? Style.paddingHeight * 1.5 : Style.paddingHeight * 2,
                      vertical: MediaQuery.of(context).size.width < 450
                          ? Style.paddingHeight * 1.5 : Style.paddingHeight * 2,
                    ),
                    child: Form (
                      key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          focusNode: _emailFocus,
                          controller: emailController,
                          validator: (UserNameValue) {
                            if (UserNameValue!.isEmpty) {
                              setState(() {
                                _emailColor = Style.errorTextFieldIconColor;
                              });
                              return 'Please Enter a valid Username';
                            }
                            else if(!EmailValidator.validate(UserNameValue)){
                              setState(() {
                                _emailColor = Style.errorTextFieldIconColor;
                              });
                              return 'Please Enter a valid Email';
                            }
                            else {
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
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: _emailColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.0),
                              borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                              fontSize: height / 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            hintText: 'Username',
                            fillColor: Colors.white70),
                        ),
                        SizedBox(
                          height: Style.paddingHeight,
                        ),
                        TextFormField(
                          focusNode: _passwordFocus,
                          obscureText: _obscureText,
                          controller: passwordController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock, color: _passwordColor,),
                              // suffixIcon: const Icon(Icons.remove_red_eye_rounded),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText =!_obscureText;
                                  });
                                },
                                child: Icon(_obscureText
                                  ?Icons.visibility
                                  :Icons.visibility_off,
                                  color: _passwordColor,
                                  ),
                                ),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0),
                                borderSide: const BorderSide(color: Colors.black54, width: 2.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(
                                fontSize: height / 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              hintText: 'Password',
                              fillColor: Colors.white70),

                          validator: (value)  {
                        if(value!.isEmpty){
                          setState(() {
                            _passwordColor = Style.errorTextFieldIconColor;
                          });
                          return "Please Enter a valid Password";
                        }
                        else{
                          setState(() {
                            if(_passwordFocus.hasFocus){
                              _passwordColor = Style.blueAccentPageBackgroundColor;
                            }else{
                              _passwordColor = Style.defaultTextFieldIconColor;
                            }
                          });
                          return null;
                        }
                      },
                          // obscureText: true,
                        ),

                        SizedBox(
                          height: Style.paddingHeight / 2,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckEmail(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forget password ?',
                                style: TextStyle(
                                  fontSize: Style.sizeButtonText,
                                  fontWeight: FontWeight.bold,
                                  color: Style.blueAccentPageBackgroundColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Style.paddingHeight * 4,
                        ),

                        InkWell(
                          onTap: () async {
                            final isValid = validate();
                            if (isValid == 1){
                              final isAuthenticated = await authenticate(emailController.text.toString(), passwordController.text.toString());
                              if(isAuthenticated==1){
                                print(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              }
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color:Style.blueAccentPageBackgroundColor,
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Login ',
                                    style: TextStyle(
                                      fontSize: Style.sizeButtonText,
                                      fontWeight: FontWeight.bold,
                                      color: Style.primaryBackgroundColor,
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
            ),
          ],
        ),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Welcome Back',
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