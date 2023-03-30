import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:fiteness_x/modals/meal_modal.dart';

Future addMealsToDatabase(MealModal meal) async {
  List jsonMealsArray = [];

  DateTime dateTime = DateTime(meal.date.year, meal.date.month, meal.date.day,
      meal.time.hour, meal.time.minute);
  Timestamp timestamp = Timestamp.fromDate(dateTime.toUtc());
  print('UTC $timestamp');
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
        .update({
      'meals': FieldValue.arrayUnion(jsonMealsArray),
    });
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
      'waterGoals': waterInLiters,
    });
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}
