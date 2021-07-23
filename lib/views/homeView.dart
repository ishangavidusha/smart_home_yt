import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home_yt/models/initData.dart';
import 'package:smart_home_yt/util/appColors.dart';
import 'package:smart_home_yt/util/cardGridView.dart';
import 'package:smart_home_yt/util/circleTabIndicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late ScrollController scrollController;
  late TabController tabController;

  @override
  void initState() {
    scrollController = ScrollController();
    tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool value) {
          return [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                  height: devHeight * 0.06,
                ),
                Container(
                  width: devWidth,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Hey, ",
                        style: TextStyle(
                          fontSize: devWidth * 0.05,
                          color: AppColors.minorTextColor
                        ),
                      ),
                      Text(
                        "DoKnowCode",
                        style: TextStyle(
                          fontSize: devWidth * 0.05,
                          color: AppColors.mainTextColor
                        ),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        "assets/images/menu.svg",
                        color: AppColors.minorTextColor,
                        width: devWidth * 0.05,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: devWidth,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Today July 28, 2021",
                    style: TextStyle(
                      fontSize: devWidth * 0.03,
                      color: AppColors.minorTextColor
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  decoration: ShapeDecoration(
                    shape: SquircleBorder(
                      radius: BorderRadius.circular(80),
                    ),
                    gradient: LinearGradient(
                      colors: AppColors.cardGradeantColors,
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter
                    ),
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        spreadRadius: 8,
                        offset: Offset(0, 6)
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/weather-app.png", scale: 12,),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cloudy",
                                style: TextStyle(
                                  fontSize: devWidth * 0.04,
                                  color: AppColors.mainTextColor
                                ),
                              ),
                              Text(
                                "Sidoluhur, Godean",
                                style: TextStyle(
                                  fontSize: devWidth * 0.03,
                                  color: AppColors.minorTextColor
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "28°",
                            style: TextStyle(
                              fontSize: devWidth * 0.08,
                              color: AppColors.mainTextColor
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "31°C",
                                style: TextStyle(
                                  fontSize: devWidth * 0.04,
                                  color: AppColors.mainTextColor
                                ),
                              ),
                              Text(
                                "Sensible",
                                style: TextStyle(
                                  fontSize: devWidth * 0.03,
                                  color: AppColors.minorTextColor
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "65%",
                                style: TextStyle(
                                  fontSize: devWidth * 0.04,
                                  color: AppColors.mainTextColor
                                ),
                              ),
                              Text(
                                "Humidity",
                                style: TextStyle(
                                  fontSize: devWidth * 0.03,
                                  color: AppColors.minorTextColor
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "3",
                                style: TextStyle(
                                  fontSize: devWidth * 0.04,
                                  color: AppColors.mainTextColor
                                ),
                              ),
                              Text(
                                "W. Force",
                                style: TextStyle(
                                  fontSize: devWidth * 0.03,
                                  color: AppColors.minorTextColor
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "1009 hPa",
                                style: TextStyle(
                                  fontSize: devWidth * 0.04,
                                  color: AppColors.mainTextColor
                                ),
                              ),
                              Text(
                                "Pressure",
                                style: TextStyle(
                                  fontSize: devWidth * 0.03,
                                  color: AppColors.minorTextColor
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Theme(
                  data: ThemeData().copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent
                  ),
                  child: TabBar(
                    controller: tabController,
                    labelStyle: TextStyle(
                      color: AppColors.mainTextColor
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: AppColors.minorTextColor
                    ),
                    labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    indicator: CircleTabIndicator(color: AppColors.mainTextColor, radius: 4),
                    tabs: [
                      Text(
                        "Living Room",
                      ),
                      Text(
                        "Bedroom",
                      ),
                      Text(
                        "Bathroom",
                      ),
                      Text(
                        "Kitchen",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            CardGridView(data: livingRoomData,),
            CardGridView(data: bedRoomData,),
            CardGridView(data: bathRoomData,),
            CardGridView(data: kitchenData,),
          ],
        ),
      ),
    );
  }
}