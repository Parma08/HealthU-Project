import 'dart:convert';

import 'package:fiteness_x/Widgets/Workout_Widgets/add_workout.dart';
import 'package:fiteness_x/Widgets/Workout_Widgets/workout_info_screen.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../modals/constants.dart';
import '../utils/loader_error_handle_widget.dart';

class WorkoutList extends StatefulWidget {
  String muscleGroup;
  String exerciseType;
  String imageLink;
  WorkoutList(
      {required this.muscleGroup,
      required this.exerciseType,
      required this.imageLink});

  @override
  State<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  late List workoutList = [];
  bool isLoaded = false;
  List<String> selectedWorkouts = [];
  List<String> selectedWorkoutDescription = [];
  List<int> selectedWorkoutReps = [];
  List<int> selectedWorkoutSets = [];
  List<String> selectedWorkoutVideoIds = [];
  bool isError = false;
  bool showPartialDescription = true;
  String categoryDescription = '';
  Map<String, dynamic> queryParams = {};
  getWorkouts() async {
    if (isError) {
      setState(() {});
    }
    Future.delayed(Duration(seconds: 10), () {
      if (!isLoaded) {
        isError = true;
        showErrorDialog(
            context: context,
            errorMessage: 'Something went Wrong',
            callbackFuction: getWorkouts);
        return;
      }
    });

    isError = false;
    isLoaded = false;
    if (!widget.exerciseType.isEmpty) {
      queryParams = {'type': widget.exerciseType};
      for (var i = 0; i < CATEGORY_DESCRIPTION.length; i++) {
        if (CATEGORY_DESCRIPTION[i]['categoryName'] == widget.exerciseType) {
          categoryDescription = CATEGORY_DESCRIPTION[i]['categoryDescription'];
        }
      }
    } else if (!widget.muscleGroup.isEmpty) {
      queryParams = {'muscle': widget.muscleGroup};
    }
    final url = Uri.parse(
        'https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises');
    final headers = {
      'X-RapidAPI-Key': 'b4bb0033eamsh7fda7336a0c60cfp1bcf95jsnf0456b112438',
      'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com'
    };

    http.Response response;
    response = await http.get(url.replace(queryParameters: queryParams),
        headers: headers);
    if (response.statusCode == 200) {
      isLoaded = true;
      isError = false;
      var count = 0;
      workoutList = jsonDecode(response.body);
      for (var i = 0; i < workoutList.length; i++) {
        for (var j = 0; j < VIDEO_LINKS.length; j++) {
          if (!widget.exerciseType.isEmpty) {
            if (VIDEO_LINKS[j][0]['categoryName'] != workoutList[i]['type']) {
              continue;
            }
          } else if (!widget.muscleGroup.isEmpty) {
            if (VIDEO_LINKS[j][0]['categoryName'] != workoutList[i]['muscle']) {
              continue;
            }
          }
          for (var k = 0; k < VIDEO_LINKS[j].length; k++) {
            count++;
            if (VIDEO_LINKS[j][k]['exerciseName'] == workoutList[i]['name']) {
              workoutList[i]['videoId'] =
                  YoutubePlayer.convertUrlToId(VIDEO_LINKS[j][k]['videoLink']);
            }
          }
        }
      }
      setState(() {});
    } else {
      isLoaded = true;
      isError = true;
      showErrorDialog(
          context: context,
          errorMessage: 'Something went wrong',
          callbackFuction: getWorkouts);
      setState(() {});
    }
  }

  void addWorkout(int index, String exerciseName, String exerciseInstructions,
      String videoId) {
    setState(() {
      selectedWorkouts.insert(index, exerciseName);
      selectedWorkoutDescription.insert(index, exerciseInstructions);

      selectedWorkoutReps.insert(index, 12);
      selectedWorkoutSets.insert(index, 3);
      selectedWorkoutVideoIds.insert(index, videoId);
    });
  }

  void removeWorkouts(int index) {
    setState(() {
      selectedWorkoutDescription.removeAt(index);
      selectedWorkouts.removeAt(index);

      selectedWorkoutReps.removeAt(index);
      selectedWorkoutSets.removeAt(index);
      selectedWorkoutVideoIds.removeAt(index);
    });
  }

  void openWorkoutModal() {
    List<String> allSelectedWorkouts = selectedWorkouts;
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddWorkout(
            selectedWorkout: allSelectedWorkouts,
            exerciseDescription: selectedWorkoutDescription,
            videoIDs: selectedWorkoutVideoIds,
            reps: selectedWorkoutReps,
            sets: selectedWorkoutSets,
            addingDate: DateTime.now(),
            addingTime: TimeOfDay.now(),
          );
        });
    setState(() {
      selectedWorkouts = [];
    });
  }

  @override
  void initState() {
    super.initState();
    getWorkouts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(146, 163, 253, 1),
        elevation: 0,
        title: Text(
          'Exercises',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return Dialog(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Color(0xFF92A3FD),
                        child: Text(
                          'Touch and hold the exercises to add them to your workout list.',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.info_outlined))
        ],
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: selectedWorkouts.isEmpty
          ? SizedBox()
          : InkWell(
              onTap: () {
                openWorkoutModal();
              },
              child: Container(
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: primaryLinearGradient,
                    borderRadius: BorderRadius.circular(100)),
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  '+ ADD WORKOUT',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
      body: !isLoaded && !isError
          ? Loader()
          : ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Image.asset(
                    widget.imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
                categoryDescription.isEmpty
                    ? Container()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Description',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            child: showPartialDescription
                                ? RichText(
                                    text: TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            setState(() {
                                              showPartialDescription = false;
                                            });
                                          },
                                        text: categoryDescription.substring(
                                            0, 150),
                                        style: TextStyle(
                                            color: Color(0xFF7B6F72),
                                            fontSize: 16),
                                        children: [
                                        TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                setState(() {
                                                  showPartialDescription =
                                                      false;
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
                                        text: categoryDescription,
                                        style: TextStyle(
                                            color: Color(0xFF7B6F72),
                                            fontSize: 16),
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
                          ),
                        ],
                      ),
                Container(
                  child: Text('Exercises',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(top: 10),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: workoutList.map((exercise) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(20),
                        highlightColor: Color.fromARGB(99, 105, 188, 255),
                        onTap: () {
                          if (selectedWorkouts.contains(exercise['name'])) {
                            int index = selectedWorkoutDescription
                                .indexOf(exercise['instructions']);
                            removeWorkouts(index);
                          } else if (selectedWorkouts.isEmpty) {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return WorkoutInfoScreen(
                                videoId: exercise['videoId'],
                                exerciseSteps: exercise['instructions'],
                                exerciseName: exercise['name'],
                              );
                            }));
                          } else if (!selectedWorkouts.isEmpty) {
                            addWorkout(
                                selectedWorkouts.length - 1,
                                exercise['name'],
                                exercise['instructions'],
                                exercise['videoId']);
                          }
                        },
                        onLongPress: () {
                          if (!selectedWorkouts.contains(exercise['name'])) {
                            if (selectedWorkouts.isEmpty) {
                              addWorkout(
                                  0,
                                  exercise['name'],
                                  exercise['instructions'],
                                  exercise['videoId']);
                            } else {
                              addWorkout(
                                  selectedWorkouts.length - 1,
                                  exercise['name'],
                                  exercise['instructions'],
                                  exercise['videoId']);
                            }
                          }
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: selectedWorkouts.contains(exercise['name'])
                                  ? Color.fromARGB(100, 105, 188, 255)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(99, 105, 188, 255),
                                    blurRadius: 3)
                              ]),
                          padding: EdgeInsets.symmetric(horizontal: 7),
                          margin: EdgeInsets.only(
                              bottom: 5, left: 10, right: 10, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      exercise['name'],
                                      style: TextStyle(
                                          color: selectedWorkouts
                                                  .contains(exercise['name'])
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      '${exercise['difficulty'][0].toUpperCase() + exercise['difficulty'].substring(1)}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: selectedWorkouts
                                                .contains(exercise['name'])
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              selectedWorkouts.isEmpty
                                  ? Icon(
                                      Icons.arrow_circle_right_outlined,
                                      color: Color.fromARGB(255, 89, 112, 232),
                                    )
                                  : SizedBox(
                                      width: 20,
                                    )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
    );
  }
}
