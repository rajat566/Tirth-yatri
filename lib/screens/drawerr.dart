import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Drawerr extends StatefulWidget {
  //const Drawerr({super.key});

  @override
  State<Drawerr> createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.amber),
                  borderRadius: BorderRadius.all(Radius.circular(
                          5.0) //                 <--- border radius here
                      ),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/prof.jpg",
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rajat Agrawal",
                    style: GoogleFonts.acme(
                        fontSize: 20, color: Color(0XFFCAA883)),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "91-9339393934",
                    style: GoogleFonts.lato(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  )
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
