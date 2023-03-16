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

void deleteMeal(
    {required String mealId,
    required MealType mealType,
    required DateTime date,
    required TimeOfDay time}) {
  for (var i = 0; i < selectedMeals.length; i++) {
    if (selectedMeals[i].mealId == mealId &&
        selectedMeals[i].mealType == mealType) {
      if (selectedMeals[i].date.year == date.year &&
          selectedMeals[i].date.month == date.month &&
          selectedMeals[i].date.day == date.day) {
        selectedMeals.removeAt(i);
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
