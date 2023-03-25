import 'dart:async';

import 'package:fiteness_x/Widgets/Workout_Widgets/workout_info_screen.dart';
import 'package:fiteness_x/Widgets/Workout_Widgets/workout_timer.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../modals/appGetterSetter.dart';
import '../../services/notification_service.dart';

class StartWorkoutScreen extends StatefulWidget {
  @override
  State<StartWorkoutScreen> createState() => _StartWorkoutScreenState();
}

class _StartWorkoutScreenState extends State<StartWorkoutScreen> {
  List<SelectedWorkoutModal> workoutsForToday = [];
  int workoutIndex = 0;
  int totalSets = 0;
  getWorkoutsForToday() {
    for (var i = 0; i < getSelectedWorkout.length; i++) {
      for (var j = 0; j < getSelectedWorkout[i].length; j++) {
        if (getSelectedWorkout[i][j].workoutDate.year == DateTime.now().year &&
            getSelectedWorkout[i][j].workoutDate.month ==
                DateTime.now().month &&
            getSelectedWorkout[i][j].workoutDate.day == DateTime.now().day) {
          workoutIndex = i;

          workoutsForToday = List.from(getSelectedWorkout[i]);
          workoutsForToday.removeWhere((exercise) => exercise.isCompleted);
          for (var exercise in workoutsForToday) {
            totalSets = totalSets + exercise.sets;
          }
          return;
        } else {
          break;
        }
      }
    }
  }

  void markAsCompleted(String exerciseName) {
    for (var i = 0; i < getSelectedWorkout[workoutIndex].length; i++) {
      if (getSelectedWorkout[workoutIndex][i].exerciseName == exerciseName) {
        getSelectedWorkout[workoutIndex][i].isCompleted = true;
        NotificationService().cancelNotification(
            getSelectedWorkout[workoutIndex][i].notificationID);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getWorkoutsForToday();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  bool temp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF92A3FD),
        elevation: 0,
        title: Text(
          'Start Workout',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: workoutsForToday.length == 0
            ? Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      height: 200,
                      width: 200,
                      child: SvgPicture.asset(
                        'assets/images/workout_completed_tick.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.80,
                      alignment: Alignment.center,
                      child: Text(
                        'All workouts done for today!\n\nRelax or goto meals section to find Nutritious Meals',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        margin: EdgeInsets.only(left: 10, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Remaining Exercises - ${workoutsForToday.length}",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text("Remaining Sets - $totalSets",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      WorkoutTimer(),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height -
                        (AppBar().preferredSize.height +
                            MediaQuery.of(context).padding.top +
                            90),
                    child: ListView(
                      children: workoutsForToday.map((exercise) {
                        return Stack(
                          children: [
                            Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'WELL DONE!',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF92A3FD)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return WorkoutInfoScreen(
                                      videoId: exercise.videoID,
                                      exerciseSteps:
                                          exercise.exerciseDescription,
                                      exerciseName: exercise.exerciseName);
                                }));
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: AnimatedOpacity(
                                  duration: Duration(milliseconds: 300),
                                  opacity: exercise.isCompleted ? 0 : 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.white,
                                          child: Text(
                                            exercise.exerciseName,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          )),
                                      Container(
                                        child: Text(
                                          '${exercise.sets} x ${exercise.reps}',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                right: 10,
                                top: 10,
                                child: AnimatedOpacity(
                                  duration: Duration(milliseconds: 300),
                                  opacity: exercise.isCompleted ? 0 : 1,
                                  child: TextButton(
                                    onPressed: () {
                                      exercise.isCompleted = true;
                                      setState(() {
                                        markAsCompleted(exercise.exerciseName);
                                      });
                                      Future.delayed(Duration(seconds: 1), () {
                                        setState(() {
                                          workoutsForToday.removeWhere(
                                              (element) =>
                                                  element.exerciseName ==
                                                  exercise.exerciseName);
                                        });
                                      });
                                    },
                                    child: Text(
                                      'Mark as completed',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 73, 104, 255),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
