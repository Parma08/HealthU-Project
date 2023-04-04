import 'package:fiteness_x/Widgets/Workout_Widgets/edit_workout_bottom_sheet.dart';
import 'package:fiteness_x/Widgets/Workout_Widgets/workout_info_screen.dart';
import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShowDailyWorkoutsList extends StatefulWidget {
  DateTime selectedDate;
  ShowDailyWorkoutsList({required this.selectedDate});

  @override
  State<ShowDailyWorkoutsList> createState() => _ShowDailyWorkoutsListState();
}

class _ShowDailyWorkoutsListState extends State<ShowDailyWorkoutsList> {
  List<SelectedWorkoutModal> workoutList = [];

  int workoutIndex = 0;
  findWorkoutsForSelectedDates() {
    workoutList = [];
    for (var i = 0; i < getSelectedWorkout.length; i++) {
      for (var j = 0; j < getSelectedWorkout[i].length; j++) {
        if (getSelectedWorkout[i][j].workoutDate.year ==
                widget.selectedDate.year &&
            getSelectedWorkout[i][j].workoutDate.month ==
                widget.selectedDate.month &&
            getSelectedWorkout[i][j].workoutDate.day ==
                widget.selectedDate.day) {
          print('WorkourtList ${widget.selectedDate.day}');
          workoutIndex = i;
          workoutList = getSelectedWorkout[i];
          return;
        } else {
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    findWorkoutsForSelectedDates();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Text(
            '${workoutList.length} Exercises',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        workoutList.length == 0
            ? Center(
                child: Text(
                  'No Workouts added for this day',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.height * 0.88 -
                    (AppBar().preferredSize.height +
                        MediaQuery.of(context).padding.top +
                        200),
                width: MediaQuery.of(context).size.width,
                child: ReorderableListView(
                  onReorder: (oldIndex, newIndex) {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    var listItem = workoutList.removeAt(oldIndex);
                    workoutList.insert(newIndex, listItem);
                    getSelectedWorkout[workoutIndex] = workoutList;
                    setState(() {});
                  },
                  children: workoutList.map((exercise) {
                    return GestureDetector(
                        key: ValueKey(exercise.exerciseName),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return WorkoutInfoScreen(
                                videoId: exercise.videoID,
                                exerciseSteps: exercise.exerciseDescription,
                                exerciseName: exercise.exerciseName);
                          }));
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(158, 158, 158, 0.2),
                                    blurRadius: 10)
                              ]),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          margin: EdgeInsets.only(bottom: 20),
                          child: LayoutBuilder(builder: (_, constraints) {
                            return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: constraints.maxWidth * 0.7,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          exercise.exerciseName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        exercise.isCompleted
                                            ? Text(
                                                '${exercise.sets} x ${exercise.reps} | Completed',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              )
                                            : Text(
                                                '${exercise.sets} x ${exercise.reps} | Not Completed',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (_) {
                                                  return EditWorkoutBottomSheet(
                                                      workoutIndex:
                                                          workoutIndex,
                                                      exerciseName: exercise
                                                          .exerciseName);
                                                }).then((value) {
                                              setState(() {});
                                            });
                                          },
                                          icon: Icon(Icons.edit),
                                          color: Color(0xFF92A3FD),
                                        ),
                                        IconButton(
                                            onPressed: () async {
                                              await workoutDeletionConfirmation(
                                                      workoutName:
                                                          exercise.exerciseName,
                                                      workoutIndex:
                                                          workoutIndex,
                                                      context: context,
                                                      confirmationMessage:
                                                          'Do you really want to delete this exercise?')
                                                  .then((value) {
                                                setState(() {});
                                              });
                                            },
                                            icon: Icon(Icons.delete_forever),
                                            color: Colors.red),
                                      ],
                                    ),
                                  )
                                ]);
                          }),
                        ));
                  }).toList(),
                ),
              ),
      ],
    );
  }
}
