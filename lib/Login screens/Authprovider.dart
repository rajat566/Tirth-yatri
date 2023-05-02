// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tirthyatri/screens/navbar.dart';

class Login extends StatefulWidget {
  // const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController inputcontroller = TextEditingController();
  GlobalKey formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Color.fromARGB(255, 248, 99, 114),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              backgroundImage: ExactAssetImage("assets/images/kedarnath.jpg"),
              radius: 45),
          Padding(padding: EdgeInsets.only(top: 10)),
          SizedBox(
            height: 20,
          ),
          Text(
            "Login ",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 10, right: 280),
                //   child: Text(
                //     "Phone :",
                //     style: TextStyle(
                //         color: Colors.black, fontWeight: FontWeight.bold),
                //   ),
                // ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.only(left: 5),
                  child: IntlPhoneField(
                    controller: inputcontroller,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'ind',
                    onChanged: (phn) {
                      print(phn.completeNumber);
                    },
                  ),
                  // child: TextFormField(
                  //   controller: inputcontroller,
                  //   decoration: InputDecoration(
                  //       hintText: "Enter phone ",

                  //       // prefixIcon: Icon(Icons.phone_android),
                  //       border: InputBorder.none),
                  // ),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 250),
                  child: MaterialButton(
                    onPressed: () {
                      // Navigator.push(
                      //    context,
                      //   MaterialPageRoute(
                      //      builder: (context) => ForgotPassword()));
                    },
                    child: Text("Login?",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300)),
                  ),
                ),

                SizedBox(
                  height: 5,
                ),

                OutlinedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 99, 114),
                  ),
                  onPressed: () {
                    //  login(inputcontroller.text.toString());
                    if (inputcontroller.text != null) {
                      final Phn = '+91' + inputcontroller.text;
                      AuthProvider().loginwithPhone(context, Phn);
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // Text("OR"),
                SizedBox(
                  height: 20,
                ),

                // Column(
                //   children: [
                //     Container(
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 70, right: 70),
                //         child: MaterialButton(
                //             height: 35,
                //             color: Colors.blue,
                //             onPressed: () async {
                //               GoogleSignIn gsn = GoogleSignIn();
                //               await gsn.signIn();
                //               if (gsn.currentUser != null) {
                //                 print(gsn.currentUser.displayName);
                //                 print(gsn.currentUser.photoUrl);
                //                 // Navigator.push(
                //                 //   context,
                //                 //   MaterialPageRoute(
                //                 //     builder: (_) => Home(
                //                 //   photoUrl: gsn.currentUser.photoUrl,
                //                 //   name:
                //                 //    gsn.currentUser.displayName)));
                //               }
                //             },
                //             child: Row(
                //               children: [
                //                 Image.network(
                //                   "https://blog.hubspot.com/hubfs/image8-2.jpg",
                //                   height: 20,
                //                   fit: BoxFit.fill,
                //                 ),
                //                 SizedBox(
                //                   width: 15,
                //                 ),
                //                 Text("Sign in with Google")
                //               ],
                //             )),
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AuthProvider {
  Future<bool?> loginwithPhone(BuildContext context, String phn) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    TextEditingController otpC = TextEditingController();
    _auth.verifyPhoneNumber(
        phoneNumber: phn,
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result = await _auth.signInWithCredential(credential);
          Navigator.pop(context);
          User? user = result.user;
          if (user != null) {
            // userlogin(phn);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Navbar()));
          } else {
            print("Error");
            // Fluttertoast.showToast(msg: 'user is not signed in');
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          // Fluttertoast.showToast(msg: e.toString());
        },
        codeSent: (String verificationcode, int? token) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  // ignore: prefer_const_constructors
                  title: Text('Enter otp'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: otpC,
                        keyboardType: TextInputType.number,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //    primary: Color.fromARGB(255, 248, 99, 114),
                        //  ),
                        onPressed: () async {
                          //   login(inputcontroller.text.toString());

                          final code = otpC.text;
                          AuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationcode,
                                  smsCode: code);
                          UserCredential result =
                              await _auth.signInWithCredential(credential);
                          User? user = result.user;

                          if (user != null) {
                            //   userlogin(phn);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Navbar()));

                            print('success');
                          } else {
                            Text("ERRor");
                            //Fluttertoast.showToast(msg: 'error');
                          }
                        },
                        child: Text(
                          'verify',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (id) => {});
  }
}
