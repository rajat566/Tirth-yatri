import 'package:flutter/material.dart';
import 'package:tirthyatri/global%20varibles/global_variables.dart';
import 'package:tirthyatri/screens/yatra.dart';

import 'details.dart';

class Trip extends StatefulWidget {
//  const Trip({super.key});

  @override
  State<Trip> createState() => _TripState();
}

class _TripState extends State<Trip> {
  int gottenStars = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("trip"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: const DecorationImage(
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
        backgroundColor: Color(0XFFCAA883),
      ),
      body: ListView.builder(
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
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  GlobalVariables.yatraImages[index]['name']!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Wrap(
                                    children: List.generate(5, (index) {
                                  return Icon(Icons.star,
                                      size: 14,
                                      color: index < gottenStars
                                          ? Colors.yellow
                                          : Color.fromARGB(255, 175, 173, 173));
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
                                  GlobalVariables.yatraImages[index]['cost']!,
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
    );
  }
}
