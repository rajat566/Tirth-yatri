// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tirthyatri/screens/details.dart';
import 'package:tirthyatri/screens/drawer.dart';
import 'package:tirthyatri/screens/drawerr.dart';

import '../global varibles/global_variables.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  // const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int gottenStars = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0XFFCAA883),
        title: const Text("Tirth yatri"),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/prof.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                border: Border.all(
                  color: Colors.amber,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(right: 220, top: 20),
              child: Text("Char Dham",
                  style: GoogleFonts.lato(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                //  physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: GlobalVariables.yatraImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
                    },
                    child: Container(
                      height: 197,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Color(0XFFCAA883),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Details()));
                              },
                              child: Image.asset(
                                GlobalVariables.yatraImages[index]['image']!,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                                height: 122,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        GlobalVariables.yatraImages[index]
                                            ['name']!,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Wrap(
                                          children: List.generate(5, (index) {
                                        return Icon(Icons.star,
                                            size: 14,
                                            color: index < gottenStars
                                                ? Colors.yellow
                                                : Color.fromARGB(
                                                    255, 175, 173, 173));
                                      })),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        GlobalVariables.yatraImages[index]
                                            ['cost']!,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        GlobalVariables.yatraImages[index]
                                            ['destination']!,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: const EdgeInsets.all(10),
                      ),
                    ),
                  );
                }),
          ),

          SizedBox(height: 2),

          // Padding(
          //   padding: const EdgeInsets.only(right: 200),
          //   child: Text(
          //     "Explore More",
          //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          //   ),
          // ),
          SizedBox(
            height: 1,
          ),
          // ListView.builder(
          //   itemCount: dataList.length,
          //   scrollDirection: Axis.horizontal,
          //   itemExtent: 75,
          //   itemBuilder: (context, index) {
          //     return GestureDetector(
          //       // onTap: () => navigateToCategoryPage(
          //       //   context,
          //       //   GlobalVariables.categoryImages[index]['title']!,
          //       // ),
          //       child: Column(
          //         children: [
          //           Container(
          //             margin: const EdgeInsets.all(10),
          //             height: 30,
          //             width: 90,
          //             decoration: BoxDecoration(
          //                 color: const Color.fromARGB(179, 235, 213, 213),
          //                 borderRadius: BorderRadius.circular(5)),
          //             padding: const EdgeInsets.symmetric(horizontal: 10),
          //             child: Icon(
          //               dataList[index]['icon'],
          //             ),
          //           ),
          //           const SizedBox(
          //             height: 2,
          //           ),
          //           Text(
          //             dataList[index]['title']!,
          //             style: const TextStyle(
          //               fontSize: 12,
          //               fontWeight: FontWeight.w800,
          //             ),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // )

          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Text(
              "Explore More",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 1,
          ),

          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber, width: 1),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),

                        child: Icon(
                          Icons.shopping_basket,
                          size: 45,
                        ),
                        // fit: BoxFit.cover,
                      ),
                      Text("Map",
                          style: GoogleFonts.lato(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber, width: 1),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),

                        child: Icon(
                          Icons.house,
                          size: 45,
                        ),
                        // fit: BoxFit.cover,
                      ),
                      Text("Accomdation",
                          style: GoogleFonts.lato(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber, width: 1),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),

                        child: Icon(
                          Icons.calculate,
                          size: 45,
                        ),
                        // fit: BoxFit.cover,
                      ),
                      Text("Contact",
                          style: GoogleFonts.lato(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber, width: 1),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),

                        child: Icon(
                          Icons.alarm,
                          size: 45,
                        ),
                        // fit: BoxFit.cover,
                      ),
                      Text("Emergency",
                          style: GoogleFonts.lato(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // SizedBox(
          //   height: 130,
          //   child: ListView.builder(
          //     itemCount: GlobalVariables.categoryImages.length,
          //     scrollDirection: Axis.horizontal,
          //     itemExtent: 75,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //         // onTap: () => navigateToCategoryPage(
          //         //   context,
          //         //   GlobalVariables.categoryImages[index]['title']!,
          //         // ),
          //         child: Column(
          //           children: [
          //             Container(
          //               margin: const EdgeInsets.all(10),
          //               height: 60,
          //               width: 90,
          //               decoration: BoxDecoration(
          //                   color: const Color.fromARGB(179, 235, 213, 213),
          //                   borderRadius: BorderRadius.circular(5)),
          //               padding: const EdgeInsets.symmetric(horizontal: 10),
          //               child: ClipRRect(
          //                 borderRadius: BorderRadius.circular(10),
          //                 child: Image.asset(
          //                   GlobalVariables.categoryImages[index]['icon']!,
          //                   // fit: BoxFit.cover,
          //                   height: 10,
          //                   width: 20,
          //                 ),
          //               ),
          //             ),
          //             const SizedBox(
          //               height: 2,
          //             ),
          //             Text(
          //               GlobalVariables.categoryImages[index]['title']!,
          //               style: const TextStyle(
          //                 fontSize: 12,
          //                 fontWeight: FontWeight.w800,
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }

  List dataList = [
    {
      "title": "Map",
      "icon": Icons.payment,
    },
    {
      "title": "Map",
      "icon": Icons.payment,
    },
    {
      "title": "Map",
      "icon": Icons.payment,
    },
    {
      "title": "Map",
      "icon": Icons.payment,
    }
  ];
}
