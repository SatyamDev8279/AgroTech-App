import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:untitled/govsites.dart';
import 'package:untitled/screens/Home/home_screen.dart';
import '../login/register.dart';
import '../login/signin.dart';
import 'OnboardingPage.dart';
import 'login/forgot password.dart';
import './chatbot.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Open());
}

DatabaseReference userRef =
    // ignore: deprecated_member_use
    FirebaseDatabase.instance.reference().child("users");

class Open extends StatefulWidget {
  static const String idScreen = " Open";
  const Open({Key? key}) : super(key: key);

  @override
  State<Open> createState() => _OpenState();
}

class _OpenState extends State<Open> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: 'OnboardingPage',
      routes: {
        // Loginpage.idScreen:(context) => Loginpage(),
        // MainScreen.idScreen:(context) => MainScreen(),
        'OnboardingPage': (context) => OnboardingPage(),
        'signin': (context) => Loginpage(),
        'forgot': (context) => Forgetpass(),
        'register': (context) => Register(),
        'home_screen': (context) => home_screen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
