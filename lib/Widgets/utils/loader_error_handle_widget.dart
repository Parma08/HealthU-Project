import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:fiteness_x/modals/firebaseservice.dart';
import 'package:fiteness_x/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../modals/appGetterSetter.dart';
import '../../modals/meal_modal.dart';
import '../../themes.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

void showDialogLoader(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(), // loading spinner
            SizedBox(width: 20), // add some space
            Text("Loading..."), // text label
          ],
        ),
      );
    },
  );
}

Future showErrorDialogWithoutRetry(BuildContext context, String errorMessage) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: primaryLinearGradient,
                borderRadius: BorderRadius.circular(20)),
            height: 260,
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: SvgPicture.asset(
                    'assets/images/cross.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  child: Text(
                    errorMessage,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

Future showSuccessDialog(
    {required BuildContext context, required String successMessage}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: primaryLinearGradient,
                borderRadius: BorderRadius.circular(20)),
            height: 240,
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: SvgPicture.asset(
                    'assets/images/tick.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  child: Text(
                    successMessage,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

Future showErrorDialog(
    {required BuildContext context,
    required String errorMessage,
    required VoidCallback callbackFuction}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            callbackFuction();
            return true;
          },
          child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: primaryLinearGradient,
                  borderRadius: BorderRadius.circular(20)),
              height: 260,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: SvgPicture.asset(
                      'assets/images/cross.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    child: Text(
                      errorMessage,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        callbackFuction();
                      },
                      child: Text(
                        'Retry',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

List<DateTime> generateYearCalendar() {
  DateTime initialDate = DateTime(2023, 1, 1);
  DateTime endDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .add(Duration(
              days: DateTime(DateTime.now().year, DateTime.now().month + 1, 0)
                  .day));
  int daysBetweenDays = endDate.difference(initialDate).inDays;
  List<DateTime> dates = [];
  for (var i = 0; i < daysBetweenDays; i++) {
    dates.insert(dates.length, initialDate.add(Duration(days: i)));
  }
  return dates;
}

Future deleteMeal(
    {required BuildContext context,
    required String mealId,
    required MealType mealType,
    required DateTime date,
    required TimeOfDay time}) async {
  for (var i = 0; i < selectedMeals.length; i++) {
    if (selectedMeals[i].mealId == mealId &&
        selectedMeals[i].mealType == mealType) {
      if (selectedMeals[i].date.year == date.year &&
          selectedMeals[i].date.month == date.month &&
          selectedMeals[i].date.day == date.day) {
        showDialogLoader(context);
        final status = await deleteMealFromDatabase(selectedMeals[i]);
        Navigator.of(context).pop();
        if (status == SUCCESS_MESSAGE) {
          selectedMeals.removeAt(i);
        } else {
          showErrorDialogWithoutRetry(context, status);
        }
        NotificationService().cancelNotification(
            date.day + date.month + date.year + time.hour + time.minute);
      }
    }
  }
}

Future mealDeletionConfirmation(
    {required BuildContext context,
    required String confirmationMessage,
    required String mealId,
    required MealType mealType,
    required DateTime date,
    required TimeOfDay time}) {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: primaryLinearGradient,
                borderRadius: BorderRadius.circular(20)),
            height: 260,
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                    size: 60,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  child: Text(
                    confirmationMessage,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {
                            deleteMeal(
                                context: context,
                                mealId: mealId,
                                mealType: mealType,
                                date: date,
                                time: time);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}

Future deleteWorkout(
    BuildContext context, String workoutName, int workoutIndex) async {
  if (getSelectedWorkout[workoutIndex].length == 1) {
    var status =
        await deleteWorkoutFromDatabase(getSelectedWorkout[workoutIndex]);
    if (status == SUCCESS_MESSAGE) {
      NotificationService().cancelNotification(
          getSelectedWorkout[workoutIndex][0].notificationID);
      getSelectedWorkout.remove(workoutIndex);
    }

    return status;
  }

  for (var i = 0; i < getSelectedWorkout[workoutIndex].length; i++) {
    if (getSelectedWorkout[workoutIndex][i].exerciseName == workoutName) {
      final backUpData = getSelectedWorkout[workoutIndex].removeAt(i);

      final status =
          await addWorkoutsToDatabase(getSelectedWorkout[workoutIndex]);
      if (status != SUCCESS_MESSAGE) {
        getSelectedWorkout[workoutIndex].insert(i, backUpData);
      }
      return status;
    }
  }
}

Future workoutDeletionConfirmation(
    {required String workoutName,
    required int workoutIndex,
    required BuildContext context,
    required String confirmationMessage}) {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: primaryLinearGradient,
                borderRadius: BorderRadius.circular(20)),
            height: 260,
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                    size: 60,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  child: Text(
                    confirmationMessage,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            showDialogLoader(context);
                            var status = await deleteWorkout(
                                context, workoutName, workoutIndex);
                            Navigator.of(context).pop();
                            if (status != SUCCESS_MESSAGE) {
                              showErrorDialogWithoutRetry(context, status);
                            }
                          },
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}

Future<bool> isInternetCOnnectionDown() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return false;
  }
  return true;
}
