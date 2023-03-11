import 'package:flutter/material.dart';

enum MealType { Breakfast, Lunch, Dinner, Snack }

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
