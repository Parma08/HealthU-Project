import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:fiteness_x/modals/meal_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../modals/appGetterSetter.dart';
import '../../themes.dart';

class AddMealModal extends StatefulWidget {
  String mealId;
  String mealName;
  String mealCategory;
  String imageLink;
  AddMealModal({
    required this.mealId,
    required this.mealName,
    required this.imageLink,
    required this.mealCategory,
  }) {}

  @override
  State<AddMealModal> createState() => _AddMealModalState();
}

class _AddMealModalState extends State<AddMealModal> {
  List<String> mealType = ['Breakfast', 'Lunch', 'Dinner', 'Snacks'];
  String mealDropDownValue = 'Lunch';
  TimeOfDay time = TimeOfDay.now();
  DateTime date = DateTime.now();
  MealType mealTypeStringToEnumConvertor(String mealtype) {
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

  MealCategory getMealCategoryEnumValue(String mealCategory) {
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

  Future openDatePicker(BuildContext context) async {
    date = (await showDatePicker(
        helpText: 'When will you have this meal?',
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030)))!;
  }

  Future openTimePicker(BuildContext context) async {
    time = (await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        helpText: 'At what time will you have this meal?'))!;
  }

  addMeal(BuildContext ctx) async {
    for (var i = 0; i < getSelectedMeal.length; i++) {
      print('fklsdkfldsf1 ${getSelectedMeal[i].mealCategory}');
      print('fklsdkfldsf1 ${widget.mealId}');
      if (getSelectedMeal[i].mealId == widget.mealId &&
          getSelectedMeal[i].mealType ==
              mealTypeStringToEnumConvertor(mealDropDownValue)) {
        print('fklsdkfldsf');
        if (getSelectedMeal[i].date.year == date.year &&
            getSelectedMeal[i].date.month == date.month &&
            getSelectedMeal[i].date.day == date.day) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(ctx).pop(); //For dialog
            Navigator.of(ctx).pop(); //For bottom modal
          });
          await showSuccessDialog(
              context: context,
              successMessage: 'Meal Already added for this day');
          return;
        }
      }
    }
    setSelectedMeal(MealModal(
        mealId: widget.mealId,
        mealName: widget.mealName,
        imageLink: widget.imageLink,
        mealType: mealTypeStringToEnumConvertor(mealDropDownValue),
        time: time,
        date: date,
        notifications: true,
        mealCategory: getMealCategoryEnumValue(widget.mealCategory)));

    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(ctx).pop(); //For dialog
      Navigator.of(ctx).pop(); //For bottom modal
    });
    await showSuccessDialog(
        context: context, successMessage: 'Meal Added Successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Container(
            height: 60,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(255, 202, 202, 0.498),
                      blurRadius: 4),
                ],
                borderRadius: BorderRadius.circular(15)),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Category',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Container(
                      alignment: Alignment.center,
                      height: 30,
                      decoration: BoxDecoration(
                          gradient: primaryLinearGradient,
                          borderRadius: BorderRadius.circular(40)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: DropdownButton(
                        underline: Text(""),
                        dropdownColor: Color.fromRGBO(202, 211, 255, 1),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                          size: 20,
                        ),
                        value: mealDropDownValue,
                        elevation: 3,
                        items: mealType.map((meal) {
                          return DropdownMenuItem(
                            child: Text(
                              meal,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            value: meal,
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            mealDropDownValue = val!;
                          });
                        },
                      ))
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(202, 211, 255, 0.5), blurRadius: 4),
                ],
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Date',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        DateFormat.MMMEd().format(DateTime(
                            date.year,
                            date.month,
                            date.day,
                            date.hour,
                            date.minute,
                            date.second)),
                        style: TextStyle(fontSize: 10)),
                    IconButton(
                        onPressed: () {
                          openDatePicker(context);
                        },
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          color: Color(0xFF92A3FD),
                        )),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 60,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(202, 211, 255, 0.5), blurRadius: 4),
                ],
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat.jm().format(DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          time.hour,
                          time.minute)),
                      style: TextStyle(fontSize: 10),
                    ),
                    IconButton(
                        onPressed: () {
                          openTimePicker(context);
                        },
                        icon:
                            Icon(Icons.access_time, color: Color(0xFF92A3FD))),
                  ],
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              addMeal(context);
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 40, left: 15, right: 15),
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: primaryLinearGradient,
                  borderRadius: BorderRadius.circular(100)),
              child: const Text(
                '+ Add Meal',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
