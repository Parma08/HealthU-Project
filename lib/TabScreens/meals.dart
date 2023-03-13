import 'package:fiteness_x/Widgets/meal_screen_widgets/find-something-to-eat.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Widgets/meal_screen_widgets/daily_meal_schedule_widgets/daily_meal_schedule.dart';
import '../Widgets/meal_screen_widgets/today_meals.dart';

class MealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // precacheImage(AssetImage('assets/images/meal_banner.jpg'), context);
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 15),
            height: MediaQuery.of(context).size.height * 0.25,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/newwe.gif',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(146, 163, 253, 0.4),
                  Color.fromRGBO(157, 206, 255, 0.4)
                ], end: Alignment.topRight, begin: Alignment.bottomLeft)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daily Meal Schedule',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(DailyMealSchedule.routeName);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 14),
                    decoration: BoxDecoration(
                        gradient: primaryLinearGradient,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Check',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                )
              ],
            ),
          ),
          TodayMeals(),
          FindSomethingToEat(),
        ],
      ),
    );
  }
}
