// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/main.dart';
import './register.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/widget/progerssDialog.dart';
import 'package:untitled/screens/Home/home_screen.dart';

class Loginpage extends StatelessWidget {
  static const String idScreen = 'signin';
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 90,
                  child: Center(
                    child: Text('KrishiVikas',
                        style: GoogleFonts.lora(
                            fontSize: 50,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[600]?.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16)),
                        child: TextField(
                          controller: emailTextEditingController,
                          style: GoogleFonts.merriweather(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Colors.limeAccent),
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 15),
                              border: InputBorder.none,
                              hintText: 'Email',
                              prefixIcon: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  FontAwesomeIcons.solidEnvelope,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              hintStyle: GoogleFonts.merriweather(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white)),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[600]?.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16)),
                        child: TextField(
                          controller: passwordTextEditingController,
                          style: GoogleFonts.merriweather(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Colors.limeAccent),
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 20),
                              border: InputBorder.none,
                              hintText: 'Password',
                              prefixIcon: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  FontAwesomeIcons.lock,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              hintStyle: GoogleFonts.merriweather(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white)),
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(
                              right: width * 0.05, top: height * 0.0250),
                          width: width,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'forgot', (route) => false);
                            },
                            child: Text("Forgot Password!",
                                style: GoogleFonts.basic(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(21))),

                        //textColor: Colors.white,
                        child: Container(
                          height: 50,
                          width: 300,
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: GoogleFonts.acme(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (!emailTextEditingController.text.contains("@")) {
                            displayToastMessage(
                                "Email address is not valid", context);
                          } else if (passwordTextEditingController
                              .text.isEmpty) {
                            displayToastMessage("Password is empty", context);
                          } else {
                            loginAndAuthenticateUser(context);
                            Navigator.pushNamedAndRemoveUntil(
                                context, 'home_screen', (route) => false);
                          }
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
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'register', (route) => false);
                        },
                        child: Text("Do not have an account? Click Here",
                            style: GoogleFonts.basic(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (c) {
          return ProgressDialog(
            message: "Authenticating ...Please Wait",
          );
        });
    final User? firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
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

      userRef
          .child(firebaseUser.uid)
          .once()
          .then((value) => (DataSnapshot snap) {
                if (snap.value != null) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, home_screen.idScreen, (route) => false);
                  displayToastMessage(
                      "Congratulations, you are logged in", context);
                } else {
                  Navigator.pop(context);
                  _firebaseAuth.signOut();
                  displayToastMessage(
                      "No record for this user. Please create an account.",
                      context);
                }
              });
    } else {
      Navigator.pop(context);
      //error occured = display error msg
      // ignore: use_build_context_synchronously
      displayToastMessage("Error occured , cannot be signed in", context);
    }
  }
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
