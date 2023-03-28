import 'dart:async';

import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WorkoutTimer extends StatefulWidget {
  int workoutIndex;
  WorkoutTimer({required this.workoutIndex});

  @override
  State<WorkoutTimer> createState() => _WorkoutTimerState();
}

class _WorkoutTimerState extends State<WorkoutTimer> {
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  Timer? timer;

  void startTimer() {
    minutes = getSelectedWorkout[widget.workoutIndex][0].totalworkoutDuration;
    while (minutes > 60) {
      minutes = minutes - 60;
      hours++;
    }
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
        if (seconds == 60) {
          seconds = 0;
          minutes++;
          setWorkoutTiming(widget.workoutIndex, hours * 60 + minutes);
        }
        if (minutes == 60) {
          minutes = 0;
          hours++;
        }
        if (hours == 3) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10),
      height: 50,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromRGBO(67, 131, 249, 0.49), width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          hours > 9
              ? Text(
                  '$hours : ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                )
              : Text('0$hours : ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          minutes > 9
              ? Text('$minutes : ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
              : Text('0$minutes : ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          seconds > 9
              ? Text('$seconds',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
              : Text('0$seconds',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
