import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:fiteness_x/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../themes.dart';

class AddWorkout extends StatefulWidget {
  List<String> selectedWorkout;
  List<String> videoIDs;
  List<int> sets;
  List<int> reps;
  DateTime addingDate;
  TimeOfDay addingTime;
  List<String> exerciseDescription;
  AddWorkout(
      {required this.selectedWorkout,
      required this.addingDate,
      required this.addingTime,
      required this.sets,
      required this.reps,
      required this.videoIDs,
      required this.exerciseDescription}) {}

  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  NotificationService notificationService = NotificationService();

  Future openDatePicker(BuildContext context) async {
    date = (await showDatePicker(
        helpText: 'On which day will you do this workout',
        context: context,
        initialDate: widget.addingDate,
        firstDate: DateTime.now().subtract(const Duration(days: 3)),
        lastDate: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .add(Duration(
                days: DateTime(DateTime.now().year, DateTime.now().month + 1, 0)
                    .day))))!;
    setState(() {});
  }

  Future openTimePicker(BuildContext context) async {
    time = (await showTimePicker(
        context: context,
        initialTime: widget.addingTime,
        helpText: 'At what time will you do this workout?'))!;
    setState(() {});
  }

  void addWorkout(BuildContext context) {
    int notificationId =
        date.day + date.month + date.year + time.hour + time.minute;
    for (var i = 0; i < getSelectedWorkout.length; i++) {
      int flag = 0;
      for (var j = 0; j < getSelectedWorkout[i].length; j++) {
        if (getSelectedWorkout[i][j].workoutDate.year == date.year &&
            getSelectedWorkout[i][j].workoutDate.month == date.month &&
            getSelectedWorkout[i][j].workoutDate.day == date.day) {
          flag = 1;
          for (var k = 0; k < widget.selectedWorkout.length; k++) {
            if (widget.selectedWorkout[k] ==
                getSelectedWorkout[i][j].exerciseName) {
              widget.selectedWorkout.removeAt(k);
            }
          }
        }
      }
      if (flag == 1) {
        break;
      }
    }
    if (widget.selectedWorkout.isEmpty) {
      showSuccessDialog(
          context: context, successMessage: 'Workout already Added');
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      });
      return;
    }
    setSelectedWorkout(
        selectedExercises: widget.selectedWorkout,
        exerciseDescription: widget.exerciseDescription,
        date: date,
        time: time,
        notificationId: notificationId,
        videoID: widget.videoIDs,
        sets: widget.sets,
        reps: widget.reps);
    showSuccessDialog(
        context: context, successMessage: 'Workout added Successfully');
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    });
    notificationService.initializeNotifications();
    notificationService.sendNotification(
        id: notificationId,
        title: "Workout Time",
        body: "Time to start the workout and feel better!",
        date:
            DateTime(date.year, date.month, date.day, time.hour, time.minute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Container(
            height: 60,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(202, 211, 255, 0.5), blurRadius: 4),
                ],
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Date',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        DateFormat.MMMEd().format(DateTime(
                            date.year,
                            date.month,
                            date.day,
                            date.hour,
                            date.minute,
                            date.second)),
                        style: TextStyle(fontSize: 10)),
                    IconButton(
                        onPressed: () {
                          openDatePicker(context);
                        },
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          color: Color(0xFF92A3FD),
                        )),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(202, 211, 255, 0.5), blurRadius: 4),
                ],
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat.jm().format(DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          time.hour,
                          time.minute)),
                      style: TextStyle(fontSize: 10),
                    ),
                    IconButton(
                        onPressed: () {
                          openTimePicker(context);
                        },
                        icon:
                            Icon(Icons.access_time, color: Color(0xFF92A3FD))),
                  ],
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              addWorkout(context);
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 40, left: 15, right: 15),
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: primaryLinearGradient,
                  borderRadius: BorderRadius.circular(100)),
              child: const Text(
                'Add Workout',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
