import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WorkoutTimer extends StatefulWidget {
  const WorkoutTimer({super.key});

  @override
  State<WorkoutTimer> createState() => _WorkoutTimerState();
}

class _WorkoutTimerState extends State<WorkoutTimer> {
  int hours = 00;
  int minutes = 00;
  int seconds = 00;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
        if (seconds == 60) {
          seconds = 0;
          minutes++;
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
