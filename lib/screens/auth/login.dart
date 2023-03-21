import 'dart:convert';
import '../../constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int validate(){
    if(formkey.currentState!.validate()){
      return 1;
    }
    else{
      return 0;
    }
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
  Widget build(BuildContext context) {
    var width  = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Style.loginPageBackgroundColor,
      body: SafeArea(

        child: Column(
          children: <Widget>[
            // header container
            Container(
              width: width,
              height: height / 4,
              margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 30.0
              ),
              decoration: const BoxDecoration(
                color: Style.loginPageBackgroundColor,
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
                        child: Column(
                          children: <Widget>[
                            MainHeading(),
                          ],
                        ),
                      )
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
                child: Container(
                  width: width,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  child: SingleChildScrollView(
                    child:Form (
                      key: formkey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: emailController,
                            validator: (UserNameValue) {

                              if (UserNameValue!.isEmpty) {
                                return 'Please Enter a valid Username';
                              }
                              else if(!EmailValidator.validate(UserNameValue)){
                                return 'Please Enter a valid Email';
                              }
                              else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),

                                filled: true,
                                hintStyle: GoogleFonts.roboto(
                                  fontSize: height / 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                hintText: 'Username',
                                fillColor: Colors.white70),

                          ),
                        ),
                        const SizedBox(
                          height: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: _obscureText,
                            controller: passwordController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                // suffixIcon: const Icon(Icons.remove_red_eye_rounded),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText =!_obscureText;
                                    });
                                  },
                                  child: Icon(_obscureText
                                  ?Icons.visibility
                                      :Icons.visibility_off),
                                  ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                                hintStyle: GoogleFonts.roboto(
                                  fontSize: height / 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                hintText: 'Password',
                                fillColor: Colors.white70),

                            validator: (value)  {
                          if(value!.isEmpty){
                          return "Please Enter a valid Password";
                          }
                          else{
                            return null;
                          }
                          },
                            // obscureText: true,
                          ),
                        ),

                        const SizedBox(
                          height: 0.20,
                        ),

                        Container(
                          margin: const EdgeInsets.only(bottom: 100.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Forget password ?',
                                  style: GoogleFonts.roboto(
                                    fontSize: height / 40,
                                    fontWeight: FontWeight.bold,
                                    color: Style.loginPageBackgroundColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color:Style.loginPageBackgroundColor,
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: InkWell(
                            onTap: () async{
                              final isValid = validate();
                              if (isValid == 1){
                                final isAuthenticated = await authenticate(emailController.text.toString(), passwordController.text.toString());
                                if(isAuthenticated==1){
                                  print(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ));
                                }


                              }


                            },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Login ',
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
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
