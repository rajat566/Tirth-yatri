import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirthyatri/Login%20screens/Authprovider.dart';
import 'package:tirthyatri/intro_screen.dart';
import 'package:tirthyatri/screens/bottomNavbar.dart';
import 'package:tirthyatri/screens/navbar.dart';
import 'package:tirthyatri/signup%20screens/Signin.dart';
import 'package:tirthyatri/splash%20screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var Mobilee = pref.getString("Mobilee");

  runApp(ResponsiveSizer(builder: (context, orientation, screenType) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Mobilee == null ? Splashscreen() : Navbar());
  }));
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Splashscreen());
    });
  }
}
