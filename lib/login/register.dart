import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/Home/home_screen.dart';
import 'package:untitled/widget/progerssDialog.dart';

class Register extends StatelessWidget {
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController phoneTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
  static const String idScreen = 'register';
  Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(children: [
      BackgroundImage(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 120.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[600]?.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16)),
                              child: TextField(
                                controller: nameTextEditingController,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  border: InputBorder.none,
                                  hintText: 'Name',
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.person,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  hintStyle: GoogleFonts.merriweather(
                                      fontSize: 22, color: Colors.white),
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[600]?.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16)),
                              child: TextField(
                                  controller: emailTextEditingController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.solidEnvelope,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    hintStyle: GoogleFonts.merriweather(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[600]?.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16)),
                              child: TextField(
                                controller: phoneTextEditingController,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  border: InputBorder.none,
                                  hintText: 'Phone',
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.phone,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  hintStyle: GoogleFonts.merriweather(
                                      fontSize: 22, color: Colors.white),
                                ),
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[600]?.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16)),
                              child: TextField(
                                controller: passwordTextEditingController,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  focusColor: Colors.white,
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.lock,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  hintStyle: GoogleFonts.merriweather(
                                      fontSize: 22, color: Colors.white),
                                ),
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24),
                      ),
                    ),

                    // textColor: Colors.white,
                    child: Container(
                      height: 50,
                      width: 310,
                      child: Center(
                        child: Text(
                          "Create Account",
                          style: GoogleFonts.acme(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                    ),

                    onPressed: () {
                      if (nameTextEditingController.text.length < 3) {
                        displayToastMessage(
                            "name must be atleast of 3 characters", context);
                      } else if (!emailTextEditingController.text
                          .contains("@")) {
                        displayToastMessage(
                            "Email address is not valid", context);
                      } else if (phoneTextEditingController.text.isEmpty) {
                        displayToastMessage(
                            "Phone Number is necessary", context);
                      } else if (passwordTextEditingController.text.length <
                          6) {
                        displayToastMessage(
                            "Password show be greater than 6 characters",
                            context);
                      } else {
                        registerNewUser(context);
                      }
                      registerNewUser(context);
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'home_screen', (route) => false);
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        right: width * 0.05, top: height * 0.0250),
                    width: width,
                    child: Text(
                      'OR',
                      style: GoogleFonts.alegreya(
                          fontSize: 20,
                          color: Colors.white,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: OutlinedButton.icon(
                              icon: Image(
                                  image: AssetImage(
                                      'assets/images/logo google.png'),
                                  width: 30),
                              onPressed: () {},
                              label: Text('Sign in with Google',
                                  style: GoogleFonts.acme(
                                    fontSize: 18,
                                    color: Colors.white,
                                  )),
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'signin', (route) => false);
                    },
                    child: Text("Already have an Account? Click Here",
                        style: GoogleFonts.basic(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (c) {
          return ProgressDialog(
            message: "Registering your Account .",
          );
        });

    final firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      Navigator.pop(context);
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) //user created
    {
      //save user info to database

      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };
      userRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage(
          "Congratulations, your account has been created", context);

      Navigator.pushNamedAndRemoveUntil(
          context, home_screen.idScreen, (route) => false);
    } else {
      Navigator.pop(context);
      //error occured = display error msg
      displayToastMessage("New User account has not been created", context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.transparent,
      textColor: Colors.white,
      fontSize: 14);
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.lightGreen, Colors.lightGreen],
              begin: Alignment.bottomCenter,
              end: Alignment.center)
          .createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/backwla.jpeg'),
              fit: BoxFit.fill,
              colorFilter:
                  ColorFilter.mode(Colors.lightGreen, BlendMode.hardLight)),
        ),
      ),
    );
  }
}
