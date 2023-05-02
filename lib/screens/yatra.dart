import 'package:flutter/material.dart';
import 'package:tirthyatri/screens/details.dart';

class Yatra extends StatefulWidget {
  //const Yatra({super.key});

  @override
  State<Yatra> createState() => _YatraState();
}

class _YatraState extends State<Yatra> with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFCAA883),
        title: Text("yatra"),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Yatra",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicator: CircleTabIndicator(color: Colors.red, radius: 4),
                labelColor: Colors.black,
                controller: _controller,
                labelPadding: EdgeInsets.only(left: 20, right: 20),
                isScrollable: true,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Places',
                  ),
                  Tab(text: 'Inspiration'),
                  Tab(text: 'Emotions'),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _controller,
              children: [
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Global.Images.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details()));
                          },
                          child: Container(
                            width: 200,
                            height: 300,
                            margin: const EdgeInsets.only(
                                right: 10, top: 10, bottom: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(
                                    Global.Images[index],
                                  ),
                                  fit: BoxFit.fitHeight),
                            ),
                          ));
                    }),
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details()));
                          },
                          child: AnimatedOpacity(
                              opacity: 1,
                              duration: Duration(milliseconds: 2000),
                              child: Container(
                                width: 200,
                                height: 300,
                                margin: const EdgeInsets.only(
                                    right: 10, top: 10, bottom: 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/badrinath.jpg"),
                                      fit: BoxFit.fitHeight),
                                ),
                              )));
                    }),
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details()));
                          },
                          child: AnimatedOpacity(
                              opacity: 1,
                              duration: Duration(milliseconds: 2000),
                              child: Container(
                                width: 200,
                                height: 300,
                                margin: const EdgeInsets.only(
                                    right: 10, top: 10, bottom: 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        
                                          "assets/images/gangotri.jpg"),
                                      fit: BoxFit.fitHeight),
                                ),
                              )));
                    }),
                // Material(
                //   child: ListTile(
                //     leading: CircleAvatar(
                //       backgroundColor: Colors.grey,
                //     ),
                //     title: Text("Content"),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

class Global {
  static const List<String> Images = [
    'assets/images/kedarnath.jpg',
    'assets/images/badrinath.jpg',
    'assets/images/gangotri.jpg',
  ];
}
