import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tirthyatri/intro_screen.dart';
import 'package:tirthyatri/screens/navbar.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => IntroScreen()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFCAA883),
        body: Center(
          child: Image(
            image: AssetImage(
              'assets/images/splash.JPEG',
            ),
            fit: BoxFit.fill,
            height: 760,
          ),
        ));
  }
}
