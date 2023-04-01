import 'package:fiteness_x/TabScreens/camera.dart';
import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:fiteness_x/modals/firebaseservice.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fiteness_x/TabScreens/meals.dart';
import 'package:fiteness_x/TabScreens/profile.dart';
import 'package:fiteness_x/TabScreens/workout.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';

import '../TabScreens/home_screen.dart';

class TabsPage extends StatefulWidget {
  static const routeName = '/tabs';
  @override
  TabsPageState createState() {
    return TabsPageState();
  }
}

class TabsPageState extends State<TabsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<Map<String, dynamic>> pages = [
    {'screenWidget': HomeScreen(), 'tabBarTitle': ''},
    {'screenWidget': MealsScreen(), 'tabBarTitle': 'Meals'},
    {'screenWidget': WorkoutScreen(), 'tabBarTitle': 'Workouts'},
    {'screenWidget': Camera_Screen(), 'tabBarTitle': 'Progress Tracker'},
    {'screenWidget': ProfileScreen(), 'tabBarTitle': 'Profile'},
  ];
  var pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageIndex != 0
          ? AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Color.fromRGBO(141, 141, 215, 0),
              elevation: 0,
              title: Text(pages[pageIndex]['tabBarTitle'],
                  style: Theme.of(context).textTheme.titleSmall),
            )
          : null,
      bottomNavigationBar: Container(
          height: 60,
          child: BottomNavigationBar(
            enableFeedback: false,
            selectedIconTheme: IconThemeData(color: Color(0xFFC58BF2)),
            selectedLabelStyle: TextStyle(fontSize: 0),
            unselectedLabelStyle: TextStyle(fontSize: 0),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            elevation: 10,
            onTap: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            currentIndex: pageIndex,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 25,
                  ),
                  label: 'Home',
                  activeIcon: Icon(Icons.home_filled, size: 25)),
              BottomNavigationBarItem(
                icon: Transform.scale(
                  scale: 1,
                  child: SvgPicture.asset(
                    'assets/images/food.svg',
                    height: 25,
                  ),
                ),
                label: 'Meals',
                activeIcon: Transform.scale(
                  scale: 1,
                  child: SvgPicture.asset(
                    'assets/images/food_colored.svg',
                    height: 25,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                  icon: Transform.translate(
                    offset: Offset(0, -30),
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: primaryLinearGradient,
                            borderRadius: BorderRadius.circular(35)),
                        width: 55,
                        height: 55,
                        child: Transform.scale(
                          scale: 0.7,
                          child: SvgPicture.asset(
                            'assets/images/workout_icon.svg',
                            height: 20,
                            // fit: BoxFit.contain,
                          ),
                        )),
                  ),
                  label: ''),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt_outlined, size: 25),
                  label: 'Camera',
                  activeIcon: Icon(Icons.camera_alt, size: 25)),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, size: 25),
                  label: 'Profile',
                  activeIcon: Icon(Icons.person, size: 25)),
            ],
          )),
      body: pages[pageIndex]['screenWidget'],
    );
  }
}
