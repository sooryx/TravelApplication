import 'package:app/pages/detail_page.dart';
import 'package:app/pages/detail_page2.dart';
import 'package:flutter/material.dart';
import 'package:app/misc/colors.dart';
import 'package:app/widgets/app_large_text.dart';
import 'package:app/widgets/app_text.dart';

import 'detail_page3.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<String> tripHeadings = [
    "Tarsar Marsar Trek, Jammu & Kashmir",
    "Hampta Pass Trek, Himachal Pradesh",
    "Manali, Himachal Pradesh",
    "Munnar, Kerala",
    "Kodaikanal, Tamil Nadu",
    "Varkala Cliff, Kerala",
    "900 Kandi, Kerala",
    "Darjeeling, West Bengal"
  ];

  List<String> tripDetails = [
    "Last date to enroll July 25",
    "Last date to enroll July 27",
    "Last date to enroll July 30",
    "Last date to enroll August 02",
    "Last date to enroll August 05",
    "Last date to enroll August 07",
    "Last date to enroll August 15",
    "Last date to enroll August 20",
  ];
  var placesImages = [
    "img/Package-two.png",
    "img/Package-one.png",
    "img/Package-three.png",
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ICONS
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_rounded, size: 30, color: Colors.black54),
                  onPressed: () {
                    Navigator.pop(context); // Redirect to the previous page (WelcomePage)
                  },
                ),
                const SizedBox(width: 250,),
                IconButton(
                  icon: const Icon(Icons.account_circle, size: 30, color: Colors.black54,),
                  onPressed: () {},
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.maxFinite,
            child: Align(
              alignment: Alignment.center,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: const [
                   Tab(text: "Popular Packages"),
                   Tab(text: "Upcoming Trips"),
                  //  Tab(text: "Emotions"),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: TabBarView(
                controller: _tabController,
                children: [
                  // POPULAR PACKAGES
                  ListView.builder(
                    itemCount: placesImages.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const DetailPage(),
                                transitionDuration: const Duration(milliseconds: 300),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  var begin = const Offset(0.0, 1.0);
                                  var end = Offset.zero;
                                  var curve = Curves.ease;

                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const DetailPageTwo(),
                                transitionDuration: const Duration(milliseconds: 300),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  var begin = const Offset(0.0, 1.0);
                                  var end = Offset.zero;
                                  var curve = Curves.ease;

                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          } else if (index == 2) {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const DetailPageThree(),
                                transitionDuration: const Duration(milliseconds: 300),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  var begin = const Offset(0.0, 1.0);
                                  var end = Offset.zero;
                                  var curve = Curves.ease;

                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          }
                        },
                        child: Hero(
                          tag: 'image$index',
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(placesImages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  // upcoming trips
                  ListView.builder(
                    itemCount: tripHeadings.length, // Replace with the actual number of trips
                    itemBuilder: (BuildContext context, int index) {
                      String heading = tripHeadings[index];
                      String detail = tripDetails[index];

                      return ListTile(
                        title: Text(heading),
                        subtitle: Text(detail),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),

          // EXPLORE SEE ALL
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore more", size: 20),
                AppText(text: "See all", color: AppColors.textColor1),
              ],
            ),
          ),
          const SizedBox(height: 5),

          // BOTTOM ICONS
          Container(
            height: 120,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                var images = {
                  "balloning.png": "Balloning",
                  "hiking.png": "Hiking",
                  "kayaking.png": "Kayaking",
                  "snorkling.png": "Snorkling",
                };
                return Container(
                  margin: const EdgeInsets.only(right: 30),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("img/" + images.keys.elementAt(index)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: AppText(
                          text: images.values.elementAt(index),
                          color: AppColors.textColor2,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // bottomNavigationBar: MainPage(),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width / 2 - radius / 2, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
