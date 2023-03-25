import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../themes.dart';

class WorkoutInfoScreen extends StatefulWidget {
  final videoId;
  final String exerciseName;
  final String exerciseSteps;
  WorkoutInfoScreen(
      {required this.videoId,
      required this.exerciseSteps,
      required this.exerciseName}) {}

  @override
  State<WorkoutInfoScreen> createState() => _WorkoutInfoScreenState();
}

class _WorkoutInfoScreenState extends State<WorkoutInfoScreen> {
  late YoutubePlayerController _controller;
  List<String> workoutStepByStep = [];
  setPlayer() {
    if (widget.videoId == null) {
      return;
    }

    _controller = YoutubePlayerController(
        initialVideoId: widget.videoId,
        flags: YoutubePlayerFlags(
          autoPlay: false,
        ));
  }

  @override
  void initState() {
    super.initState();
    setPlayer();
    workoutStepByStep = widget.exerciseSteps.split('.');
    workoutStepByStep.removeLast();
    for (var i = 0; i < workoutStepByStep.length; i++) {
      if (workoutStepByStep[i].substring(0, 1) == ' ') {
        workoutStepByStep[i] =
            workoutStepByStep[i].substring(1, workoutStepByStep[i].length);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.exerciseName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF92A3FD),
      ),
      body: widget.videoId == null
          ? Text('NO VIDEO')
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: YoutubePlayer(
                      width: MediaQuery.of(context).size.width,
                      aspectRatio: 16 / 11,
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
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.70 -
                        (AppBar().preferredSize.height +
                            MediaQuery.of(context).padding.top),
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            'Step by Step',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        ...workoutStepByStep.map((step) {
                          return Container(
                              padding: EdgeInsets.only(left: 12, right: 10),
                              width: MediaQuery.of(context).size.width,
                              height: 180,
                              child: LayoutBuilder(
                                builder: (ctx, constraints) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: Alignment(0, -0.95),
                                        children: [
                                          DottedBorder(
                                              color: Color(0xFFC58BF2),
                                              dashPattern: [3, 1],
                                              padding: EdgeInsets.all(0),
                                              child: Container(
                                                height: constraints.maxHeight,
                                                width: 1,
                                              )),
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        width: 2,
                                                        color:
                                                            Color(0xFFC58BF2)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                              ),
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    gradient:
                                                        secondaryLinearGradient,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 40,
                                                padding: EdgeInsets.zero,
                                                margin: EdgeInsets.zero,
                                                child: Text(
                                                  'Step ${workoutStepByStep.indexOf(step) + 1}',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Container(
                                                width: constraints.maxWidth,
                                                height:
                                                    constraints.maxHeight - 40,
                                                child: SingleChildScrollView(
                                                  child: Text(
                                                    step,
                                                    style: TextStyle(
                                                      color: Color(0xFF7B6F72),
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ));
                        }).toList()
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
