import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:fiteness_x/modals/meal_modal.dart';
import 'package:flutter/material.dart';

import '../Widgets/utils/loader_error_handle_widget.dart';

var mainDocRef =
    FirebaseFirestore.instance.collection('users').doc(getUserDetails.userId);

Future addMealsToDatabase(MealModal meal) async {
  if (await isInternetCOnnectionDown()) {
    return INTERNET_DOWN_MESSAGE;
  }
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
    var addedResponse = await mainDocRef
        .collection('meals')
        .doc('${jsonMealsArray[0]['mealId'] + key.toString()}')
        .set({'meal': jsonMealsArray});
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}

Future deleteMealFromDatabase(MealModal meal) async {
  if (await isInternetCOnnectionDown()) {
    return INTERNET_DOWN_MESSAGE;
  }
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
    var addedResponse = await mainDocRef
        .collection('meals')
        .doc('${jsonMealsArray[0]['mealId'] + key.toString()}')
        .delete();
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}

Future addWaterGoalsToDatabase(int waterInLiters) async {
  if (await isInternetCOnnectionDown()) {
    return INTERNET_DOWN_MESSAGE;
  }
  try {
    var addedResponse = await mainDocRef.update({
      'waterGoals': waterInLiters,
    });
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}

Future changeWaterConsumedInDatabase(double waterInLiters) async {
  if (await isInternetCOnnectionDown()) {
    return INTERNET_DOWN_MESSAGE;
  }
  try {
    var addedResponse = await mainDocRef.update({
      'waterConsumedInADay': {
        'dateTime': Timestamp.fromDate(DateTime.now()),
        'waterConsumed': waterInLiters
      },
    });
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}

Future addWorkoutsToDatabase(
    List<SelectedWorkoutModal> selectedworkouts) async {
  if (await isInternetCOnnectionDown()) {
    return INTERNET_DOWN_MESSAGE;
  }
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
      'isCompleted': selectedworkouts[i].isCompleted,
    });
  }
  try {
    var status = await mainDocRef
        .collection('workouts')
        .doc('${key.toString()}')
        .set({'workout': selectedworkoutsInJSON});
    print('ADD WORKOUT ${key.toString()}');
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}

Future deleteWorkoutFromDatabase(
    List<SelectedWorkoutModal> selectedworkouts) async {
  if (await isInternetCOnnectionDown()) {
    return INTERNET_DOWN_MESSAGE;
  }
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
    await mainDocRef.collection('workouts').doc('${key.toString()}').delete();
    //     .update({
    //   '$key': selectedworkoutsInJSON,
    // });
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}

Future initializeDatabaseRelatedThingsForApp() async {
  if (await isInternetCOnnectionDown()) {
    return INTERNET_DOWN_MESSAGE;
  }
  var status = await setUpUserDetailsFromDatabase();
  if (status == SUCCESS_MESSAGE) {
    status = await setupMealsFromDatabase();
  } else {
    return status;
  }
  if (status == SUCCESS_MESSAGE) {
    status = await setupWorkoutsFromDatabase();
  } else {
    return status;
  }
  if (status != SUCCESS_MESSAGE) {
    return status;
  }
  return SUCCESS_MESSAGE;
}

Future setUpUserDetailsFromDatabase() async {
  if (await isInternetCOnnectionDown()) {
    return INTERNET_DOWN_MESSAGE;
  }
  final userID = FirebaseAuth.instance.currentUser!.uid;
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('${userID}')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map userData = documentSnapshot.data() as Map;

        final height = userData['height'];
        final weight = userData['weight'];
        final dob = userData['dateOfBirth'].toDate();
        final gender = getGenderStringToEnumConvertor(userData['gender']);
        final bmi = getCalculatedBMI(weight, height);
        final bmr = getCalculatedBMR(weight, height, dob, gender);
        final idw = getCalculatedIdealBodyWeight(height, gender);
        DateTime waterConsumedDate =
            userData['waterConsumedInADay']['dateTime'].toDate();
        double waterConsumedInLiters =
            userData['waterConsumedInADay']['waterConsumed'];
        setWaterGoals(userData['waterGoals']);
        if (waterConsumedDate.day != DateTime.now().day ||
            waterConsumedDate.month != DateTime.now().month ||
            waterConsumedDate.year != DateTime.now().year) {
          waterConsumedDate = DateTime.now();
          waterConsumedInLiters = 0;
        }
        setUserDetails(UserModal(
            userId: userID,
            firstName: userData['firstName'],
            lastName: userData['lastName'],
            dateOfBirth: dob,
            gender: gender,
            weightInKgs: weight,
            heightInCM: height,
            bmi: bmi,
            bmr: bmr,
            ibw: idw,
            waterGoalsInLiters: userData['waterGoals'],
            waterConsumedInADay: waterConsumedModal(
                date: waterConsumedDate,
                waterConsumedInLiters: waterConsumedInLiters)));

        setWaterConsumed(userDetails.waterConsumedInADay.waterConsumedInLiters);
        setWaterGoals(userDetails.waterGoalsInLiters);
      }
    });
  } on FirebaseException catch (e) {
    return e.message;
  }

  return SUCCESS_MESSAGE;
}

Future setupMealsFromDatabase() async {
  if (await isInternetCOnnectionDown()) {
    return INTERNET_DOWN_MESSAGE;
  }
  try {
    await mainDocRef
        .collection('meals')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        final Map? documentData = documentSnapshot.data() as Map;
        final List mealArray = documentData!['meal'];
        for (var i = 0; i < mealArray.length; i++) {
          setSelectedMeal(MealModal(
              mealId: mealArray[i]['mealId'],
              mealName: mealArray[i]['mealName'],
              mealType:
                  getMealTypeStringToEnumConvertor(mealArray[i]['mealType']),
              time: TimeOfDay.fromDateTime(mealArray[i]['dateTime'].toDate()),
              imageLink: mealArray[i]['imageLink'],
              date: mealArray[i]['dateTime'].toDate(),
              notifications: mealArray[i]['notfications'],
              mealCategory: getMealCategoryStringToEnumConvertor(
                  mealArray[i]['mealCategory'])));
        }
      }
    });
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}

Future setupWorkoutsFromDatabase() async {
  if (await isInternetCOnnectionDown()) {
    return INTERNET_DOWN_MESSAGE;
  }
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userDetails.userId)
        .collection('workouts')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map documentData = documentSnapshot.data() as Map;
        List workoutsForDay = documentData['workout'];
        List selectedExercises = [];
        List exerciseDescription = [];
        List<int> sets = [];
        List reps = [];
        List videoId = [];
        DateTime date = DateTime.now();
        TimeOfDay time = TimeOfDay.now();
        int notificationId = 0;
        for (var i = 0; i < workoutsForDay.length; i++) {
          selectedExercises.add(workoutsForDay[i]['exerciseName']);
          exerciseDescription.add(workoutsForDay[i]['exerciseDescription']);
          sets.add(workoutsForDay[i]['sets']);
          reps.add(workoutsForDay[i]['reps']);
          videoId.add(workoutsForDay[i]['videoID']);
          date = workoutsForDay[i]['workoutDateTime'].toDate();
          time = TimeOfDay.fromDateTime(
              workoutsForDay[i]['workoutDateTime'].toDate());
          notificationId = workoutsForDay[i]['notificationID'];
        }
        setSelectedWorkout(
            selectedExercises: selectedExercises,
            exerciseDescription: exerciseDescription,
            date: date,
            time: time,
            notificationId: notificationId,
            videoID: videoId,
            sets: sets,
            reps: reps);
      }
    });
  } on FirebaseException catch (e) {
    return e.message;
  }
  return SUCCESS_MESSAGE;
}
