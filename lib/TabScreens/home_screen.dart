import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiteness_x/Widgets/Home_Screen_Widgets/home_page_indicator.dart';
import 'package:fiteness_x/Widgets/Home_Screen_Widgets/past_workouts.dart';
import 'package:fiteness_x/Widgets/Home_Screen_Widgets/water_intake.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Widgets/Home_Screen_Widgets/articles_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget bmrAndIbwBuilder(
      BuildContext context, String title, int value, String illustrationLink) {
    return Container(
      height: 190,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(158, 158, 158, 0.2), blurRadius: 5)
          ]),
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            '${value}',
            style: TextStyle(
                color: Color.fromARGB(255, 143, 162, 255),
                fontWeight: FontWeight.w600),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.40,
              height: 80,
              child: SvgPicture.asset(
                illustrationLink,
                fit: BoxFit.cover,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("IDD ${getUserDetails.userId}");
    return Container(
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: Container(
                        child: Text(
                          'Welcome Back,',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFFADA4A5)),
                        ),
                      ),
                    ),
                    Text(
                      'Parmanand Singh',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF1D1617),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return ArticlesListScreen();
                      }));
                    },
                    child: Container(
                      child: SvgPicture.asset(
                        'assets/images/articles_icon.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          HomePageIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WaterIntakeWidget(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    bmrAndIbwBuilder(context, 'Basal Metabolic Rate (BMR)', 22,
                        'assets/images/bmr_graph.svg'),
                    bmrAndIbwBuilder(context, 'Ideal Body Weight (IBW)', 64,
                        'assets/images/ideal_weight_pattern.svg'),
                  ],
                ),
              )
            ],
          ),
          PastWorkoutsList(),
        ],
      ),
    );
  }
}
