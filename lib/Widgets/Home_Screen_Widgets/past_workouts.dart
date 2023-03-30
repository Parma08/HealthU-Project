import 'package:fiteness_x/Widgets/Workout_Widgets/daily_workout_schedule_calendar.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../modals/appGetterSetter.dart';
import '../../modals/constants.dart';

class PastWorkoutsList extends StatefulWidget {
  PastWorkoutsList({super.key});

  @override
  State<PastWorkoutsList> createState() => _PastWorkoutsListState();
}

class _PastWorkoutsListState extends State<PastWorkoutsList> {
  List<List<SelectedWorkoutModal>> pastWorkouts = [];

  void findPastThreeSortedWorkouts() {
    pastWorkouts = [];
    for (var i = 0; i < getSelectedWorkout.length; i++) {
      for (var j = 0; j < getSelectedWorkout[i].length; j++) {
        if (getSelectedWorkout[i][j].workoutDate.isBefore(DateTime.now())) {
          pastWorkouts.insert(pastWorkouts.length, getSelectedWorkout[i]);
          break;
        }
        break;
      }
    }
    pastWorkouts.sort((a, b) => b[0].workoutDate.compareTo(a[0].workoutDate));
  }

  bool flagToOnlyShowNoWorkoutMessageOnce = false;
  Widget pastWorkoutsBuilder(BuildContext context, int index) {
    double completionPercentage = 0.0;
    int totalCompletedWorkouts = 0;
    if (pastWorkouts.isEmpty) {
      if (!flagToOnlyShowNoWorkoutMessageOnce) {
        flagToOnlyShowNoWorkoutMessageOnce = true;
        return Center(
          child: Text(
            'No Workouts to show',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0XFFC58BF2)),
          ),
        );
      } else
        return SizedBox();
    }
    if (index > 2 || index >= pastWorkouts.length) {
      return SizedBox();
    }
    for (var i = 0; i < pastWorkouts[index].length; i++) {
      if (pastWorkouts[index][i].isCompleted) {
        totalCompletedWorkouts++;
      }
    }
    completionPercentage = totalCompletedWorkouts / pastWorkouts[index].length;
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return DailyWorkoutScheduleCalendar(
                initialDate: pastWorkouts[index][0].workoutDate);
          })).then((value) => setState(() {}));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(158, 158, 158, 0.4), blurRadius: 5)
              ]),
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 120,
          child: LayoutBuilder(builder: (_, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: constraints.maxWidth * 0.2,
                  height: constraints.maxHeight * 0.9,
                  padding: EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    illustrationLinks[index],
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * 0.70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          DateFormat.yMMMEd()
                              .format(pastWorkouts[index][0].workoutDate),
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                            '${pastWorkouts[index].length} Exercises | ${pastWorkouts[index][0].totalworkoutDuration} Minutes',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF100C0C))),
                      ),
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                            color: Color(0xFFF7F8F8),
                            borderRadius: BorderRadius.circular(100)),
                        width: constraints.maxWidth * 0.70,
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: completionPercentage,
                          heightFactor: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFC58BF2),
                                      Color(0xFF92A3FD)
                                    ],
                                    begin: Alignment.bottomRight,
                                    end: Alignment.centerLeft),
                                borderRadius: completionPercentage > 0.95
                                    ? BorderRadius.circular(100)
                                    : BorderRadius.only(
                                        topLeft: Radius.circular(100),
                                        bottomLeft: Radius.circular(100))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: constraints.maxWidth * 0.1,
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Color(0xFFC58BF2),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  final List<String> illustrationLinks = [
    'assets/images/past_workout_icon_one.svg',
    'assets/images/past_workout_icon_two.svg',
    'assets/images/past_workout_icon_three.svg',
  ];

  @override
  Widget build(BuildContext context) {
    flagToOnlyShowNoWorkoutMessageOnce = false;
    findPastThreeSortedWorkouts();

    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Latest Workouts',
              style: TextStyle(
                  color: Color(0xFF1D1617),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            margin: EdgeInsets.only(top: 15, bottom: 5),
          ),
          pastWorkoutsBuilder(context, 0),
          pastWorkoutsBuilder(context, 1),
          pastWorkoutsBuilder(context, 2),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
