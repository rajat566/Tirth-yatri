import 'package:flutter/material.dart';
import 'package:tirthyatri/widgets/app_button.dart';

class Details extends StatefulWidget {
  // const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  height: 350,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/kedarnath.jpg"),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                left: 20,
                top: 70,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                  ],
                )),
            Positioned(
                top: 330,
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Badrinath",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                          Text("\$ 250",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFFCAA883)))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color(0XFFCAA883),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Kedarnath , Uttrakhand",
                            style: TextStyle(color: Color(0XFFCAA883)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: index < gottenStars
                                    ? Colors.yellow
                                    : Color.fromARGB(255, 175, 173, 173));
                          })),
                          SizedBox(
                            width: 10,
                          ),
                          Text("4.0", style: TextStyle(color: Colors.black45))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "People",
                        style: TextStyle(
                            color: Colors.black54.withOpacity(0.8),
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Number of people in your group",
                        style: TextStyle(
                            color: Colors.black12.withOpacity(0.2),
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: AppButtons(
                                size: 50,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : Color(0xffEEEEEE),
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : Colors.black45,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8), fontSize: 20),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "This 134 kilometers Highway 99 trail gives you a taste of the canada mountains,from Horseshoe Bay in the north of vancouver to pemberton.",
                        style: TextStyle(color: Color(0XFFCAA883)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          AppButtons(
                            size: 50,
                            color: Color(0xffEEEEEE),
                            backgroundColor: Colors.white,
                            borderColor: Colors.black.withOpacity(0.8),
                            isIcon: true,
                            icon: Icons.favorite_border,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 260,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0XFFCAA883)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Book Trip Now",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  )
                                ]),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            // Positioned(
            //   bottom: 7,
            //   left: 20,
            //   child: Row(
            //     children: [
            //       AppButtons(
            //         size: 50,
            //         color: Color(0xffEEEEEE),
            //         backgroundColor: Colors.white,
            //         borderColor: Colors.black.withOpacity(0.8),
            //         isIcon: true,
            //         icon: Icons.favorite_border,
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Container(
            //         width: 260,
            //         height: 50,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: Color(0XFFCAA883)),
            //         child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Text(
            //                 "Book Trip Now",
            //                 style: TextStyle(fontSize: 18, color: Colors.white),
            //               ),
            //               SizedBox(
            //                 width: 5,
            //               ),
            //               Icon(
            //                 Icons.arrow_right,
            //                 color: Colors.white,
            //               ),
            //               SizedBox(
            //                 width: 2,
            //               ),
            //               Icon(
            //                 Icons.arrow_right,
            //                 color: Colors.white,
            //               ),
            //               SizedBox(
            //                 width: 2,
            //               ),
            //               Icon(
            //                 Icons.arrow_right,
            //                 color: Colors.white,
            //               )
            //             ]),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
