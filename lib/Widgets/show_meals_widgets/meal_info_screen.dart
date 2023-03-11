import 'dart:convert';
import 'dart:ffi';

import 'package:fiteness_x/Widgets/meal_screen_widgets/add_meal_modal.dart';
import 'package:fiteness_x/Widgets/show_meals_widgets/meal_info_builder_widgets/ingrediets_required_widget.dart';
import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:fiteness_x/modals/meal_modal.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'meal_info_builder_widgets/meal_making_steps_widget.dart';

class MealInfoScreeen extends StatefulWidget {
  String id;
  String mealName;
  MealInfoScreeen({required this.id, required this.mealName});

  @override
  State<MealInfoScreeen> createState() => _MealInfoScreeenState();
}

class _MealInfoScreeenState extends State<MealInfoScreeen> {
  late List mealInfo;
  List<String> ingredients = [];
  List<String> ingredientQuantity = [];
  List<String> preparationSteps = [];
  String imageURL = '';
  String ytLink = '';
  String mealCategory = '';
  late YoutubePlayerController _controller;
  bool isLoaded = false;
  bool isError = false;

  void getMealInfo() async {
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
            callbackFuction: getMealInfo);
        return;
      }
    });
    http.Response response;
    response = await http.get(
      Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.id}'),
    );

    if (response.statusCode == 200) {
      isLoaded = true;
      isError = false;
      setState(() {
        mealInfo = jsonDecode(response.body)['meals'];
        imageURL = mealInfo[0]['strMealThumb'];
        ytLink = mealInfo[0]['strYoutube'];
        mealCategory = mealInfo[0]['strCategory'];
        final videoID = YoutubePlayer.convertUrlToId(ytLink);
        _controller = YoutubePlayerController(
            initialVideoId: videoID!,
            flags: YoutubePlayerFlags(
              autoPlay: false,
            ));
        mealInfo[0].forEach((key, value) {
          if (value != null && value.trim() != '') {
            if (key.contains('strIngredient')) {
              ingredients.insert(ingredients.length, value);

              print(
                  'https://www.themealdb.com/images/ingredients/${value}.png');
            } else if (key.contains('strMeasure')) {
              ingredientQuantity.insert(ingredientQuantity.length, value);
            } else if (key.contains('strInstructions')) {
              String transformedSteps;
              transformedSteps =
                  value.replaceAll(RegExp(r'STEP\s+\d+|\r\n|\r|\n|\n\r'), '');
              preparationSteps = transformedSteps.split('.');
              preparationSteps.removeLast();
              for (var i = 0; i < preparationSteps.length; i++) {
                if (preparationSteps[i].substring(0, 1) == ' ') {
                  preparationSteps[i] = preparationSteps[i]
                      .substring(1, preparationSteps[i].length);
                }
              }
            }
          }
        });
        print('INGREDIET QUANTITY ${preparationSteps[1][1]}');
      });
    } else {
      isLoaded = true;
      isError = true;
      showErrorDialog(
          context: context,
          errorMessage: 'Something went Wrong',
          callbackFuction: getMealInfo);
    }
  }

  @override
  void initState() {
    super.initState();
    getMealInfo();
  }

  openMealAddModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddMealModal(
            imageLink: imageURL,
            mealId: widget.id,
            mealName: widget.mealName,
            mealCategory: mealCategory,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: !isLoaded && !isError
            ? Container()
            : Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    gradient: primaryLinearGradient,
                    borderRadius: BorderRadius.circular(45)),
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    openMealAddModal(context);
                  },
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF92A3FD),
          centerTitle: true,
          title: Text(
            widget.mealName,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
        ),
        body: !isLoaded && !isError
            ? Loader()
            : Column(
                children: [
                  YoutubePlayer(
                    width: MediaQuery.of(context).size.width,
                    aspectRatio: 16 / 11,
                    thumbnail: Image.network(
                      imageURL,
                      fit: BoxFit.cover,
                    ),
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressColors:
                        ProgressBarColors(backgroundColor: Color(0xFF92A3FD)),
                    bottomActions: [
                      ProgressBar(
                        isExpanded: true,
                      ),
                      const PlaybackSpeedButton(
                        icon: Icon(
                          Icons.speed_rounded,
                          color: Color(0xFF92A3FD),
                        ),
                      )
                    ],
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height -
                          ((MediaQuery.of(context).size.width * 0.6896551) +
                              MediaQuery.of(context).padding.top +
                              AppBar().preferredSize.height),
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          IngredientsRequiredWidget(
                            ingredients: ingredients,
                            ingredientQuantity: ingredientQuantity,
                          ),
                          MealMakingSteps(
                            preparationSteps,
                          ),
                        ],
                      ))
                ],
              ));
  }
}
