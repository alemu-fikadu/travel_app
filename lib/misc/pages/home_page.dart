// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element, must_be_immutable, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:travel_app/widget/app_large_text.dart';
import 'package:travel_app/widget/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "afric-one.png": "Afric",
    "bf.png": "BF",
    "cmac.png": "C mac",
    "c.png": "C big",
    "welcome_tree.jpg": "Travel",
    "welcome-two.jpg": "Voyage",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 35, left: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.grey,
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),
                      image: const DecorationImage(
                        image: AssetImage("image/welcome-one.jpg"),
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: Colors.blue, radius: 4),
                tabs: const [
                  Tab(text: "Places"),
                  Tab(text: "Inspirations"),
                  Tab(text: "Emotions")
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 10),
            height: 230,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: const EdgeInsets.only(right: 40),
                          width: 150,
                          height: 230,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: const DecorationImage(
                              image: AssetImage("image/welcome_tree.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ));
                    }),
                Container(
                  width: double.maxFinite,
                  height: 230,
                  child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            margin: const EdgeInsets.only(right: 40),
                            width: 150,
                            height: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue.withOpacity(0.2),
                              image: DecorationImage(
                                image: AssetImage(
                                    "image/${images.keys.elementAt(index)}"),
                              ),
                            ));
                      }),
                ),
                Container(
                  width: 200,
                  height: 300,
                  child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            margin: const EdgeInsets.only(right: 40),
                            width: 150,
                            height: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue.withOpacity(0.2),
                              image: DecorationImage(
                                image: AssetImage(
                                    "image/${images.keys.elementAt(index)}"),
                              ),
                            ));
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Explore more",
                  size: 20,
                ),
                AppText(
                  text: "See all",
                  size: 15,
                  color: Colors.blue,
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 90,
            width: double.maxFinite,
            margin: const EdgeInsets.only(
              left: 20,
            ),
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: 30,
                        top: 10,
                      ),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.withOpacity(0.2),
                        image: DecorationImage(
                          image: AssetImage(
                              "image/${images.keys.elementAt(index)}"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: AppText(
                        text: images.values.elementAt(index),
                        size: 12,
                        color: Colors.grey,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
