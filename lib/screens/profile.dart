import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tirthyatri/signup%20screens/Signin.dart';

class Profile extends StatefulWidget {
  // const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    savadata();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEEEEEE),
        appBar: AppBar(
          title: const Text(
            "Tirth Yatri",
          ),
          backgroundColor: const Color(0XFFCAA883),
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 135,
                  decoration: const BoxDecoration(
                      color: Color(0XFFCAA883),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 19, left: 3, right: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "My profile",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          height: 85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60)),
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff7c94b6),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/prof.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50.0)),
                                      border: Border.all(
                                        color: Colors.amber,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rajat Agrawal",
                                        style: GoogleFonts.acme(
                                            fontSize: 20,
                                            color: const Color(0XFFCAA883)),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        '${LoginUserMobile}',
                                        style: GoogleFonts.lato(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.home),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Home"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.person),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Profile"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.tour),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Yatra"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.my_location),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("My Trip"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.message),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Message"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.notifications),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Alerts"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.settings),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Settings"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    GestureDetector(
                      onTap: (() async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.remove("Mobilee");

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      }),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.logout),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("LogOut"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  var LoginUserMobile;

  Future<void> savadata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      LoginUserMobile = pref.get("Mobilenumber").toString();
    });
  }
}
