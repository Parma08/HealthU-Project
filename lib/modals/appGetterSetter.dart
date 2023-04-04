import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:fiteness_x/modals/firebaseservice.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

import 'meal_modal.dart';

List<MealModal> selectedMeals = [];
List<List<SelectedWorkoutModal>> selectedWorkouts = [];
List<ImageModal> clickedImages = [];
int waterGoal = 3;
double waterConsumedInADay = 1.5;
late UserModal userDetails;

void setUserDetails(UserModal details) {
  userDetails = details;
}

UserModal get getUserDetails {
  return userDetails;
}

String getGenderEnumToStringConvertor(Gender gender) {
  switch (gender) {
    case Gender.female:
      return 'female';
    case Gender.male:
      return 'male';
    case Gender.others:
      return 'other';
    default:
      return 'unknown';
  }
}

Gender getGenderStringToEnumConvertor(String gender) {
  switch (gender) {
    case 'male':
      return Gender.male;
    case 'female':
      return Gender.female;
    case 'other':
      return Gender.others;
    default:
      return Gender.male;
  }
}

getMealCategoryEnumToStringConvertor(MealCategory mealCategory) {
  switch (mealCategory) {
    case MealCategory.Beef:
      return 'Beef';

    case MealCategory.Breakfast:
      return 'Breakfast';

    case MealCategory.Chicken:
      return 'Chicken';
    case MealCategory.Dessert:
      return 'Dessert';
    case MealCategory.Goat:
      return 'Goat';
    case MealCategory.Lamb:
      return 'Lamb';
    case MealCategory.Miscellaneous:
      return 'Miscellaneous';
    case MealCategory.Pasta:
      return 'Pasta';
    case MealCategory.Pork:
      return 'Pork';
    case MealCategory.Seafood:
      return 'Seafood';
    case MealCategory.Side:
      return 'Side';
    case MealCategory.Starter:
      return 'Starter';
    case MealCategory.Vegan:
      return 'Vegan';
    case MealCategory.Vegetarian:
      return 'Vegetarian';
    default:
      return 'ERROR in loading meal category';
  }
}

MealCategory getMealCategoryStringToEnumConvertor(String mealCategory) {
  switch (mealCategory) {
    case 'Beef':
      return MealCategory.Beef;

    case 'Breakfast':
      return MealCategory.Breakfast;

    case 'Chicken':
      return MealCategory.Chicken;
    case 'Dessert':
      return MealCategory.Dessert;
    case 'Goat':
      return MealCategory.Goat;
    case 'Lamb':
      return MealCategory.Lamb;
    case 'Miscellaneous':
      return MealCategory.Miscellaneous;
    case 'Pasta':
      return MealCategory.Pasta;
    case 'Pork':
      return MealCategory.Pork;
    case 'Seafood':
      return MealCategory.Seafood;
    case 'Side':
      return MealCategory.Side;
    case 'Starter':
      return MealCategory.Starter;
    case 'Vegan':
      return MealCategory.Vegan;
    case 'Vegetarian':
      return MealCategory.Vegetarian;
    default:
      return MealCategory.Vegetarian;
  }
}

String getMealTypeEnumToStringConvertor(MealType mealtype) {
  switch (mealtype) {
    case MealType.Breakfast:
      return 'breakfast';

    case MealType.Dinner:
      return 'dinner';

    case MealType.Lunch:
      return 'lunch';
    case MealType.Snack:
      return 'snacks';

    default:
      return 'ERROR in loading meal type';
  }
}

MealType getMealTypeStringToEnumConvertor(String mealtype) {
  switch (mealtype.toLowerCase()) {
    case 'breakfast':
      return MealType.Breakfast;

    case 'dinner':
      return MealType.Dinner;

    case 'lunch':
      return MealType.Lunch;
    case 'snacks':
      return MealType.Snack;

    default:
      return MealType.Lunch;
  }
}

Map<String, dynamic> get getUserDetailsInJSON {
  return {
    'firstName': userDetails.firstName,
    'lastName': userDetails.lastName,
    'dateOfBirth': Timestamp.fromDate(userDetails.dateOfBirth),
    'gender': getGenderEnumToStringConvertor(userDetails.gender),
    'weight': userDetails.weightInKgs,
    'height': userDetails.heightInCM,
    'waterGoals': getWaterGoal,
    'waterConsumedInADay': {
      'dateTime': Timestamp.fromDate(userDetails.waterConsumedInADay.date),
      'waterConsumed': userDetails.waterConsumedInADay.waterConsumedInLiters,
    }
  };
}

Future setWaterGoals(int goal) async {
  final status = await addWaterGoalsToDatabase(goal);

  if (status == SUCCESS_MESSAGE) {
    waterGoal = goal;
  }
  return status;
}

int get getWaterGoal {
  return waterGoal;
}

Future setWaterConsumed(double waterConsumed) async {
  final status = await changeWaterConsumedInDatabase(waterConsumed);

  if (status == SUCCESS_MESSAGE) {
    waterConsumedInADay = waterConsumed;
  }
  return status;
}

double get getWaterConsumed {
  return waterConsumedInADay;
}

double getCalculatedBMI(int weightInKG, int heightInCM) {
  num denominator = pow((heightInCM / 100), 2);
  return double.parse((weightInKG / denominator).toStringAsFixed(1));
}

double getCalculatedBMR(
    int weightInKG, int heightInCM, DateTime dateOfBirth, Gender gender) {
  int age = getuserAge(dateOfBirth);
  String gen = getGenderEnumToStringConvertor(gender);
  double bmrForMan = (10 * weightInKG) + (6.25 * heightInCM) - (5 * age) + 5;
  double bmrForWomen =
      (10 * weightInKG) + (6.25 * heightInCM) - (5 * age) - 161;
  double bmrForOthers = (bmrForMan + bmrForWomen) / 2;
  if (gen == 'male') {
    return double.parse(bmrForMan.toStringAsFixed(1));
  }
  if (gen == 'female') {
    return double.parse(bmrForWomen.toStringAsFixed(1));
  }
  return double.parse(bmrForOthers.toStringAsFixed(1));
}

double getCalculatedIdealBodyWeight(int heightInCM, Gender gender) {
  String gen = getGenderEnumToStringConvertor(gender);
  double heightInInches = heightInCM * 0.3937;
  double additionalHeight = heightInInches - 60;
  print('IIDW DATA ${heightInCM} ${gen}');
  if (heightInCM <= 152.4 && gen == 'male') {
    return 50;
  } else if (heightInCM <= 152.4 && gen == 'female') {
    return 45.5;
  } else if (heightInCM <= 152.4 && gen == 'others') {
    return 47.8;
  }
  double ibwForMan = 50 + (2.3 * additionalHeight);
  double ibwForWomen = 45.5 + (2.3 * additionalHeight);
  double ibwForOthers = (ibwForMan + ibwForWomen) / 2;
  if (gen == 'male') {
    return double.parse(ibwForMan.toStringAsFixed(1));
  }
  if (gen == 'female') {
    return double.parse(ibwForWomen.toStringAsFixed(1));
  }
  return double.parse(ibwForOthers.toStringAsFixed(1));
}

Future setSelectedMeal(MealModal meal) async {
  var status = await addMealsToDatabase(meal);
  if (status == SUCCESS_MESSAGE) {
    selectedMeals.insert(selectedMeals.length, meal);
  }
  return status;
}

List getSelectedMealsInJSON() {
  List jsonMealsArray = [];

  for (var i = 0; i < getSelectedMeal.length; i++) {
    DateTime dateTime = DateTime(
        getSelectedMeal[i].date.year,
        getSelectedMeal[i].date.month,
        getSelectedMeal[i].date.day,
        getSelectedMeal[i].time.hour,
        getSelectedMeal[i].time.minute);
    Timestamp timestamp = Timestamp.fromDate(dateTime.toUtc());
    print('UTC $timestamp');
    jsonMealsArray.add({
      'mealId': getSelectedMeal[i].mealId,
      'mealName': getSelectedMeal[i].mealName,
      'mealType': getMealTypeEnumToStringConvertor(getSelectedMeal[i].mealType),
      'imageLink': getSelectedMeal[i].imageLink,
      'dateTime': timestamp,
      'notificationsID': getSelectedMeal[i].notificationsId,
      'mealCategory':
          getMealCategoryEnumToStringConvertor(getSelectedMeal[i].mealCategory),
    });
  }

  return jsonMealsArray;
}

List<MealModal> get getSelectedMeal {
  return selectedMeals;
}

Future setSelectedWorkout(
    {required List selectedExercises,
    required List exerciseDescription,
    required DateTime date,
    required TimeOfDay time,
    required int notificationId,
    required List videoID,
    required List<int> sets,
    required List reps,
    required List<bool> isCompleted}) async {
  List<SelectedWorkoutModal> selectedWorkoutsForTheDay = [];

  for (var i = 0; i < selectedExercises.length; i++) {
    selectedWorkoutsForTheDay.add(SelectedWorkoutModal(
        notificationID: notificationId,
        exerciseName: selectedExercises[i],
        exerciseDescription: exerciseDescription[i],
        workoutDate: date,
        sets: sets[i],
        reps: reps[i],
        videoID: videoID[i],
        totalworkoutDuration: 0,
        workoutTime: time,
        isCompleted: isCompleted[i]));
  }

  if (selectedWorkouts.isEmpty) {
    final status = await addWorkoutsToDatabase(selectedWorkoutsForTheDay);
    if (status == SUCCESS_MESSAGE) {
      selectedWorkouts.add(selectedWorkoutsForTheDay);
    }
    return status;
  }

  for (var i = 0; i < selectedWorkouts.length; i++) {
    for (var j = 0; j < selectedWorkouts[i].length; j++) {
      if (selectedWorkouts[i][j].workoutDate.year == date.year &&
          selectedWorkouts[i][j].workoutDate.month == date.month &&
          selectedWorkouts[i][j].workoutDate.day == date.day) {
        // var deletionStatus;
        for (var k = 0; k < selectedWorkoutsForTheDay.length; k++) {
          // deletionStatus = await deleteWorkoutFromDatabase(selectedWorkouts[i]);
          selectedWorkouts[i].add(selectedWorkoutsForTheDay[k]);
        }
        final additionStatus = await addWorkoutsToDatabase(selectedWorkouts[i]);

        if (additionStatus == SUCCESS_MESSAGE) {
          return additionStatus;
        } else {
          for (var ind = 0; ind < selectedWorkoutsForTheDay.length; ind++) {
            selectedWorkouts[i].removeLast();
          }
          return additionStatus;
        }
      } else if (i == selectedWorkouts.length - 1) {
        selectedWorkouts.add(selectedWorkoutsForTheDay);
        final status = await addWorkoutsToDatabase(selectedWorkouts[i]);
        if (status != SUCCESS_MESSAGE) {
          selectedWorkouts.removeLast();
        }
        return status;
      }
    }
  }
}

List getSelectedWorkoutsInJSON() {
  List selectedExercisesJSON = [];
  List selectedExercises = [];
  for (var i = 0; i < getSelectedWorkout.length; i++) {
    selectedExercises = [];
    for (var j = 0; i < getSelectedWorkout[i].length; j++) {
      selectedExercises.add({
        'notificationID': getSelectedWorkout[i][j].notificationID,
        'exerciseName': getSelectedWorkout[i][j].exerciseName,
        'workoutDate': getSelectedWorkout[i][j].workoutDate,
        'workoutTime': getSelectedWorkout[i][j].workoutTime,
        'exerciseDescription': getSelectedWorkout[i][j].exerciseDescription,
        'reps': getSelectedWorkout[i][j].reps,
        'sets': getSelectedWorkout[i][j].sets,
        'videoID': getSelectedWorkout[i][j].videoID,
        'totalworkoutDuration': getSelectedWorkout[i][j].totalworkoutDuration,
        'isCompleted': getSelectedWorkout[i][j].isCompleted,
      });
    }
    selectedExercisesJSON.add(selectedExercises);
  }

  return selectedExercisesJSON;
}

List<List<SelectedWorkoutModal>> get getSelectedWorkout {
  return selectedWorkouts;
}

Future setWorkoutTiming(int workoutIndex, int duration) async {
  int backupDuration = selectedWorkouts[workoutIndex][0].totalworkoutDuration;
  for (var i = 0; i < selectedWorkouts[workoutIndex].length; i++) {
    selectedWorkouts[workoutIndex][i].totalworkoutDuration = duration;
  }
  final status = await addWorkoutsToDatabase(selectedWorkouts[workoutIndex]);
  if (status != SUCCESS_MESSAGE) {
    for (var i = 0; i < selectedWorkouts[workoutIndex].length; i++) {
      selectedWorkouts[workoutIndex][i].totalworkoutDuration = backupDuration;
    }
  }
  return status;
}

void setImagePaths(ImageModal filepath) {
  clickedImages.add(filepath);
}

List<ImageModal> get getImagePaths {
  return clickedImages;
}

Future<bool> canVibrationWork() async {
  if (await Vibration.hasVibrator() as bool &&
      await Vibration.hasCustomVibrationsSupport() as bool &&
      await Vibration.hasAmplitudeControl() as bool) {
    return true;
  }
  return false;
}

int getuserAge(DateTime dateOfBirth) {
  Duration duration = DateTime.now().difference(dateOfBirth);
  int age = (duration.inDays / 365).floor();
  return age;
}
