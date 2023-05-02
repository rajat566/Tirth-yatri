import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'GlobalAppColor.dart';
import 'GlobalFlag.dart';

//=============================GlobalFunction=================================//
class GlobalFunction {
  // ignore: non_constant_identifier_names
  final GlobalKey<ScaffoldState> _KeyExitApp = GlobalKey<ScaffoldState>();

//========================ExitAppAlert========================================//
  // ignore: non_constant_identifier_names
  // Future<void> ExitAppAlert(BuildContext context) async {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: true, // user must tap button!
  //     builder: (BuildContext context) => ResponsiveSizer(
  //       builder: (context, orientation, deviceType) {
  //         return new WillPopScope(
  //             onWillPop: () async => false,
  //             key: _KeyExitApp,
  //             child: AlertDialog(
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.all(Radius.circular(12.0))),
  //               contentPadding: EdgeInsets.only(top: 0.0),
  //               content: Container(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: <Widget>[
  //                     new Container(
  //                       decoration: BoxDecoration(
  //                         color: GlobalAppColor.AppColorCode,
  //                         borderRadius: BorderRadius.only(
  //                             topLeft: Radius.circular(12.0),
  //                             topRight: Radius.circular(12.0)),
  //                       ),
  //                       padding: EdgeInsets.only(left: 10, right: 10),
  //                       child: Container(
  //                         padding: EdgeInsets.only(top: 15, bottom: 15),
  //                         child: Center(
  //                             child: Text("ExitanApp",
  //                                 textAlign: TextAlign.center,
  //                                 style: GoogleFonts.getFont(
  //                                   GlobalFlag.GoogleFonts,
  //                                   fontStyle: FontStyle.normal,
  //                                   color: GlobalAppColor.WhiteColorCode,
  //                                   fontWeight: FontWeight.bold,
  //                                   fontSize: 15,
  //                                   letterSpacing: 1,
  //                                 ))),
  //                       ),
  //                     ),
  //                     new Container(
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           Flexible(
  //                             child: new GestureDetector(
  //                               onTap: () async {
  //                                 // KeyboardUtil.hideKeyboard(context);
  //                                 Navigator.pop(context);
  //                                 //   KeyboardUtil.hideKeyboard(context);
  //                                 GlobalFlag.TimerStartEnd = false;
  //                               },
  //                               child: Container(
  //                                 color: GlobalAppColor.BlackColorCode,
  //                                 alignment: Alignment.center,
  //                                 height: 5,
  //                                 child: Text(
  //                                   "Yes",
  //                                   style: GoogleFonts.getFont(
  //                                     GlobalFlag.GoogleFonts,
  //                                     fontStyle: FontStyle.normal,
  //                                     color: GlobalAppColor.WhiteColorCode,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14,
  //                                     letterSpacing: 1,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           new Container(
  //                             width: 1,
  //                             color: Colors.white,
  //                           ),
  //                           Flexible(
  //                             child: new GestureDetector(
  //                               onTap: () async {
  //                                 //  KeyboardUtil.hideKeyboard(context);
  //                                 Navigator.pop(context);
  //                                 // KeyboardUtil.hideKeyboard(context);
  //                               },
  //                               child: Container(
  //                                 color: GlobalAppColor.BlackColorCode,
  //                                 alignment: Alignment.center,
  //                                // height: Adaptive.h(5.5),
  //                                 child: Text(
  //                                   "No",
  //                                   style: GoogleFonts.getFont(
  //                                     GlobalFlag.GoogleFonts,
  //                                     fontStyle: FontStyle.normal,
  //                                     color: GlobalAppColor.WhiteColorCode,
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 14,
  //                                     letterSpacing: 1,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ));
  //       },
  //     ),
  //   );
  // }

//========================GlobalTimer=========================================//
  // Timer? timer;

  // // ignore: non_constant_identifier_names
  // void GlobalTimer(BuildContext context) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   timer = Timer.periodic(const Duration(seconds: 10), (timer) {
  //     if (GlobalFlag.TimerStartEnd == false) {
  //       timer.cancel();
  //     } else {
  //       if (prefs.getBool('ChatStatus') == true &&
  //           prefs.getString('ChatID') != null) {
  //         MoniterApi(context);
  //       }
  //   }
//----------------------------------------------------------------------------//
  // });
  //}

//========================_checkConnectivityState=============================//
  // ignore: non_constant_identifier_names
  Future<void> CheckConnectivityState(_connectivityResult, NotConnected) async {
    if (_connectivityResult == ConnectivityResult.none) {
      NotConnected = true;
    } else {
      NotConnected = false;
    }
  }

//----------------------validateEmail-----------------------------------------//
  // String? validateEmail(String? value) {
  //   String pattern = GlobalFlag.PattternEmails.toString();
  //   RegExp regExp = new RegExp(pattern);
  //   if (value!.length == 0) {
  //     return GlobalFlag.EmailRequireds.toString();
  //   } else if (!regExp.hasMatch(value)) {
  //     return GlobalFlag.InvalidEmails.toString();
  //   } else {
  //     return null;
  //   }
  // }

//----------------------validatePassword--------------------------------------//
  // String? validatePassword(String? value) {
  //   Pattern pattern = GlobalFlag.PattternPassword.toString();
  //   RegExp regex = new RegExp("kk");
  //   if (value!.isEmpty) {
  //     return GlobalFlag.PasswordRequireds.toString();
  //   } else {
  //     if (!regex.hasMatch(value))
  //       return GlobalFlag.PasswordInvalid.toString();
  //     else
  //       return null;
  //   }
  // }

//----------------------validateFullName--------------------------------------//
  // String? validateFullName(String? value) {
  //   String patttern = r'';
  //   RegExp regExp = new RegExp(patttern);
  //   if (value!.length == 0) {
  //     return GlobalFlag.FullNameRequireds.toString();
  //   } else if (!regExp.hasMatch(value)) {
  //     return GlobalFlag.FullNamemustbeNeed.toString();
  //   }
  //   return null;
  // }

//----------------------validateFirstName--------------------------------------//
  // String? validateFirstName(String? value) {
  //   String patttern = r'';
  //   RegExp regExp = new RegExp(patttern);
  //   if (value!.length == 0) {
  //     return GlobalFlag.FirstNameRequireds.toString();
  //   } else if (!regExp.hasMatch(value)) {
  //     return GlobalFlag.FirstNamemustbeNeed.toString();
  //   }
  //   return null;
  // }

//----------------------validateLastName--------------------------------------//
  // String? validateLastName(String? value) {
  //   String patttern = r'';
  //   RegExp regExp = new RegExp(patttern);
  //   if (value!.length == 0) {
  //     return GlobalFlag.LastNameRequireds.toString();
  //   } else if (!regExp.hasMatch(value)) {
  //     return GlobalFlag.LastNamemustbeNeed.toString();
  //   }
  //   return null;
  // }

//----------------------validateAddress---------------------------------------//
  // String? validateAddress(String? value) {
  //   String patttern = r'';
  //   RegExp regExp = new RegExp(patttern);
  //   if (value!.length == 0) {
  //     return GlobalFlag.AddressRequireds.toString();
  //   } else if (!regExp.hasMatch(value)) {
  //     return GlobalFlag.AddressmustbeNeed.toString();
  //   }
  //   return null;
  // }

//----------------------validateMobile----------------------------------------//
  // String? validateMobile(String? value) {
  //   String patttern = GlobalFlag.PattternNumber.toString();
  //   RegExp regExp = new RegExp(patttern);
  //   if (value!.length == 0) {
  //     return GlobalFlag.MobileisRequired.toString();
  //   } else if (value.length != 10) {
  //     return GlobalFlag.Mobilenumbermust10digits.toString();
  //   } else if (!regExp.hasMatch(value)) {
  //     return GlobalFlag.MobileNumbermustbedigits.toString();
  //   }
  //   return null;
  // }

//=============================convertDateTimeDisplay=========================//
  convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd hh:mm:ss');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

//========================FormSubmitApi=======================================//
  // ignore: non_constant_identifier_names
//   Future<void> MoniterApi(BuildContext context) async {
//     final prefs = await SharedPreferences.getInstance();
//     try {
//       var headers = {'Cookie': 'ci_session=gs8bgudplos1e7r29bivp7nv43bv9mas'};
//       var request =
//           http.MultipartRequest('POST', Uri.parse('$MonitorServiceUrl'));
//       request.fields.addAll({
//         'Token': GlobalFlag.ServerToken,
//         'Customer_ID': prefs.getString("LoginUserID").toString(),
//         'Chat_ID': prefs.getString("ChatID").toString()
//       });
//       request.headers.addAll(headers);
//       http.StreamedResponse response = await request.send();
//       if (response.statusCode == 200) {
//         //print(await response.stream.bytesToString());
//         await response.stream.bytesToString().then((value) {
//           // ignore: non_constant_identifier_names
//           var ReciveJsonData = json.decode(value);
//           if (ReciveJsonData["ApiStatus"] == true) {
//             if (ReciveJsonData["data"][0]["Status"] == "Terminated") {
//               prefs.remove("ChatStatus");
//               prefs.remove("ChatID");
//             } else {
//               if (ReciveJsonData["data"][0]["Status_code"] == 2 ||
//                   ReciveJsonData["data"][0]["Status_code"] == "2" &&
//                       ReciveJsonData["data"][0]["Status"] == "Active") {
//                 GlobalFlag.TimerStartEnd = false;
//                 GlobalFlag.TimerStartEnd = false;
//                 GlobalFlag.TimerStartEnd = false;
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => AstrologerAcceptReject(
//                             ScreenType: "DashBoard",
//                             AstrologerChatID: ReciveJsonData["data"][0]
//                                 ["chat_id"],
//                             AstrologerID: ReciveJsonData["data"][0]
//                                 ["Astrologer_ID"],
//                             AstrologerCustomerID: ReciveJsonData["data"][0]
//                                 ["Customer_ID"],
//                             AstrologerFirstName: ReciveJsonData["data"][0]
//                                 ["First_name"],
//                             AstrologerLastName: ReciveJsonData["data"][0]
//                                 ["Last_name"],
//                             AstrologerEmail: ReciveJsonData["data"][0]["Email"],
//                             AstrologerMobile: ReciveJsonData["data"][0]
//                                 ["Mobile"],
//                             AstrologerGender: ReciveJsonData["data"][0]
//                                 ["Gender"],
//                             AstrologerProfilePic:
//                                 ReciveJsonData["data"][0]["ProfilePic"] == null
//                                     ? GlobalServiceURL.NoImagesUrl
//                                     : GlobalServiceURL.AstrologerImageBaseURL +
//                                         ReciveJsonData["data"][0]["ProfilePic"],
//                             AstrologerFCM: ReciveJsonData["data"][0]
//                                 ["FCM_Token"],
//                             UserSelectedType: ReciveJsonData["data"][0]
//                                 ["Type"])));
//               }
//             }
//           } else {
//             prefs.remove("ChatStatus");
//             prefs.remove("ChatID");
//           }
//         });
//       } else {
//         prefs.remove("ChatStatus");
//         prefs.remove("ChatID");
//       }
//     } catch (e) {
//       return;
//     }
//   }
}

//=============================GenderDropDown=================================//
class GenderDropDown {
  int id;
  String name;

  GenderDropDown(this.id, this.name);

  static List<GenderDropDown> getGender() {
    return <GenderDropDown>[
      GenderDropDown(1, 'Male'),
      GenderDropDown(2, 'Female'),
    ];
  }
}

//=============================DailyHoroscope=================================//
// ignore: non_constant_identifier_names
List DailyHoroscopeList = [
  {
    "name": "aries",
    "images":
        "https://eastrohelp.com/public/img-category/aries-ESSIrLknfTvMo9aNIxUEKLWxCmBBfCEM.png",
    "mobile_image": "https://eastrohelp.com/public/images/aries.png",
    "zodiac_dates": "Mar 21 - Apr 19"
  },
  {
    "name": "taurus",
    "images":
        "https://eastrohelp.com/public/img-category/tourus-yPglgulYJvENzy9qnGbB3rYAcFwarDtI.png",
    "mobile_image": "https://eastrohelp.com/public/images/taurus.png",
    "zodiac_dates": "Apr 20 - May 20"
  },
  {
    "name": "gemini",
    "images":
        "https://eastrohelp.com/public/img-category/gemini-qBpWIioVdOQXYazEL8jp0Pme1q4AMzvp.png",
    "mobile_image": "https://eastrohelp.com/public/images/gemini.png",
    "zodiac_dates": "May 21 - Jun 21"
  },
  {
    "name": "cancer",
    "images":
        "https://eastrohelp.com/public/img-category/cancer-jgNU2BIUuQtZrpjHuTzGeRsMQxPJfnc5.png",
    "mobile_image": "https://eastrohelp.com/public/images/cancer.png",
    "zodiac_dates": "Jun 22 - Jul 22"
  },
  {
    "name": "leo",
    "images":
        "https://eastrohelp.com/public/img-category/leo-iZFnu1yh6KIBxXv8ur3Y3naIvEgHqOCF.png",
    "mobile_image": "https://eastrohelp.com/public/images/leo.png",
    "zodiac_dates": "Jul 23 - Aug 22"
  },
  {
    "name": "virgo",
    "images":
        "https://eastrohelp.com/public/img-category/virgo-4Id0VjwJqQXl2ZTUysNPrtnZ1268Z3Y4.png",
    "mobile_image": "https://eastrohelp.com/public/images/virgo.png",
    "zodiac_dates": "Aug 23 - Sep 22"
  },
  {
    "name": "libra",
    "images":
        "https://eastrohelp.com/public/img-category/libra-xqkoWoS8eresF8Scm8bzHe3aKFF95GFf.png",
    "mobile_image": "https://eastrohelp.com/public/images/libra.png",
    "zodiac_dates": "Sep 23 - Oct 23"
  },
  {
    "name": "scorpio",
    "images":
        "https://eastrohelp.com/public/img-category/scorpio-g6Wtyzt5pEDP6XRuL6KVzixG5orWTxYD.png",
    "mobile_image": "https://eastrohelp.com/public/images/scorpio.png",
    "zodiac_dates": "Oct 24 - Nov 21"
  },
  {
    "name": "sagittarius",
    "images":
        "https://eastrohelp.com/public/img-category/sagittarius-DGu7CACkHEsMnMG8IiRq3n0LqwufjGJ6.png",
    "mobile_image": "https://eastrohelp.com/public/images/saggitarius.png",
    "zodiac_dates": "Nov 22 - Dec 21"
  },
  {
    "name": "capricorn",
    "images":
        "https://eastrohelp.com/public/img-category/capricorn-PJrbet1IJalmkRcHdBX1ZRCGAp2pS6fQ.png",
    "mobile_image": "https://eastrohelp.com/public/images/capricon.png",
    "zodiac_dates": "Dec 22 - Jan 19"
  },
  {
    "name": "aquarius",
    "images":
        "https://eastrohelp.com/public/img-category/aquarius-hpTfXWo6jFIe1n9BlVaymSX6SJOE8Tcg.png",
    "mobile_image": "https://eastrohelp.com/public/images/aquarius.png",
    "zodiac_dates": "Jan 20 - Feb 18"
  },
  {
    "name": "pisces",
    "images":
        "https://eastrohelp.com/public/img-category/pisces-lwLiQupNTeWIvDtE5rM5pkYXxkGFfG2T.png",
    "mobile_image": "https://eastrohelp.com/public/images/pisces.png",
    "zodiac_dates": "Feb 19 - Mar 20"
  }
];
