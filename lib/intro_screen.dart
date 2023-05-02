import 'package:flutter/material.dart';
import 'package:tirthyatri/screens/navbar.dart';
import 'package:tirthyatri/signup%20screens/Signin.dart';

class IntroScreen extends StatefulWidget {
  // const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List images = ["int1.jpeg", "int2.jpeg", "int3.jpeg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/" + images[index]),
                    fit: BoxFit.fill),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 125, right: 25, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Container(
                            height: 48,
                            width: 95,
                            decoration: BoxDecoration(
                              color: Color(0XFFCAA883),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_right_outlined,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                        children: List.generate(3, (indexDots) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                            color: index == indexDots
                                ? Color(0XFFCAA883)
                                : Color(0XFFCAA883).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10)),
                      );
                    }))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
