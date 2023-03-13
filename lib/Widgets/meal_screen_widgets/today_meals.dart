import 'package:intl/intl.dart';
import 'package:fiteness_x/Widgets/show_meals_widgets/meal_info_screen.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:fiteness_x/modals/meal_modal.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';

class TodayMeals extends StatefulWidget {
  String getMealTypeEnumValue(MealType mealtype) {
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

  @override
  State<TodayMeals> createState() => _TodayMealsState();
}

class _TodayMealsState extends State<TodayMeals> {
  List<String> mealType = ['Breakfast', 'Lunch', 'Dinner', 'Snacks'];
  String mealDropDownValue = 'Lunch';
  List<MealModal> todayMeals = [];
  bool listHasBreakfast = false;
  bool listHasLunch = false;
  bool listHasDinner = false;
  bool listHasSnack = false;
  @override
  void initState() {
    super.initState();
  }

  void initializeTodayMeals() {
    todayMeals = [];
    DateTime todaysDate = DateTime.now();
    for (var i = 0; i < getSelectedMeal.length; i++) {
      if (getSelectedMeal[i].date.year == todaysDate.year &&
          getSelectedMeal[i].date.month == todaysDate.month &&
          getSelectedMeal[i].date.day == todaysDate.day) {
        if (getSelectedMeal[i].mealType == MealType.Breakfast) {
          listHasBreakfast = true;
        }
        if (getSelectedMeal[i].mealType == MealType.Snack) {
          listHasSnack = true;
        }
        if (getSelectedMeal[i].mealType == MealType.Dinner) {
          listHasDinner = true;
        }
        if (getSelectedMeal[i].mealType == MealType.Lunch) {
          listHasLunch = true;
        }
        todayMeals.insert(todayMeals.length, getSelectedMeal[i]);
      }
    }
    print(
        'CONRF ${mealDropDownValue.toLowerCase() == 'breakfast' && !listHasBreakfast}');
  }

  Widget errorTextBuilder(String mealType) {
    return Text(
      'No $mealType Added For Today \n Add Now!'.toUpperCase(),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 255, 17, 0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    initializeTodayMeals();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today Meals',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Container(
                  alignment: Alignment.center,
                  height: 30,
                  decoration: BoxDecoration(
                      gradient: primaryLinearGradient,
                      borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                  )),
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              child: mealDropDownValue.toLowerCase() == 'breakfast' &&
                      !listHasBreakfast
                  ? Center(
                      child: errorTextBuilder('breakfast'),
                    )
                  : mealDropDownValue.toLowerCase() == 'lunch' && !listHasLunch
                      ? Center(
                          child: errorTextBuilder('lunch'),
                        )
                      : mealDropDownValue.toLowerCase() == 'dinner' &&
                              !listHasDinner
                          ? Center(
                              child: errorTextBuilder('dinner'),
                            )
                          : mealDropDownValue.toLowerCase() == 'snacks' &&
                                  !listHasSnack
                              ? Center(
                                  child: errorTextBuilder('snacks'),
                                )
                              : Column(
                                  children: todayMeals.map((mealItem) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (_) {
                                          return MealInfoScreeen(
                                            id: mealItem.mealId,
                                            mealName: mealItem.mealName,
                                          );
                                        }));
                                      },
                                      child: Container(
                                        child: widget
                                                    .getMealTypeEnumValue(
                                                        mealItem.mealType)
                                                    .toLowerCase() !=
                                                mealDropDownValue.toLowerCase()
                                            ? Container()
                                            : Container(
                                                padding: EdgeInsets.only(
                                                    top: 20,
                                                    left: 20,
                                                    right: 30,
                                                    bottom: 20),
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Color.fromRGBO(
                                                              158,
                                                              158,
                                                              158,
                                                              0.2),
                                                          blurRadius: 10)
                                                    ]),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        mealItem.imageLink,
                                                        height: 60,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 22),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 170,
                                                            child: Text(
                                                              mealItem.mealName,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Text(
                                                            DateFormat.jm()
                                                                .format(DateTime(
                                                                    DateTime.now()
                                                                        .year,
                                                                    DateTime.now()
                                                                        .month,
                                                                    DateTime.now()
                                                                        .day,
                                                                    mealItem
                                                                        .time
                                                                        .hour,
                                                                    mealItem
                                                                        .time
                                                                        .minute)),
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF7B6F72),
                                                                fontSize: 12),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            if (mealItem
                                                                .notifications) {
                                                              mealItem.notifications =
                                                                  false;
                                                              return;
                                                            }
                                                            mealItem.notifications =
                                                                true;
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      197,
                                                                      139,
                                                                      242,
                                                                      0.2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                          child: mealItem
                                                                  .notifications
                                                              ? Icon(
                                                                  Icons
                                                                      .notifications_outlined,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          197,
                                                                          139,
                                                                          242,
                                                                          1),
                                                                )
                                                              : Icon(
                                                                  Icons
                                                                      .notifications_off_outlined,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          197,
                                                                          139,
                                                                          242,
                                                                          1),
                                                                ),
                                                        ),
                                                      ),
                                                    ))
                                                  ],
                                                )),
                                      ),
                                    );
                                  }).toList(),
                                ))
        ],
      ),
    );
  }
}
