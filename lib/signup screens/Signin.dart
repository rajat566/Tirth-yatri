// ignore_for_file: unnecessary_new

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Global Components/GlobalAppColor.dart';
import '../Global Components/GlobalFlag.dart';
import '../Global Components/GlobalFunction.dart';
import '../Global Components/keyboardUtil.dart';
import 'OtpScreen.dart';

class SignIn extends StatefulWidget {
  // const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _SnackBarscaffoldKey =
      GlobalKey<ScaffoldState>();
  var _blankFocusNode = new FocusNode();

//------------------------------ConnectivityResult----------------------------//
  // ignore: non_constant_identifier_names
  bool NotConnected = false;
  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  // ignore: non_constant_identifier_names, unused_field, cancel_subscriptions
  StreamSubscription<ConnectivityResult>? _ConnectivitySubscription;

//----------------------------------------------------------------------------//
  // ignore: non_constant_identifier_names
  TextEditingController MobileController = new TextEditingController();
  final FocusNode myFocusNodeMobile = FocusNode();

  // ignore: non_constant_identifier_names
  final _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  var MobileFound = "Enter Phone Number";

  // ignore: non_constant_identifier_names
  var GetMobileNumberWithCode;

  // ignore: non_constant_identifier_names
  var GetMobileCode;

  // ignore: non_constant_identifier_names
  var GetMobileDialCode;

  // ignore: non_constant_identifier_names
  var GetMobileNumberWithoutCode;

  // ignore: non_constant_identifier_names
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  // ignore: non_constant_identifier_names
  var UserSelectCountry;

//----------------------------------------------------------------------------//

  @override
  void initState() {
    super.initState();
    UserSelectCountry = "IN";
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
      setState(() {
        NotConnected = false;
      });
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
  dispose() {
    _ConnectivitySubscription?.cancel();
    super.dispose();
  }

//============================================================================//
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

//============================================================================//
  @override
  void didUpdateWidget(covariant SignIn oldWidget) {
    super.didUpdateWidget(oldWidget);
    // TODO: implement didUpdateWidget
  }

//----------------------------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
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
                        height: 5,
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //----------------------------------------------------------------------------//
                        new SizedBox(height: Adaptive.h(8)),
                        new Image.asset(
                          'assets/images/offline.png',
                          fit: BoxFit.contain,
                          height: Adaptive.h(20),
                        ),
                        new SizedBox(height: Adaptive.h(8)),
                        //----------------------------------------------------------------------------//
                        new Text(
                          "Login to your account",
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
                        new SizedBox(height: 5),
                        //----------------------------------------------------------------------------//
                        new Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      top: 20.0,
                                      bottom: 20.0),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        //--------------------------------MobileController----------------------------//
                                        new Container(
                                          margin: const EdgeInsets.only(
                                            left: 10.0,
                                          ),
                                          child: new Text(
                                            "Mobile Number",
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.getFont(
                                              GlobalFlag.GoogleFonts,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ),
                                        new SizedBox(height: Adaptive.h(0.5)),
                                        new Container(
                                          margin: const EdgeInsets.only(top: 3),
                                          child: new Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: MobileController
                                                                .text !=
                                                            ""
                                                        ? GlobalAppColor
                                                            .AppColorCode
                                                        : const Color.fromRGBO(
                                                            224, 224, 224, 1),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              20.0)),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child:
                                                      InternationalPhoneNumberInput(
                                                    textStyle:
                                                        GoogleFonts.getFont(
                                                      GlobalFlag.GoogleFonts,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: GlobalAppColor
                                                          .titleTextColor,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 16.sp,
                                                      letterSpacing: 0.5,
                                                    ),
                                                    inputDecoration:
                                                        InputDecoration(
                                                      hintText:
                                                          "Enter Mobile Number",
                                                      border: InputBorder.none,
                                                      isDense: true,
                                                      hintStyle:
                                                          GoogleFonts.getFont(
                                                        GlobalFlag.GoogleFonts,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: Colors.grey[400],
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 16.sp,
                                                        letterSpacing: 0.5,
                                                      ),
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    spaceBetweenSelectorAndTextField:
                                                        0,
                                                    initialValue: number,
                                                    onInputChanged:
                                                        (PhoneNumber number) {
                                                      setState(() {
                                                        GetMobileNumberWithCode =
                                                            number.phoneNumber;
                                                        GetMobileCode =
                                                            number.isoCode;
                                                        GetMobileDialCode =
                                                            number.dialCode;
                                                        GetMobileNumberWithoutCode =
                                                            MobileController
                                                                .text
                                                                .replaceAll(
                                                                    new RegExp(
                                                                        r"\s+\b|\b\s"),
                                                                    "");
                                                      });
                                                    },
                                                    keyboardAction:
                                                        TextInputAction.done,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    formatInput: true,
                                                    selectorConfig:
                                                        const SelectorConfig(
                                                      selectorType:
                                                          PhoneInputSelectorType
                                                              .BOTTOM_SHEET,
                                                      showFlags: true,
                                                      trailingSpace: true,
                                                      setSelectorButtonAsPrefixIcon:
                                                          true,
                                                    ),
                                                    /*ignoreBlank: true,
                                                      autoValidateMode: AutovalidateMode.disabled,*/
                                                    selectorTextStyle:
                                                        GoogleFonts.getFont(
                                                      GlobalFlag.GoogleFonts,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: MobileController
                                                                  .text !=
                                                              ""
                                                          ? GlobalAppColor
                                                              .titleTextColor
                                                          : Colors.grey[400],
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 16.sp,
                                                      letterSpacing: 0.5,
                                                    ),
                                                    textFieldController:
                                                        MobileController,
                                                    inputBorder:
                                                        const OutlineInputBorder(),
                                                  ),
                                                ),
                                              )),
                                        ),
                                        new SizedBox(
                                          height: Adaptive.h(4),
                                        ),

                                        new GestureDetector(
                                          onTap: () async {
                                            KeyboardUtil.hideKeyboard(context);
                                            var result = await Connectivity()
                                                .checkConnectivity();
                                            if (result ==
                                                ConnectivityResult.none) {
                                              _showDialog(GlobalFlag
                                                  .InternetNotConnected);
                                            } else {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                                setState(() {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            OTPScreen(
                                                              SendMobileNumberWithCode:
                                                                  GetMobileNumberWithCode,
                                                              SendMobileCode:
                                                                  GetMobileCode,
                                                              SendMobileDialCodee:
                                                                  GetMobileDialCode,
                                                              SendMobileNumberWithoutCode:
                                                                  GetMobileNumberWithoutCode,
                                                            )),
                                                  );
                                                  MobileController.clear();
                                                });
                                              }
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 55,
                                            color: Colors.black,
                                            // decoration: new BoxDecoration(
                                            //     borderRadius:
                                            //         BorderRadius.circular(10.0),
                                            //     color: MobileController.text ==
                                            //             ""
                                            //         ? const Color(0xFF93B8FE)
                                            //         : GlobalAppColor
                                            //             .BtnColorCode),
                                            child: Text(
                                              "Continue",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.getFont(
                                                GlobalFlag.GoogleFonts,
                                                fontStyle: FontStyle.normal,
                                                color: GlobalAppColor
                                                    .WhiteColorCode,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                        new SizedBox(
                                          height: Adaptive.h(4),
                                        ),
                                        new Align(
                                          alignment: Alignment.topCenter,
                                          child: new Text(
                                            "By signing up, you agree to our terms of use and privacy policy.",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.getFont(
                                              GlobalFlag.GoogleFonts,
                                              fontStyle: FontStyle.normal,
                                              color:
                                                  GlobalAppColor.titleTextColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ),
                                        new SizedBox(height: 4),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    ));
  }
}
