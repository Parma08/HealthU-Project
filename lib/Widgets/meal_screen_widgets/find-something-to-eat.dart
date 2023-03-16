import 'package:fiteness_x/Widgets/meal_screen_widgets/today_meals.dart';
import 'package:fiteness_x/Widgets/show_meals_widgets/show_meal_screen.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../modals/meal_modal.dart';

class FindSomethingToEat extends StatefulWidget {
  @override
  State<FindSomethingToEat> createState() => _FindSomethingToEatState();
}

class _FindSomethingToEatState extends State<FindSomethingToEat> {
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

  Widget someThingToEatCardBuilder(int totalNumber, String illustrationLink,
      BuildContext context, MealCategory mealCategory, String bgShade) {
    return GestureDetector(
      onTap: () {
        String categoryText = '';
        categoryText = CATEGORY_INFO.firstWhere((categoryInfo) =>
            categoryInfo['category'] ==
            getMealCategoryEnumValue(mealCategory))['cText']!;

        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          print('CATEF:$categoryText');
          return ShowMealScreen(
            category: getMealCategoryEnumValue(
              mealCategory,
            ),
            categoryTitle: categoryText,
            illustrationLink: illustrationLink,
          );
        })).then((value) => setState(() {}));
      },
      child: Container(
        height: 200,
        width: 200,
        margin: EdgeInsets.only(right: 20, bottom: 70, top: 15),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  gradient: bgShade.toLowerCase() == 'pink'
                      ? LinearGradient(colors: [
                          Color.fromRGBO(197, 139, 242, 0.2),
                          Color.fromRGBO(238, 164, 206, 0.2),
                        ])
                      : LinearGradient(colors: [
                          Color.fromRGBO(146, 163, 253, 0.2),
                          Color.fromRGBO(157, 206, 255, 0.2),
                        ])),
            ),
            Positioned(
                bottom: 0,
                left: 10,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(getMealCategoryEnumValue(mealCategory),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      Text('${totalNumber - 1}+ foods',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF7B6F72),
                          )),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                        decoration: BoxDecoration(
                            gradient: primaryLinearGradient,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Select',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
              right: 2,
              top: 3,
              child: SvgPicture.asset(
                illustrationLink,
                // fit: BoxFit.cover,
                height: 80,
                width: 80,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TodayMeals(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Find Something to Eat',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      someThingToEatCardBuilder(65, 'assets/images/lunch.svg',
                          context, MealCategory.Vegetarian, 'blue'),
                      someThingToEatCardBuilder(
                          121,
                          'assets/images/seafood.svg',
                          context,
                          MealCategory.Seafood,
                          'pink'),
                      someThingToEatCardBuilder(41, 'assets/images/dessert.svg',
                          context, MealCategory.Dessert, 'blue'),
                      someThingToEatCardBuilder(12, 'assets/images/salad.svg',
                          context, MealCategory.Vegan, 'pink'),
                      someThingToEatCardBuilder(31, 'assets/images/pasta.svg',
                          context, MealCategory.Pasta, 'blue'),
                      someThingToEatCardBuilder(65, 'assets/images/chicken.svg',
                          context, MealCategory.Chicken, 'pink'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
