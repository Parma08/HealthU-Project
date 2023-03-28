import 'package:fiteness_x/Widgets/Home_Screen_Widgets/edit_water_goal.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../themes.dart';

class WaterIntakeWidget extends StatefulWidget {
  const WaterIntakeWidget({super.key});

  @override
  State<WaterIntakeWidget> createState() => _WaterIntakeWidgetState();
}

class _WaterIntakeWidgetState extends State<WaterIntakeWidget> {
  int waterGoal = 4;
  double currentWaterIntake = 3.0;
  @override
  Widget build(BuildContext context) {
    waterGoal = getWaterGoal;
    return Align(
      alignment: Alignment(-0.9, -1),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: 400,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(158, 158, 158, 0.2), blurRadius: 5)
            ]),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: 350,
              width: 40,
              decoration: BoxDecoration(
                color: Color(0xFFF7F8F8),
                borderRadius: BorderRadius.circular(100),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.bottomCenter,
                widthFactor: 1,
                heightFactor: (currentWaterIntake / waterGoal) <= 1
                    ? (currentWaterIntake / waterGoal)
                    : 1,
                child: Container(
                    decoration: BoxDecoration(
                  gradient: primaryLinearGradient,
                  borderRadius: (currentWaterIntake / waterGoal) < 0.95
                      ? BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100))
                      : BorderRadius.circular(100),
                )),
              ),
            ),
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'Water Intake',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 40),
                      child: Text(
                        '${currentWaterIntake} Liters',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF92A3FD)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text('Goal - ${waterGoal} Liters',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentWaterIntake = currentWaterIntake + 0.25;
                        });
                      },
                      icon: Icon(Icons.add_circle_outlined),
                      color: Color(0xFF92A3FD),
                      iconSize: 30,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentWaterIntake == 0
                              ? currentWaterIntake = 0
                              : currentWaterIntake = currentWaterIntake - 0.25;
                        });
                      },
                      icon: Icon(Icons.remove_circle_outlined),
                      color: Color(0xFF92A3FD),
                      iconSize: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  int temp = 2;
                                  return EditWaterGoal();
                                }).then((value) {
                              setState(() {});
                            });
                          },
                          child: Text(
                            'Edit goal',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF92A3FD)),
                          )),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
