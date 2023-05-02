import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Global Components/GlobalAppColor.dart';
import '../Global Components/GlobalFlag.dart';
import '../Global Components/GlobalFunction.dart';
import '../Global Components/keyboardUtil.dart';
import '../screens/navbar.dart';
import 'OtpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';

class OTPScreen extends StatefulWidget {
  // const OTPScreen({super.key});
  //static String tag = GlobalNavigationRoute.TagOTPScreen.toString();

  // ignore: non_constant_identifier_names
  final String? SendMobileNumberWithCode;

  // ignore: non_constant_identifier_names
  final String? SendMobileCode;

  // ignore: non_constant_identifier_names
  final String? SendMobileDialCodee;

  // ignore: non_constant_identifier_names
  final String? SendMobileNumberWithoutCode;

  OTPScreen({
    Key? key,
    // ignore: non_constant_identifier_names
    this.SendMobileNumberWithCode,
    // ignore: non_constant_identifier_names
    this.SendMobileCode,
    // ignore: non_constant_identifier_names
    this.SendMobileDialCodee,
    // ignore: non_constant_identifier_names
    this.SendMobileNumberWithoutCode,
  }) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<State> _keyLoginLoader = new GlobalKey<State>();

  // ignore: non_constant_identifier_names
  final GlobalKey<ScaffoldState> _SnackBarscaffoldKey =
      GlobalKey<ScaffoldState>();
  var _blankFocusNode = new FocusNode();

  // ignore: non_constant_identifier_names
  final _OTPformKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  var RecivedMobileNumber;
  TextEditingController controller = TextEditingController();
  int pinLength = 6;
  bool hasError = false;

  // ignore: non_constant_identifier_names
  var RecivedPin;
  Timer? _timer;

  // ignore: non_constant_identifier_names
  int OTPTimeStart = 60;

  // ignore: non_constant_identifier_names
  bool TimerActive = false;

  // ignore: non_constant_identifier_names
  bool ResendOTP = false;

  // ignore: non_constant_identifier_names
  var GetFCMToken;

  // ignore: non_constant_identifier_names
  var GetDeviceName;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? strVerificationId;
  final globalKey = GlobalKey<ScaffoldState>();
  bool showVerifyNumberWidget = true;
  bool showVerificationCodeWidget = false;
  bool showSuccessWidget = false;
  String? _verificationCode;

//------------------------------ConnectivityResult----------------------------//
  // ignore: non_constant_identifier_names
  bool NotConnected = false;
  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  // ignore: non_constant_identifier_names, unused_field, cancel_subscriptions
  StreamSubscription<ConnectivityResult>? _ConnectivitySubscription;

//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
  @override
  void initState() {
    super.initState();
    // _getToken();
    startTimer();
    TimerActive = true;
    setState(() {
      RecivedMobileNumber = widget.SendMobileNumberWithCode;
      getCurrentNumber(RecivedMobileNumber);
    });
    _checkInternetConnectivity();
//--------------------------onInternetConnectivityChanged---------------------//
    _ConnectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        _connectivityResult = result;
        if (_connectivityResult == ConnectivityResult.none) {
          NotConnected = true;
        } else {
          NotConnected = false;
        }
        GlobalFunction()
            .CheckConnectivityState(_connectivityResult, NotConnected);
      });
    });
//----------------------------------------------------------------------------//
  }

//-----------------------------------initState--------------------------------//
  // ignore: non_constant_identifier_names
  getCurrentNumber(MobileNuber) async {
    phoneNumberVerification(MobileNuber);
  }

  //------------------------------------_getToken-------------------------------//
  // void _getToken() async {
  //   FirebaseMessaging.instance.getToken().then((value) {
  //     String token = value;
  //     setState(() {
  //       GetFCMToken = token;
  //       if (Platform.isIOS) {
  //         setState(() {
  //           GetDeviceName = "IOS";
  //         });
  //       } else if (Platform.isAndroid) {
  //         setState(() {
  //           GetDeviceName = "Andriod";
  //         });
  //       }
  //     });
  //   });
  // }

  //-----------------------------------startTimer-------------------------------//
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (OTPTimeStart < 1) {
            timer.cancel();
          } else {
            OTPTimeStart = OTPTimeStart - 1;
            if (OTPTimeStart == 0) {
              timer.cancel();
              TimerActive = false;
              ResendOTP = true;
            }
          }
        },
      ),
    );
  }

//========================_checkInternetConnectivity==========================//
  void _checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      setState(() {
        NotConnected = true;
      });
      _showDialog(GlobalFlag.InternetNotConnected);
    } else {
      NotConnected = false;
    }
  }

//----------------------------_showDialog-------------------------------------//
  void _showDialog(String value) {
    FocusScope.of(this.context).requestFocus(new FocusNode());
    // ignore: deprecated_member_use
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.start,
        style: GoogleFonts.getFont(
          GlobalFlag.GoogleFonts,
          fontStyle: FontStyle.normal,
          color: GlobalAppColor.WhiteColorCode,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: 0.5,
        ),
      ),
      duration: Duration(seconds: GlobalFlag.DialogDuration),
      backgroundColor: GlobalAppColor.DialogMessageColor,
    ));
  }

  //============================================================================//
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

//============================================================================//
  @override
  dispose() {
    _timer?.cancel();
    _ConnectivitySubscription?.cancel();
    _ConnectivitySubscription?.cancel();
    super.dispose();
  }

//============================================================================//
  @override
  void deactivate() {
    // TODO: implement deactivate
    _timer?.cancel();
    _ConnectivitySubscription?.cancel();
    _ConnectivitySubscription?.cancel();
    super.deactivate();
  }

//============================================================================//
  @override
  void didUpdateWidget(covariant OTPScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // TODO: implement didUpdateWidget
  }

//----------------------------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/BackgroundImage.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: new GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(_blankFocusNode);
                KeyboardUtil.hideKeyboard(context);
              },
              child: NotConnected == true
                  ? new Center(
                      child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Container(
                            height: 15,
                            child: Image.asset(
                              "assets/images/offline.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          new Container(
                              padding: const EdgeInsets.all(15.0),
                              child: new Text(
                                GlobalFlag.NotConnected,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  GlobalFlag.GoogleFonts,
                                  fontStyle: FontStyle.normal,
                                  color: GlobalAppColor.titleTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              )),
                        ],
                      ),
                    ))
                  : new Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        child: Form(
                          key: _OTPformKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
//---------------------------------------OTP-Screen---------------------------//
                              new Text(
                                "Code has been send to $RecivedMobileNumber",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  GlobalFlag.GoogleFonts,
                                  fontStyle: FontStyle.normal,
                                  color: GlobalAppColor.titleTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              new SizedBox(height: 16),
                              new Align(
                                alignment: Alignment.center,
                                child: new Container(
                                  child: PinCodeTextField(
                                    isCupertino: true,
                                    keyboardType: TextInputType.number,
                                    autofocus: false,
                                    pinBoxHeight: Adaptive.h(7),
                                    pinBoxWidth: Adaptive.w(10),
                                    pinBoxOuterPadding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    controller: controller,
                                    highlight: true,
                                    highlightColor: Colors.grey,
                                    defaultBorderColor: Colors.grey,
                                    hasTextBorderColor:
                                        GlobalAppColor.AppColorCode,
                                    highlightPinBoxColor: Colors.white,
                                    maxLength: pinLength,
                                    hasError: hasError,
                                    errorBorderColor: Colors.red,
                                    pinBoxColor: Colors.white,
                                    pinBoxRadius: 10.0,
                                    pinBoxBorderWidth: 1.0,
                                    pinBoxDecoration: ProvidedPinBoxDecoration
                                        .defaultPinBoxDecoration,
                                    onTextChanged: (text) {
                                      setState(() {
                                        hasError = false;
                                      });
                                    },
                                    onDone: (text) {
                                      RecivedPin = text;
                                      FocusScope.of(context)
                                          .requestFocus(_blankFocusNode);
                                    },
                                    wrapAlignment: WrapAlignment.start,
                                    pinTextStyle: TextStyle(
                                        fontSize: 25,
                                        color: GlobalAppColor.BlackColorCode),
                                    pinTextAnimatedSwitcherTransition:
                                        ProvidedPinBoxTextAnimation
                                            .scalingTransition,
                                    pinTextAnimatedSwitcherDuration:
                                        const Duration(milliseconds: 300),
                                    highlightAnimationBeginColor: Colors.black,
                                    highlightAnimationEndColor: Colors.white12,
                                  ),
                                ),
                              ),
                              new SizedBox(
                                height: Adaptive.h(6),
                              ),
                              new Visibility(
                                visible: TimerActive,
                                child: new Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        new Text(
                                          'Resend code in',
                                          style: GoogleFonts.getFont(
                                            GlobalFlag.GoogleFonts,
                                            fontStyle: FontStyle.normal,
                                            color:
                                                GlobalAppColor.titleTextColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        new SizedBox(width: 1),
                                        new Text(OTPTimeStart.toString(),
                                            style: GoogleFonts.getFont(
                                              GlobalFlag.GoogleFonts,
                                              fontStyle: FontStyle.normal,
                                              color:
                                                  GlobalAppColor.AppColorCode,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              letterSpacing: 1,
                                            )),
                                        new Text(
                                          "s",
                                          style: GoogleFonts.getFont(
                                            GlobalFlag.GoogleFonts,
                                            fontStyle: FontStyle.normal,
                                            color:
                                                GlobalAppColor.titleTextColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ))),
                              ),
                              new Visibility(
                                visible: ResendOTP,
                                child: new Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        margin: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 20.0,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            new Flexible(
                                              child: new GestureDetector(
                                                onTap: () async {
                                                  KeyboardUtil.hideKeyboard(
                                                      context);
                                                  var result =
                                                      await Connectivity()
                                                          .checkConnectivity();
                                                  if (result ==
                                                      ConnectivityResult.none) {
                                                    _showDialog(GlobalFlag
                                                        .InternetNotConnected);
                                                  } else {
                                                    setState(() {
                                                      controller.clear();
                                                      RecivedMobileNumber = widget
                                                          .SendMobileNumberWithCode;
                                                      getCurrentNumber(
                                                          RecivedMobileNumber);
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration:
                                                        new BoxDecoration(
                                                            border: Border.all(
                                                              color: GlobalAppColor
                                                                  .AppColorCode,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                            color: GlobalAppColor
                                                                .WhiteColorCode),
                                                    child: Text(
                                                      "Resend OTP on SMS",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.getFont(
                                                        GlobalFlag.GoogleFonts,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: GlobalAppColor
                                                            .BtnColorCode,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        letterSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            new SizedBox(
                                              width: 2,
                                            ),
                                            new Flexible(
                                              child: new GestureDetector(
                                                onTap: () async {
                                                  KeyboardUtil.hideKeyboard(
                                                      context);
                                                  var result =
                                                      await Connectivity()
                                                          .checkConnectivity();
                                                  if (result ==
                                                      ConnectivityResult.none) {
                                                    _showDialog(GlobalFlag
                                                        .InternetNotConnected);
                                                  } else {
                                                    setState(() {
                                                      controller.clear();
                                                      RecivedMobileNumber = widget
                                                          .SendMobileNumberWithCode;
                                                      getCurrentNumber(
                                                          RecivedMobileNumber);
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration:
                                                        new BoxDecoration(
                                                            border: Border.all(
                                                              color: GlobalAppColor
                                                                  .AppColorCode,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                            color: GlobalAppColor
                                                                .WhiteColorCode),
                                                    child: Text(
                                                      "Resend OTP on Call",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.getFont(
                                                        GlobalFlag.GoogleFonts,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: GlobalAppColor
                                                            .BtnColorCode,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        letterSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ))),
                              ),
//----------------------------------------------------------------------------//
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
        bottomNavigationBar: NotConnected == true
            ? new Center(
                child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Container(
                      height: 15,
                      child: Image.asset(
                        "assets/images/offline.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    new Container(
                        padding: const EdgeInsets.all(15.0),
                        child: new Text(
                          GlobalFlag.NotConnected,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            GlobalFlag.GoogleFonts,
                            fontStyle: FontStyle.normal,
                            color: GlobalAppColor.titleTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )),
                  ],
                ),
              ))
            : SafeArea(
                child: Container(
                  color: Colors.green,
                  margin: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 60),
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: new GestureDetector(
                    onTap: () async {
                      KeyboardUtil.hideKeyboard(context);
                      var result = await Connectivity().checkConnectivity();
                      if (result == ConnectivityResult.none) {
                        _showDialog(GlobalFlag.InternetNotConnected);
                      } else {
                        if (_OTPformKey.currentState!.validate()) {
                          _OTPformKey.currentState!.save();
                          setState(() {
                            if (controller.text.length == 0) {
                              Fluttertoast.showToast(
                                  msg: "Enter OTP!",
                                  fontSize: 16,
                                  textColor: GlobalAppColor.WhiteColorCode,
                                  backgroundColor: GlobalAppColor.BtnColorCode,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 5);
                            } else if (controller.text.length == 1) {
                              Fluttertoast.showToast(
                                  msg: "OTP should be 6 digits!",
                                  fontSize: 16,
                                  textColor: GlobalAppColor.WhiteColorCode,
                                  backgroundColor: GlobalAppColor.BtnColorCode,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 5);
                            } else if (controller.text.length == 2) {
                              Fluttertoast.showToast(
                                  msg: "OTP should be 6 digits!",
                                  fontSize: 16,
                                  textColor: GlobalAppColor.WhiteColorCode,
                                  backgroundColor: GlobalAppColor.BtnColorCode,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 5);
                            } else if (controller.text.length == 3) {
                              Fluttertoast.showToast(
                                  msg: "OTP should be 6 digits!",
                                  fontSize: 16,
                                  textColor: GlobalAppColor.WhiteColorCode,
                                  backgroundColor: GlobalAppColor.BtnColorCode,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 5);
                            } else if (controller.text.length == 4) {
                              Fluttertoast.showToast(
                                  msg: "OTP should be 6 digits!",
                                  fontSize: 16,
                                  textColor: GlobalAppColor.WhiteColorCode,
                                  backgroundColor: GlobalAppColor.BtnColorCode,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 5);
                            } else if (controller.text.length == 5) {
                              Fluttertoast.showToast(
                                  msg: "OTP should be 6 digits!",
                                  fontSize: 16,
                                  textColor: GlobalAppColor.WhiteColorCode,
                                  backgroundColor: GlobalAppColor.BtnColorCode,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 5);
                            } else {
                              // ignore: non_constant_identifier_names
                              var GetOTP = controller.text;
                              signInWithPhoneNumber(GetOTP);
                              // LoginApiFromServer();
                            }
                          });
                        }
                      }
                    },
                    child: Text(
                      "Verify",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        GlobalFlag.GoogleFonts,
                        fontStyle: FontStyle.normal,
                        color: Colors.purple,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ));
  }

  //-----------------------phoneNumberVerification-------------------------------//
  // ignore: non_constant_identifier_names
  Future<void> phoneNumberVerification(MobileNuber) async {
    Fluttertoast.showToast(
        msg: "OTP will recive shortly",
        fontSize: 16,
        textColor: GlobalAppColor.WhiteColorCode,
        backgroundColor: GlobalAppColor.FluttertoastColorCode,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5);

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '$MobileNuber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              // SharedPreferences pref = await SharedPreferences.getInstance();

              // pref.setString("Mobilenumber", RecivedMobileNumber);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Navbar()));
              print(MobileNuber);
              //print("Already Login");
              //----------------Api------//
              // LoginApiFromServer();
            } else {
              // print("Not Login");
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }

//-----------------------signInWithPhoneNumber--------------------------------//
  // ignore: non_constant_identifier_names
  void signInWithPhoneNumber(
    GetOTP,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationCode!, smsCode: GetOTP))
          .then((value) async {
        if (value.user != null) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString("Mobilee", GetOTP);

          pref.setString("Mobilenumber", RecivedMobileNumber);

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Navbar()));
          //print("Go Home");
          //   LoginApiFromServer();
        } else {
          //print("New Astrologer");
        }
      });
    } catch (e) {
      //print(e);
      Fluttertoast.showToast(
          msg:
              "The sms code has expired. Please re-send the verification code to try again.",
          backgroundColor: Colors.red,
          fontSize: 16,
          textColor: GlobalAppColor.WhiteColorCode,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5);
    }
  }
}
