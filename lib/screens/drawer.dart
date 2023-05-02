import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  // const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    savadata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            // Important: Remove any padding from the ListView.
            // padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.amber),
                      borderRadius: const BorderRadius.all(Radius.circular(
                              5.0) //                 <--- border radius here
                          ),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/prof.jpg",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rajat Agrawal",
                        style: GoogleFonts.acme(
                            fontSize: 20, color: const Color(0XFFCAA883)),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        '${LoginUserMobile}',
                        style: GoogleFonts.lato(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ]),
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              // DrawerHeader(
              //   decoration: BoxDecoration(color: Colors.white),
              //   child: UserAccountsDrawerHeader(
              //     decoration: BoxDecoration(color: Colors.white),
              //     accountEmail:
              //         Text(''), // keep blank text because email is required
              //     accountName: Row(
              //       children: [
              //         Container(
              //           width: 50,
              //           height: 50,
              //           decoration:
              //               BoxDecoration(borderRadius: BorderRadius.circular(2)),
              //           child: CircleAvatar(
              //             backgroundImage: AssetImage("assets/images/prof.jpg"),
              //           ),
              //         ),
              //         SizedBox(
              //           width: 20,
              //         ),
              //         Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: <Widget>[
              //             Text(
              //               'Rajat Agrawal',
              //               style: TextStyle(color: Colors.black, fontSize: 16),
              //             ),
              //             Text(
              //               '91868635826',
              //               style: TextStyle(color: Colors.black, fontSize: 16),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber),
                          color: Colors.white),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.home),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text("Home"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber),
                          color: Colors.white),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.person),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text("Profile"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber),
                          color: Colors.white),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.tour),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text("Yatra"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber),
                          color: Colors.white),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.my_location),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text("My Trip"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber),
                          color: Colors.white),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.message),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text("Message"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber),
                          color: Colors.white),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.notifications),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text("Alerts"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber),
                          color: Colors.white),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.settings),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text("Settings"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber),
                          color: Colors.white),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.logout),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text("LogOut"),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              // ListTile(

              //   title: const Text('Item 1'),
              //   onTap: () {
              //     // Update the state of the app
              //     // ...
              //     // Then close the drawer
              //     Navigator.pop(context);
              //   },
              // ),
              // ListTile(
              //   title: const Text('Item 2'),
              //   onTap: () {
              //     // Update the state of the app
              //     // ...
              //     // Then close the drawer
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  var LoginUserMobile;

  Future<void> savadata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      LoginUserMobile = pref.get("Mobilenumber").toString();
    });
  }
}
