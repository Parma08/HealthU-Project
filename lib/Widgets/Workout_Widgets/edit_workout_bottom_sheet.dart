import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../themes.dart';

class EditWorkoutBottomSheet extends StatefulWidget {
  final int workoutIndex;
  final String exerciseName;
  EditWorkoutBottomSheet(
      {required this.workoutIndex, required this.exerciseName}) {}

  @override
  State<EditWorkoutBottomSheet> createState() => _EditWorkoutBottomSheetState();
}

class _EditWorkoutBottomSheetState extends State<EditWorkoutBottomSheet> {
  int exerciseIndex = 0;
  bool isCompleted = false;
  bool showCompletedCheckbox = true;

  void editWorkout(int selectedSets, int selectedReps, BuildContext context) {
    if (selectedSets > 0 && selectedReps > 0) {
      getSelectedWorkout[widget.workoutIndex][exerciseIndex].sets =
          selectedSets;
      getSelectedWorkout[widget.workoutIndex][exerciseIndex].reps =
          selectedReps;
      getSelectedWorkout[widget.workoutIndex][exerciseIndex].isCompleted =
          isCompleted;
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      });

      showSuccessDialog(
          context: context, successMessage: 'Workouts edited Succesfully');
    } else {}
  }

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < getSelectedWorkout[widget.workoutIndex].length; i++) {
      if (getSelectedWorkout[widget.workoutIndex][i].exerciseName ==
          widget.exerciseName) {
        exerciseIndex = i;
        this.setsController.text =
            getSelectedWorkout[widget.workoutIndex][i].sets.toString();
        this.repsController.text =
            getSelectedWorkout[widget.workoutIndex][i].reps.toString();
        this.isCompleted =
            getSelectedWorkout[widget.workoutIndex][i].isCompleted;
        DateTime workoutDate =
            getSelectedWorkout[widget.workoutIndex][i].workoutDate;
        DateTime tempWorkoutDate = DateTime(
          workoutDate.year,
          workoutDate.month,
          workoutDate.day,
        );
        DateTime todaysDate = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
        );
        if (tempWorkoutDate.isAfter(todaysDate)) {
          print("TRUEfds");
          showCompletedCheckbox = false;
        }
      }
    }
  }

  TextEditingController setsController = TextEditingController();

  TextEditingController repsController = TextEditingController();

  Widget textFieldsBuilder(
      String hintText, String labelText, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: controller,
        onSubmitted: (_) {},
        maxLength: 2,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 10),
          counterText: '',
          label: Text(
            labelText,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Text(
              "Change Sets and Reps",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          textFieldsBuilder('Please enter total number of Sets', 'Total Sets',
              setsController),
          textFieldsBuilder('Please enter total number of Reps', 'Total Rets',
              repsController),
          showCompletedCheckbox
              ? Container(
                  margin: EdgeInsets.only(left: 10, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          checkColor: Colors.white,
                          activeColor: Color(0xFF92A3FD),
                          value: isCompleted,
                          onChanged: (val) {
                            setState(() {
                              isCompleted = val!;
                            });
                          }),
                      Text(
                        'Exercise Completed',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          InkWell(
            onTap: () {
              if (setsController.text.isNotEmpty &&
                  repsController.text.isNotEmpty) {
                editWorkout(int.parse(setsController.text),
                    int.parse(repsController.text), context);
              }
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(
                  bottom: 40, left: 15, right: 15, top: 30),
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: primaryLinearGradient,
                  borderRadius: BorderRadius.circular(100)),
              child: const Text(
                'Edit Sets and Reps',
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
    );
  }
}
