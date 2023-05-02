import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tirthyatri/screens/drawer.dart';
import 'package:tirthyatri/screens/home.dart';
import 'package:tirthyatri/screens/profile.dart';
import 'package:tirthyatri/screens/trip.dart';
import 'package:tirthyatri/screens/yatra.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int index = 0;
  final pages = [Home(), Yatra(), Trip(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: pages[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(10)),
          boxShadow: [
            BoxShadow(color: Colors.brown, spreadRadius: 0, blurRadius: 0),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(20),
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(

                // indicatorColor: Color.fromARGB(255, 56, 131, 116),
                labelTextStyle: MaterialStateProperty.all(TextStyle(
              fontSize: 11,
            ))),
            child: NavigationBar(
              backgroundColor: Colors.white,
              //Color.fromARGB(179, 253, 250, 250),
              selectedIndex: index,
              onDestinationSelected: (index) => setState(() {
                this.index = index;
              }),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home,
                      size: 35, color: Color.fromRGBO(118, 122, 149, 2)),
                  label: "Home",
                ),
                NavigationDestination(
                    icon: Icon(
                      Icons.flag,
                      size: 35,
                      color: Color.fromRGBO(118, 122, 149, 10),
                    ),
                    label: "Yatra"),
                NavigationDestination(
                    icon: Icon(
                      Icons.train,
                      size: 35,
                      color: Color.fromRGBO(118, 122, 149, 10),
                    ),
                    label: "Trip"),
                NavigationDestination(
                    icon: Icon(
                      Icons.person,
                      size: 35, //color:Color(0xffDBEFEE),
                      color: Color.fromRGBO(118, 122, 149, 10),
                    ),
                    label: "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
