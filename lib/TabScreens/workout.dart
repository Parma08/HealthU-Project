import 'dart:convert';

import 'package:fiteness_x/Widgets/Workout_Widgets/daily_workout_schedule_calendar.dart';
import 'package:fiteness_x/Widgets/Workout_Widgets/workout_category_by_body_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import '../Widgets/Workout_Widgets/workout_category_by_type.dart';
import '../themes.dart';

class WorkoutScreen extends StatefulWidget {
  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 15),
            height: MediaQuery.of(context).size.height * 0.25,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(
              'assets/images/workout.svg',
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
                  'Daily Workout Schedule',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return DailyWorkoutScheduleCalendar(
                        initialDate: DateTime.now(),
                      );
                    }));
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
          WorkoutCategoryByType(),
          WorkoutCategoryByBodyNameWidget()
        ],
      ),
    );
  }
}
