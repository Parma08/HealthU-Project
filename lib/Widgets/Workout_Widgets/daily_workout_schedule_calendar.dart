import 'package:fiteness_x/Widgets/Workout_Widgets/show_daily_workouts.dart';
import 'package:fiteness_x/Widgets/Workout_Widgets/start_workout.dart';
import 'package:fiteness_x/Widgets/meal_screen_widgets/daily_meal_schedule_widgets/show_daily_meal_by_category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../themes.dart';
import '../utils/loader_error_handle_widget.dart';

class DailyWorkoutScheduleCalendar extends StatefulWidget {
  @override
  State<DailyWorkoutScheduleCalendar> createState() =>
      _DailyWorkoutScheduleCalendarState();
}

class _DailyWorkoutScheduleCalendarState
    extends State<DailyWorkoutScheduleCalendar> {
  List<DateTime> calendarDates = [];
  late final ScrollController scrollController;
  late int activeIndex;
  @override
  void initState() {
    super.initState();

    calendarDates = generateYearCalendar();
    scrollController = ScrollController();
    for (var i = 0; i < calendarDates.length; i++) {
      if (calendarDates[i].day == DateTime.now().day &&
          calendarDates[i].month == DateTime.now().month &&
          calendarDates[i].year == DateTime.now().year) {
        activeIndex = i;
      }
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        scrollController.jumpTo(
            (MediaQuery.of(context).size.width / 7 + 20) * (activeIndex));
      });
    }
  }

  changeMonth(String direction) {
    DateTime newDate = DateTime.now();
    if ((calendarDates[activeIndex].year == 2021 &&
        calendarDates[activeIndex].month == 1)) {
      return;
    }
    if (direction.toLowerCase() == 'backward') {
      newDate = DateTime(
              calendarDates[activeIndex].year,
              calendarDates[activeIndex].month,
              calendarDates[activeIndex].day,
              calendarDates[activeIndex].hour)
          .subtract(Duration(
              days: DateTime(calendarDates[activeIndex].year,
                      calendarDates[activeIndex].month, 0)
                  .day));
    } else if (direction.toLowerCase() == 'forward') {
      newDate = DateTime(
              calendarDates[activeIndex].year,
              calendarDates[activeIndex].month,
              calendarDates[activeIndex].day,
              calendarDates[activeIndex].hour)
          .add(Duration(
              days: DateTime(calendarDates[activeIndex].year,
                      calendarDates[activeIndex].month + 1, 0)
                  .day));
    } else {
      return;
    }
    for (var i = 0; i < calendarDates.length; i++) {
      if (calendarDates[i].month == newDate.month &&
          calendarDates[i].year == newDate.year) {
        setState(() {
          activeIndex = i;
          scrollController.jumpTo(
              (MediaQuery.of(context).size.width / 7 + 20) * (activeIndex));
        });
        break;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return StartWorkoutScreen();
          })).then((value) {
            setState(() {});
          });
        },
        child: !(calendarDates[activeIndex].day == DateTime.now().day &&
                calendarDates[activeIndex].month == DateTime.now().month &&
                calendarDates[activeIndex].year == DateTime.now().year)
            ? SizedBox(
                height: 0,
              )
            : Container(
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(
                      bottom: 40, left: 15, right: 15, top: 30),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: primaryLinearGradient,
                      borderRadius: BorderRadius.circular(100)),
                  child: const Text(
                    'Start Workout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF92A3FD),
        elevation: 0,
        title: Text(
          'Workout Schedule',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 55,
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined),
                  onPressed: () {
                    changeMonth('backward');
                  },
                ),
                Text(
                  '${DateFormat.yMMM().format(calendarDates[activeIndex])}',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios_outlined),
                  onPressed: () {
                    changeMonth('forward');
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.12,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return index == activeIndex
                        ? Container(
                            decoration: BoxDecoration(
                                gradient: primaryLinearGradient,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: constraints.maxHeight,
                            width: constraints.maxWidth / 7,
                            padding: EdgeInsets.symmetric(
                                horizontal: constraints.maxWidth / 7 * 0.1,
                                vertical: constraints.maxHeight * 0.1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${DateFormat('MMM').format(calendarDates[index])}',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  '${DateFormat.d().format(calendarDates[index])}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${DateFormat('EEE').format(calendarDates[index])}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                print(activeIndex);
                                activeIndex = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFF7F8F8),
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: constraints.maxWidth / 7 * 0.1,
                                  vertical: constraints.maxHeight * 0.1),
                              height: constraints.maxHeight,
                              width: constraints.maxWidth / 7,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${DateFormat('MMM').format(calendarDates[index])}',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF7B6F72)),
                                  ),
                                  Text(
                                    '${DateFormat.d().format(calendarDates[index])}',
                                    style: TextStyle(
                                        color: Color(0xFF7B6F72),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '${DateFormat('EEE').format(calendarDates[index])}',
                                    style: TextStyle(
                                        color: Color(0xFF7B6F72), fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          );
                  },
                  itemCount: calendarDates.length,
                );
              },
            ),
          ),
          ShowDailyWorkoutsList(selectedDate: calendarDates[activeIndex])
        ],
      ),
    );
  }
}
