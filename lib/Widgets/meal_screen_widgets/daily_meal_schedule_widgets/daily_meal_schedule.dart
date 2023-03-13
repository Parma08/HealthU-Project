import 'package:fiteness_x/Widgets/meal_screen_widgets/daily_meal_schedule_widgets/daily_meal_schedule_calendar.dart';
import 'package:fiteness_x/modals/meal_modal.dart';
import 'package:flutter/material.dart';

import '../../../modals/appGetterSetter.dart';

class DailyMealSchedule extends StatefulWidget {
  static const routeName = '/daily-meal-schedule';
  const DailyMealSchedule({super.key});

  @override
  State<DailyMealSchedule> createState() => _DailyMealScheduleState();
}

class _DailyMealScheduleState extends State<DailyMealSchedule> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF92A3FD),
          elevation: 0,
          title: Text(
            'Meal Schedule',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              DailyMealScheduleCalendar(),
            ],
          ),
        ));
  }
}
