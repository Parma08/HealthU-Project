import 'dart:io';

import 'package:fiteness_x/modals/constants.dart';
import 'package:flutter/material.dart';

import 'meal_modal.dart';

late List<MealModal> selectedMeals = [];
late List<List<SelectedWorkoutModal>> selectedWorkouts = [];
late List<ImageModal> clickedImages = [];

void setSelectedMeal(MealModal meal) {
  selectedMeals.insert(selectedMeals.length, meal);
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
