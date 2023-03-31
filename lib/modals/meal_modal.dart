import 'package:fiteness_x/modals/constants.dart';
import 'package:flutter/material.dart';

enum MealType { Breakfast, Lunch, Dinner, Snack }

enum Gender { male, female, others }

enum MealCategory {
  Beef,
  Chicken,
  Dessert,
  Lamb,
  Miscellaneous,
  Pasta,
  Pork,
  Seafood,
  Side,
  Starter,
  Vegan,
  Vegetarian,
  Breakfast,
  Goat
}

class MealModal {
  String mealId;
  String mealName;
  MealType mealType;
  DateTime date;
  TimeOfDay time;
  String imageLink;
  bool notifications;
  MealCategory mealCategory;

  MealModal({
    required this.mealId,
    required this.mealName,
    required this.mealType,
    required this.time,
    required this.imageLink,
    required this.date,
    required this.notifications,
    required this.mealCategory,
  });
}

class waterConsumedModal {
  DateTime date;
  double waterConsumedInLiters;

  waterConsumedModal({required this.date, required this.waterConsumedInLiters});
}

class WaterGoalsModal {
  DateTime date;
  double waterGoalInLiters;

  WaterGoalsModal({required this.date, required this.waterGoalInLiters});
}

class UserModal {
  String userId;
  String firstName;
  String lastName;
  DateTime dateOfBirth;
  int weightInKgs;
  int heightInCM;
  WaterGoalsModal waterGoalsInLiters;
  waterConsumedModal waterConsumedInADay;
  MealModal? selectedMeals;
  SelectedWorkoutModal? selectedWorkouts;
  Gender gender;
  double bmi;
  double bmr;
  double ibw;
  UserModal({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    required this.weightInKgs,
    required this.heightInCM,
    required this.bmi,
    required this.bmr,
    required this.ibw,
    this.selectedMeals,
    this.selectedWorkouts,
    required this.waterGoalsInLiters,
    required this.waterConsumedInADay,
  });
}
