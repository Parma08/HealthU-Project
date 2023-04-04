import 'package:fiteness_x/Widgets/meal_screen_widgets/add_meal_modal.dart';
import 'package:fiteness_x/Widgets/show_meals_widgets/meal_info_screen.dart';
import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../modals/appGetterSetter.dart';
import '../../../modals/meal_modal.dart';

class ShowDailyMealsByCategory extends StatefulWidget {
  DateTime selectedDate;
  ShowDailyMealsByCategory({required this.selectedDate}) {}
  ShowDailyMealsByCategoryState createState() {
    return ShowDailyMealsByCategoryState();
  }
}

class ShowDailyMealsByCategoryState extends State<ShowDailyMealsByCategory> {
  List<MealModal> allMeals = getSelectedMeal;
  List<MealModal> breakfastMeals = [];
  List<MealModal> dinnerMeals = [];
  List<MealModal> snackMeals = [];
  List<MealModal> lunchMeals = [];
  bool isMealAdded = false;

  getMealCategoryEnumValue(MealCategory mealCategory) {
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

  divideMealsForCurrentDateBasedOnCategory() {
    allMeals = getSelectedMeal;
    isMealAdded = false;
    breakfastMeals = [];
    dinnerMeals = [];
    snackMeals = [];
    lunchMeals = [];
    for (var i = 0; i < allMeals.length; i++) {
      if (allMeals[i].date.day == widget.selectedDate.day &&
          allMeals[i].date.month == widget.selectedDate.month &&
          allMeals[i].date.year == widget.selectedDate.year) {
        if (allMeals[i].mealType == MealType.Breakfast) {
          isMealAdded = true;
          breakfastMeals.insert(breakfastMeals.length, allMeals[i]);
        }
        if (allMeals[i].mealType == MealType.Lunch) {
          isMealAdded = true;
          lunchMeals.insert(lunchMeals.length, allMeals[i]);
        }
        if (allMeals[i].mealType == MealType.Snack) {
          isMealAdded = true;
          snackMeals.insert(snackMeals.length, allMeals[i]);
        }
        if (allMeals[i].mealType == MealType.Dinner) {
          isMealAdded = true;
          dinnerMeals.insert(dinnerMeals.length, allMeals[i]);
        }
      }
    }
  }

  Widget mealCategoryBuilder(BuildContext context,
      List<MealModal> categoryMeals, String categoryName) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${categoryName}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              Text(
                '${categoryMeals.length} meals',
                style: TextStyle(fontSize: 14, color: Color(0xFFADA4A5)),
              )
            ],
          ),
          ...categoryMeals.map((categoryMeal) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return MealInfoScreeen(
                      id: categoryMeal.mealId, mealName: categoryMeal.mealName);
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                categoryMeal.imageLink,
                                height: 100,
                              ),
                            ),
                          ),
                          Flexible(
                              child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(categoryMeal.mealName,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                Text(
                                    '${DateFormat.jm().format(DateTime(categoryMeal.date.year, categoryMeal.date.month, categoryMeal.date.day, categoryMeal.time.hour, categoryMeal.time.minute))}',
                                    style: TextStyle(
                                        fontSize: 11, color: Color(0xFF7B6F72)))
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width * 0.35) - 50,
                      child: LayoutBuilder(builder: (_, constraints) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: constraints.maxHeight,
                              width: constraints.maxWidth * 0.5,
                              child: IconButton(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                      context: context,
                                      builder: (_) {
                                        return AddMealModal(
                                          mealId: categoryMeal.mealId,
                                          mealName: categoryMeal.mealName,
                                          imageLink: categoryMeal.imageLink,
                                          addingTime: categoryMeal.time,
                                          mealCategory:
                                              getMealCategoryEnumValue(
                                                  categoryMeal.mealCategory),
                                          addingDate: widget.selectedDate,
                                          isEdit: true,
                                          previousMealTypeOfEditingMeal:
                                              categoryMeal.mealType,
                                        );
                                      });
                                  setState(() {});
                                },
                                icon: Icon(Icons.edit),
                                color: Color(0xFF92A3FD),
                              ),
                            ),
                            Container(
                              height: constraints.maxHeight,
                              width: constraints.maxWidth * 0.5,
                              child: IconButton(
                                  onPressed: () async {
                                    await mealDeletionConfirmation(
                                        context: context,
                                        confirmationMessage:
                                            'Are you sure you want to delete this meal?',
                                        mealId: categoryMeal.mealId,
                                        mealType: categoryMeal.mealType,
                                        date: categoryMeal.date,
                                        time: categoryMeal.time);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.delete_forever),
                                  color: Colors.red),
                            )
                          ],
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    divideMealsForCurrentDateBasedOnCategory();
    return !isMealAdded && widget.selectedDate.isBefore(DateTime.now())
        ? Container(
            width: double.infinity,
            height: 300,
            alignment: Alignment.center,
            child: Text(
              'NO MEALS WERE ADDED FOR THIS DAY',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          )
        : !isMealAdded
            ? Container(
                width: double.infinity,
                height: 300,
                alignment: Alignment.center,
                child: Text(
                  'NO MEALS ADDED FOR THIS DAY \n FIND SOMETHING TO EAT!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              )
            : Column(
                children: [
                  breakfastMeals.isEmpty
                      ? Container()
                      : mealCategoryBuilder(
                          context, breakfastMeals, 'Breakfast'),
                  lunchMeals.isEmpty
                      ? Container()
                      : mealCategoryBuilder(context, lunchMeals, 'Lunch'),
                  snackMeals.isEmpty
                      ? Container()
                      : mealCategoryBuilder(context, snackMeals, 'Snacks'),
                  dinnerMeals.isEmpty
                      ? Container()
                      : mealCategoryBuilder(context, dinnerMeals, 'Dinner'),
                ],
              );
  }
}
