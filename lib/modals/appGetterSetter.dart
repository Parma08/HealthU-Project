import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:fiteness_x/modals/firebaseservice.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

import 'meal_modal.dart';

late List<MealModal> selectedMeals = [];
late List<List<SelectedWorkoutModal>> selectedWorkouts = [];
late List<ImageModal> clickedImages = [];
late int waterGoal = 4;
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

Map<String, dynamic> get getUserDetailsInJSON {
  return {
    'firstName': userDetails.firstName,
    'lastName': userDetails.lastName,
    'dateOfBirth': Timestamp.fromDate(userDetails.dateOfBirth),
    'gender': getGenderEnumToStringConvertor(userDetails.gender),
    'weight': userDetails.weightInKgs,
    'height': userDetails.heightInCM,
  };
}

Future setWaterGoals(int goal) async {
  final status = await addWaterGoalsToDatabase(goal);

  if (status == SUCCESS_MESSAGE) {
    waterGoal = goal;
  }
  return status;
}

double getCalculatedBMI(int weightInKG, int heightInCM) {
  num denominator = pow((heightInCM / 100), 2);
  return double.parse((weightInKG / denominator).toStringAsFixed(1));
}

double getCalculatedBMR(
    int weightInKG, int heightInCM, DateTime dateOfBirth, Gender gender) {
  Duration duration = DateTime.now().difference(dateOfBirth);
  int age = (duration.inDays / 365).floor();
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
  double ibwForMan = 50 + 2.3 * ((heightInCM - 152.4) / 2.54);
  double ibwForWomen = 45.5 + 2.3 * ((heightInCM - 152.4) / 2.54);
  ;
  double ibwForOthers = (ibwForMan + ibwForWomen) / 2;
  if (gen == 'male') {
    return double.parse(ibwForMan.toStringAsFixed(1));
  }
  if (gen == 'female') {
    return double.parse(ibwForWomen.toStringAsFixed(1));
  }
  return double.parse(ibwForOthers.toStringAsFixed(1));
}

int get getWaterGoal {
  return waterGoal;
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
      'notfications': getSelectedMeal[i].notifications,
      'mealCategory':
          getMealCategoryEnumToStringConvertor(getSelectedMeal[i].mealCategory),
    });
  }

  return jsonMealsArray;
}

List<MealModal> get getSelectedMeal {
  return selectedMeals;
}

void setSelectedWorkout(
    {required List selectedExercises,
    required List exerciseDescription,
    required DateTime date,
    required TimeOfDay time,
    required int notificationId,
    required List videoID,
    required List<int> sets,
    required List reps}) {
  List<SelectedWorkoutModal> selectedWorkoutsForTheDay = [];

  for (var i = 0; i < selectedExercises.length; i++) {
    if (selectedWorkoutsForTheDay.isEmpty) {
      selectedWorkoutsForTheDay.insert(
          0,
          SelectedWorkoutModal(
              notificationID: notificationId,
              exerciseName: selectedExercises[i],
              exerciseDescription: exerciseDescription[i],
              workoutDate: date,
              sets: sets[i],
              reps: reps[i],
              videoID: videoID[i],
              totalworkoutDuration: 0,
              workoutTime: time));
      continue;
    }
    selectedWorkoutsForTheDay.insert(
        selectedWorkoutsForTheDay.length - 1,
        SelectedWorkoutModal(
            notificationID: notificationId,
            exerciseName: selectedExercises[i],
            exerciseDescription: exerciseDescription[i],
            workoutDate: date,
            totalworkoutDuration: 0,
            sets: sets[i],
            reps: reps[i],
            videoID: videoID[i],
            workoutTime: time));
  }

  if (selectedWorkouts.isEmpty) {
    selectedWorkouts.insert(0, selectedWorkoutsForTheDay);
    return;
  }

  for (var i = 0; i < selectedWorkouts.length; i++) {
    for (var j = 0; j < selectedWorkouts[i].length; j++) {
      if (selectedWorkouts[i][j].workoutDate.year == date.year &&
          selectedWorkouts[i][j].workoutDate.month == date.month &&
          selectedWorkouts[i][j].workoutDate.day == date.day) {
        print("ADDED WORKOUTS 1 ${selectedWorkoutsForTheDay}");
        for (var k = 0; k < selectedWorkoutsForTheDay.length; k++) {
          selectedWorkouts[i].insert(
              selectedWorkouts[i].length - 1, selectedWorkoutsForTheDay[k]);
        }

        return;
      } else if (i == selectedWorkouts.length - 1) {
        selectedWorkouts.insert(
            selectedWorkouts.length - 1, selectedWorkoutsForTheDay);
        return;
      }
    }
  }
}

List<List<SelectedWorkoutModal>> get getSelectedWorkout {
  return selectedWorkouts;
}

void setWorkoutTiming(int workoutIndex, int duration) {
  for (var i = 0; i < selectedWorkouts[workoutIndex].length; i++) {
    selectedWorkouts[workoutIndex][i].totalworkoutDuration = duration;
  }
}

void setImagePaths(ImageModal filepath) {
  if (clickedImages.isEmpty) {
    clickedImages.insert(0, filepath);
    return;
  }
  clickedImages.insert(clickedImages.length - 1, filepath);
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
