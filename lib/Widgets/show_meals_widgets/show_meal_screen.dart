import 'dart:convert';

import 'package:fiteness_x/Widgets/show_meals_widgets/meal_info_screen.dart';
import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class ShowMealScreen extends StatefulWidget {
  String category = "";
  String illustrationLink;
  String categoryTitle;

  ShowMealScreen(
      {required this.category,
      required this.categoryTitle,
      required this.illustrationLink}) {}
  static const routeName = '/showMeals';
  @override
  State<ShowMealScreen> createState() => _ShowMealScreenState();
}

class _ShowMealScreenState extends State<ShowMealScreen> {
  var showPartialDescription = true;
  bool isLoaded = false;
  bool isError = false;
  List meals = [];
  callMealsApi() async {
    if (isError) {
      setState(() {});
    }
    isLoaded = false;
    isError = false;
    Future.delayed(Duration(seconds: 10), () {
      if (!isLoaded) {
        isError = true;
        showErrorDialog(
            context: context,
            errorMessage: 'Something went Wrong',
            callbackFuction: callMealsApi);
        return;
      }
    });
    http.Response response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=${widget.category}'));

    if (response.statusCode == 200) {
      isLoaded = true;
      isError = false;
      setState(() {
        meals = jsonDecode(response.body)['meals'];
      });
    } else {
      isLoaded = true;
      isError = true;

      showErrorDialog(
          context: context,
          errorMessage: 'Something went Wrong',
          callbackFuction: callMealsApi);
    }
  }

  @override
  void initState() {
    super.initState();
    callMealsApi();
  }

  getMealInfo(BuildContext context, String id, String mealName) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MealInfoScreeen(
        id: id,
        mealName: mealName,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(146, 163, 253, 1),
        elevation: 0,
        title: Text(
          '${widget.category} Meals',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
      ),
      body: !isLoaded && !isError
          ? Loader()
          : ListView(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(146, 163, 253, 1),
                    Color.fromRGBO(146, 163, 253, 0.1)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: SvgPicture.asset(widget.illustrationLink),
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 22),
                      ),
                      showPartialDescription
                          ? RichText(
                              text: TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        showPartialDescription = false;
                                      });
                                    },
                                  text: widget.categoryTitle.substring(0, 150),
                                  style: TextStyle(
                                      color: Color(0xFF7B6F72), fontSize: 16),
                                  children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          setState(() {
                                            showPartialDescription = false;
                                          });
                                        },
                                      text: ' Read More...',
                                      style: TextStyle(
                                          color: Color(0xFFC58BF2),
                                          fontSize: 16))
                                ]))
                          : RichText(
                              text: TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        showPartialDescription = true;
                                      });
                                    },
                                  text: widget.categoryTitle,
                                  style: TextStyle(
                                      color: Color(0xFF7B6F72), fontSize: 16),
                                  children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          setState(() {
                                            showPartialDescription = true;
                                          });
                                        },
                                      text: ' Show Less',
                                      style: TextStyle(
                                          color: Color(0xFFC58BF2),
                                          fontSize: 16))
                                ])),
                    ],
                  )),
              ...meals.map((meal) {
                return GestureDetector(
                  onTap: () {
                    getMealInfo(context, meal['idMeal'], meal['strMeal']);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(158, 158, 158, 0.2),
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                meal['strMealThumb'],
                                fit: BoxFit.cover,
                              ),
                            )),
                        Flexible(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              meal['strMeal'],
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          child: const Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Color(0xFFC58BF2),
                            size: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ]),
    );
  }
}
