import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:vibration/vibration.dart';

class EditWaterGoal extends StatefulWidget {
  const EditWaterGoal({super.key});

  @override
  State<EditWaterGoal> createState() => _EditWaterGoalState();
}

class _EditWaterGoalState extends State<EditWaterGoal> {
  int waterGoal = getWaterGoal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Choose Daily Goals\n(In Liters)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(158, 158, 158, 0.3), blurRadius: 5)
                ]),
            child: NumberPicker(
                minValue: 2,
                maxValue: 16,
                value: waterGoal,
                onChanged: (value) {
                  try {
                    Vibration.vibrate(duration: 20);
                  } catch (e) {
                    print('Virbrator cannot be used - $e');
                  }

                  setState(() {
                    waterGoal = value;
                  });
                }),
          ),
          Align(
            alignment: Alignment(0.6, 0),
            child: TextButton(
                onPressed: () async {
                  showDialogLoader(context);
                  final status = await setWaterGoals(waterGoal);
                  Navigator.of(context).pop();
                  if (status != SUCCESS_MESSAGE) {
                    showErrorDialogWithoutRetry(context, status.toString());
                    return;
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  'Done',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF92A3FD)),
                )),
          )
        ],
      ),
    );
  }
}
