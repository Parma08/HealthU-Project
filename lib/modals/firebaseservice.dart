import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:fiteness_x/modals/meal_modal.dart';
import 'package:flutter/material.dart';

Future addMealsToDatabase(MealModal meal) async {
  List jsonMealsArray = [];

  DateTime key = DateTime(meal.date.year, meal.date.month, meal.date.day,
      meal.time.hour, meal.time.minute);
  Timestamp timestamp = Timestamp.fromDate(key.toUtc());
  jsonMealsArray.add({
    'mealId': meal.mealId,
    'mealName': meal.mealName,
    'mealType': getMealTypeEnumToStringConvertor(meal.mealType),
    'imageLink': meal.imageLink,
    'dateTime': timestamp,
    'notfications': meal.notifications,
    'mealCategory': getMealCategoryEnumToStringConvertor(meal.mealCategory),
  });

  try {
    var addedResponse = await FirebaseFirestore.instance
        .collection('users')
        .doc(getUserDetails.userId)
        .collection('meals')
        .doc('${jsonMealsArray[0]['mealId'] + key.toString()}')
        .set({'meal': jsonMealsArray});
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}

Future deleteMealFromDatabase(MealModal meal) async {
  List jsonMealsArray = [];

  DateTime key = DateTime(meal.date.year, meal.date.month, meal.date.day,
      meal.time.hour, meal.time.minute);
  Timestamp timestamp = Timestamp.fromDate(key.toUtc());
  jsonMealsArray.add({
    'mealId': meal.mealId,
    'mealName': meal.mealName,
    'mealType': getMealTypeEnumToStringConvertor(meal.mealType),
    'imageLink': meal.imageLink,
    'dateTime': timestamp,
    'notfications': meal.notifications,
    'mealCategory': getMealCategoryEnumToStringConvertor(meal.mealCategory),
  });

  try {
    var addedResponse = await FirebaseFirestore.instance
        .collection('users')
        .doc(getUserDetails.userId)
        .collection('meals')
        .doc('${jsonMealsArray[0]['mealId'] + key.toString()}')
        .delete();
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}

Future addWaterGoalsToDatabase(int waterInLiters) async {
  try {
    var addedResponse = await FirebaseFirestore.instance
        .collection('users')
        .doc(getUserDetails.userId)
        .update({
      'waterGoals': waterInLiters,
    });
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}

Future changeWaterConsumedInDatabase(double waterInLiters) async {
  try {
    var addedResponse = await FirebaseFirestore.instance
        .collection('users')
        .doc(getUserDetails.userId)
        .update({
      'waterConsumedInADay': waterInLiters,
    });
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}

Future addWorkoutsToDatabase(
    List<SelectedWorkoutModal> selectedworkouts) async {
  List selectedworkoutsInJSON = [];
  DateTime key = DateTime.now();
  for (var i = 0; i < selectedworkouts.length; i++) {
    TimeOfDay workoutTime = selectedworkouts[i].workoutTime;
    DateTime workoutDate = selectedworkouts[i].workoutDate;
    key = DateTime(workoutDate.year, workoutDate.month, workoutDate.day,
        workoutTime.hour, workoutTime.minute);
    Timestamp timestamp = Timestamp.fromDate(DateTime(
        workoutDate.year,
        workoutDate.month,
        workoutDate.day,
        workoutTime.hour,
        workoutTime.minute));
    selectedworkoutsInJSON.add({
      'notificationID': selectedworkouts[i].notificationID,
      'exerciseName': selectedworkouts[i].exerciseName,
      'workoutDateTime': timestamp,
      'exerciseDescription': selectedworkouts[i].exerciseDescription,
      'reps': selectedworkouts[i].reps,
      'sets': selectedworkouts[i].sets,
      'videoID': selectedworkouts[i].videoID,
      'totalworkoutDuration': selectedworkouts[i].totalworkoutDuration,
    });
  }
  try {
    FirebaseFirestore.instance
        .collection('users')
        .doc(getUserDetails.userId)
        .collection('workouts')
        .doc('${key.toString()}')
        .set({'workout': selectedworkoutsInJSON});
    print('ADD WORKOUT ${key.toString()}');
    //     .set({
    //   'workouts': FieldValue,
    // });
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}

Future deleteWorkoutFromDatabase(
    List<SelectedWorkoutModal> selectedworkouts) async {
  print("DELETE WORKOUT");
  List selectedworkoutsInJSON = [];
  DateTime key = DateTime.now();
  for (var i = 0; i < selectedworkouts.length; i++) {
    TimeOfDay workoutTime = selectedworkouts[i].workoutTime;
    DateTime workoutDate = selectedworkouts[i].workoutDate;
    key = DateTime(workoutDate.year, workoutDate.month, workoutDate.day,
        workoutTime.hour, workoutTime.minute);
    Timestamp timestamp = Timestamp.fromDate(DateTime(
        workoutDate.year,
        workoutDate.month,
        workoutDate.day,
        workoutTime.hour,
        workoutTime.minute));
    selectedworkoutsInJSON.add({
      'notificationID': selectedworkouts[i].notificationID,
      'exerciseName': selectedworkouts[i].exerciseName,
      'workoutDateTime': timestamp,
      'exerciseDescription': selectedworkouts[i].exerciseDescription,
      'reps': selectedworkouts[i].reps,
      'sets': selectedworkouts[i].sets,
      'videoID': selectedworkouts[i].videoID,
      'totalworkoutDuration': selectedworkouts[i].totalworkoutDuration,
    });
  }
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(getUserDetails.userId)
        .collection('workouts')
        .doc('${key.toString()}')
        .delete();
    //     .update({
    //   '$key': selectedworkoutsInJSON,
    // });
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}
