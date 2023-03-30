import 'dart:io';

import 'package:flutter/material.dart';

class ImageModal {
  File filepath;
  DateTime imageClickDate;

  ImageModal({required this.filepath, required this.imageClickDate});
}

class WorkoutCategoryByBodyPart {
  String categoryName;
  String searchByName;
  String imageLink;

  WorkoutCategoryByBodyPart(
      {required this.categoryName,
      required this.searchByName,
      required this.imageLink});
}

class SelectedWorkoutModal {
  String exerciseName;
  DateTime workoutDate;
  TimeOfDay workoutTime;
  int notificationID;
  String exerciseDescription;
  int sets;
  int reps;
  String videoID;
  bool isCompleted;
  int totalworkoutDuration;

  SelectedWorkoutModal({
    required this.notificationID,
    required this.exerciseName,
    required this.workoutDate,
    required this.workoutTime,
    required this.exerciseDescription,
    required this.reps,
    this.isCompleted = false,
    required this.sets,
    required this.videoID,
    required this.totalworkoutDuration,
  });
}

class WorkoutCategoryByType {
  String categoryName;
  String searchByName;
  String imageLink;
  WorkoutCategoryByType(
      {required this.categoryName,
      required this.searchByName,
      required this.imageLink});
}

const String SUCCESS_MESSAGE = 'yayyy';

List<WorkoutCategoryByType> WORKOUT_CATEGORY_BY_TYPE = [
  WorkoutCategoryByType(
      categoryName: 'Cardio',
      searchByName: 'cardio',
      imageLink: 'assets/images/cardio.jpg'),
  WorkoutCategoryByType(
      categoryName: 'Strength',
      searchByName: 'strength',
      imageLink: 'assets/images/strength.jpg'),
  WorkoutCategoryByType(
      categoryName: 'Stretching',
      searchByName: 'cardio',
      imageLink: 'assets/images/stretching.png'),
  WorkoutCategoryByType(
      categoryName: 'Powerlifting',
      searchByName: 'cardio',
      imageLink: 'assets/images/powerlifting.jpg'),
  WorkoutCategoryByType(
      categoryName: 'Strongman',
      searchByName: 'strongman',
      imageLink: 'assets/images/strongman.jpg'),
  WorkoutCategoryByType(
      categoryName: 'Plyometrics',
      searchByName: 'plyometrics',
      imageLink: 'assets/images/plyometrics.jpg'),
  WorkoutCategoryByType(
      categoryName: 'Olympic Weightlifting',
      searchByName: 'olympic_weightlifting',
      imageLink: 'assets/images/olympic_weightlifting.jpeg'),
];

List<WorkoutCategoryByBodyPart> WORKOUT_CATEGORY_BY_BODY_PART = [
  WorkoutCategoryByBodyPart(
      categoryName: 'Abdominals',
      searchByName: 'abdominals',
      imageLink: 'assets/images/abdominals.jpg'),
  WorkoutCategoryByBodyPart(
      categoryName: 'Biceps',
      searchByName: 'biceps',
      imageLink: 'assets/images/biceps.jpg'),
  WorkoutCategoryByBodyPart(
      categoryName: 'Calves',
      searchByName: 'calves',
      imageLink: 'assets/images/calves.jpg'),
  WorkoutCategoryByBodyPart(
      categoryName: 'Chest',
      searchByName: 'chest',
      imageLink: 'assets/images/chest.png'),
  WorkoutCategoryByBodyPart(
      categoryName: 'Forearms',
      searchByName: 'forearms',
      imageLink: 'assets/images/forearms.jpg'),
  WorkoutCategoryByBodyPart(
      categoryName: 'Glutes',
      searchByName: 'glutes',
      imageLink: 'assets/images/glutes.jpg'),
  WorkoutCategoryByBodyPart(
      categoryName: 'Lats',
      searchByName: 'lats',
      imageLink: 'assets/images/lats.jpg'),
  WorkoutCategoryByBodyPart(
      categoryName: 'Lower back',
      searchByName: 'lower_back',
      imageLink: 'assets/images/lower_back.jpg'),
  WorkoutCategoryByBodyPart(
      categoryName: 'Middle back',
      searchByName: 'middle_back',
      imageLink: 'assets/images/middle_back.jpg'),
  WorkoutCategoryByBodyPart(
      categoryName: 'Neck',
      searchByName: 'neck',
      imageLink: 'assets/images/neck.jpg'),
  WorkoutCategoryByBodyPart(
      categoryName: 'Quadriceps',
      searchByName: 'quadriceps',
      imageLink: 'assets/images/quadriceps.jpg'),
  WorkoutCategoryByBodyPart(
      categoryName: 'Traps',
      searchByName: 'traps',
      imageLink: 'assets/images/traps.jpg'),
  WorkoutCategoryByBodyPart(
      categoryName: 'Triceps',
      searchByName: 'triceps',
      imageLink: 'assets/images/triceps.jpg'),
];

const List VIDEO_LINKS = [
  [
    {
      "categoryName": 'abdominals',
      "exerciseName": 'Landmine twist',
      "videoLink": 'https://youtu.be/epdBIT32SS0',
    },
    {
      "categoryName": 'abdominals',
      "exerciseName": 'Elbow plank',
      "videoLink": 'https://youtu.be/qmw7-IFVZPo',
    },
    {
      "categoryName": 'abdominals',
      "exerciseName": 'Bottoms Up',
      "videoLink": 'https://youtu.be/hTeMXA_1l5I',
    },
    {
      "categoryName": 'abdominals',
      "exerciseName": 'Suspended ab fall-out',
      "videoLink": 'https://youtu.be/0FAMdxWgFnA',
    },
    {
      "categoryName": 'abdominals',
      "exerciseName": 'Dumbbell V-Sit Cross Jab',
      "videoLink": 'https://youtu.be/k4vFGA7qOb4',
    },
    {
      "categoryName": 'abdominals',
      "exerciseName": 'Standing cable low-to-high twist',
      "videoLink": 'https://youtu.be/rHfjG2Oflz0',
    },
    {
      "categoryName": 'abdominals',
      "exerciseName": 'Dumbbell spell caster',
      "videoLink": 'https://youtu.be/h0QJ1YI20P0',
    },
    {
      "categoryName": 'abdominals',
      "exerciseName": 'Decline reverse crunch',
      "videoLink": 'https://youtu.be/YcMj0EEadQo',
    },
    {
      "categoryName": 'abdominals',
      "exerciseName": 'Spider crawl',
      "videoLink": 'https://youtu.be/2Jczv6yuV_Y',
    },
    {
      "categoryName": 'abdominals',
      "exerciseName": 'Cocoons',
      "videoLink": 'https://youtu.be/anSY8wZtnqk',
    },
  ],
  [
    {
      "categoryName": 'biceps',
      "exerciseName": 'Incline Hammer Curls',
      "videoLink": 'https://youtu.be/cbRSu8Ws_hs',
    },
    {
      "categoryName": 'biceps',
      "exerciseName": 'Wide-grip barbell curl',
      "videoLink": 'https://youtu.be/jnfveKq1i3E',
    },
    {
      "categoryName": 'biceps',
      "exerciseName": 'EZ-bar spider curl',
      "videoLink": 'https://youtu.be/-4RNtxT0LwM',
    },
    {
      "categoryName": 'biceps',
      "exerciseName": 'Hammer Curls',
      "videoLink": 'https://youtu.be/TwD-YGVP4Bk',
    },
    {
      "categoryName": 'biceps',
      "exerciseName": 'EZ-Bar Curl',
      "videoLink": 'https://youtu.be/kwG2ipFRgfo',
    },
    {
      "categoryName": 'biceps',
      "exerciseName": 'Zottman Curl',
      "videoLink": 'https://youtu.be/ZrpRBgswtHs',
    },
    {
      "categoryName": 'biceps',
      "exerciseName": 'Biceps curl to shoulder press',
      "videoLink": 'https://youtu.be/22dN1hdBqk0',
    },
    {
      "categoryName": 'biceps',
      "exerciseName": 'Barbell Curl',
      "videoLink": 'https://youtu.be/kwG2ipFRgfo',
    },
    {
      "categoryName": 'biceps',
      "exerciseName": 'Concentration curl',
      "videoLink": 'https://youtu.be/0AUGkch3tzc',
    },
    {
      "categoryName": 'biceps',
      "exerciseName": 'Flexor Incline Dumbbell Curls',
      "videoLink": 'https://youtu.be/9nQTmJbjirM',
    },
  ],
  [
    {
      "categoryName": 'calves',
      "exerciseName": 'Smith Machine Calf Raise',
      "videoLink": 'https://youtu.be/avO_qtvHJAg',
    },
    {
      "categoryName": 'calves',
      "exerciseName": 'Standing Calf Raises',
      "videoLink": 'https://youtu.be/k8ipHzKeAkQ',
    },
    {
      "categoryName": 'calves',
      "exerciseName": 'Seated Calf Raise',
      "videoLink": 'https://youtu.be/JbyjNymZOt0',
    },
    {
      "categoryName": 'calves',
      "exerciseName": 'Calf Press On The Leg Press Machine',
      "videoLink": 'https://youtu.be/Hu8i9d_IgpM',
    },
    {
      "categoryName": 'calves',
      "exerciseName": 'Rocking Standing Calf Raise',
      "videoLink": 'https://youtu.be/Gu4I8EaTy1I',
    },
    {
      "categoryName": 'calves',
      "exerciseName": 'Calf Press',
      "videoLink": 'https://youtu.be/D-jcJWDdbbU',
    },
    {
      "categoryName": 'calves',
      "exerciseName": 'Standing barbell calf raise',
      "videoLink": 'https://youtu.be/3UWi44yN-wM',
    },
    {
      "categoryName": 'calves',
      "exerciseName": 'Barbell Seated Calf Raise',
      "videoLink": 'https://youtu.be/o9XGa9ozKB0',
    },
    {
      "categoryName": 'calves',
      "exerciseName": 'Balance Board',
      "videoLink": 'https://youtu.be/DK6NZfa3-a8',
    },
    {
      "categoryName": 'calves',
      "exerciseName": 'Weighted donkey calf raise',
      "videoLink": 'https://youtu.be/r30EoMPSNns',
    },
  ],
  [
    {
      "categoryName": 'chest',
      "exerciseName": 'Dumbbell Bench Press',
      "videoLink": 'https://youtu.be/Y_7aHqXeCfQ',
    },
    {
      "categoryName": 'chest',
      "exerciseName": 'Pushups',
      "videoLink": 'https://youtu.be/IODxDxX7oi4',
    },
    {
      "categoryName": 'chest',
      "exerciseName": 'Close-grip bench press',
      "videoLink": 'https://youtu.be/wxVRe9pmJdk',
    },
    {
      "categoryName": 'chest',
      "exerciseName": 'Dumbbell Flyes',
      "videoLink": 'https://youtu.be/QENKPHhQVi4',
    },
    {
      "categoryName": 'chest',
      "exerciseName": 'Incline dumbbell bench press',
      "videoLink": 'https://youtu.be/IP4oeKh1Sd4',
    },
    {
      "categoryName": 'chest',
      "exerciseName": 'Low-cable cross-over',
      "videoLink": 'https://youtu.be/77UbTnqvVzE',
    },
    {
      "categoryName": 'chest',
      "exerciseName": 'Barbell Bench Press - Medium Grip',
      "videoLink": 'https://youtu.be/RsobeWfbBcY',
    },
    {
      "categoryName": 'chest',
      "exerciseName": 'Chest dip',
      "videoLink": 'https://youtu.be/dX_nSOOJIsE',
    },
    {
      "categoryName": 'chest',
      "exerciseName": 'Decline Dumbbell Flyes',
      "videoLink": 'https://youtu.be/ilcbmIoz9S4',
    },
    {
      "categoryName": 'chest',
      "exerciseName": 'Bodyweight Flyes',
      "videoLink": 'https://youtu.be/u4r5AyRUwfo',
    },
  ],
  [
    {
      "categoryName": 'forearms',
      "exerciseName": 'Rickshaw Carry',
      "videoLink": 'https://youtu.be/pRkHLluG-V8',
    },
    {
      "categoryName": 'forearms',
      "exerciseName": 'Palms-down wrist curl over bench',
      "videoLink": 'https://youtu.be/sf9c-iQxRzw',
    },
    {
      "categoryName": 'forearms',
      "exerciseName": 'Straight-bar wrist roll-up',
      "videoLink": 'https://youtu.be/lpqSgebi65k',
    },
    {
      "categoryName": 'forearms',
      "exerciseName": "Dumbbell farmer's walk",
      "videoLink": 'https://youtu.be/nqGfgIVteoM',
    },
    {
      "categoryName": 'forearms',
      "exerciseName": 'Palms-up wrist curl over bench',
      "videoLink": 'https://youtu.be/dQtMZ3ZEGwU',
    },
    {
      "categoryName": 'forearms',
      "exerciseName": 'Standing behind-the-back wrist curl',
      "videoLink": 'https://youtu.be/DqfHN3wV8aA',
    },
    {
      "categoryName": 'forearms',
      "exerciseName": 'Seated finger curl',
      "videoLink": 'https://youtu.be/mp61xNRZcrk',
    },
    {
      "categoryName": 'forearms',
      "exerciseName": 'Seated Two-Arm Palms-Up Low-Pulley Wrist Curl',
      "videoLink": 'https://youtu.be/YcXTlq3E3as',
    },
    {
      "categoryName": 'forearms',
      "exerciseName": 'Wrist Roller',
      "videoLink": 'https://youtu.be/-lOFG0U_rlY',
    },
    {
      "categoryName": 'forearms',
      "exerciseName": 'Seated One-Arm Dumbbell Palms-Up Wrist Curl',
      "videoLink": 'https://youtu.be/Q7dTbE4kRUY',
    },
  ],
  [
    {
      "categoryName": 'glutes',
      "exerciseName": 'Barbell glute bridge',
      "videoLink": 'https://youtu.be/ylpfCk3i-0Y',
    },
    {
      "categoryName": 'glutes',
      "exerciseName": 'Barbell Hip Thrust',
      "videoLink": 'https://youtu.be/L1qG25DhAk4',
    },
    {
      "categoryName": 'glutes',
      "exerciseName": 'Single-leg cable hip extension',
      "videoLink": 'https://youtu.be/f3ebTCWwOwg',
    },
    {
      "categoryName": 'glutes',
      "exerciseName": 'Glute bridge',
      "videoLink": 'https://youtu.be/Q_Bpj91Yiis',
    },
    {
      "categoryName": 'glutes',
      "exerciseName": 'Single-leg glute bridge',
      "videoLink": 'https://youtu.be/AVAXhy6pl7o',
    },
    {
      "categoryName": 'glutes',
      "exerciseName": 'Step-up with knee raise',
      "videoLink": 'https://youtu.be/WIOWBm4gZF0',
    },
    {
      "categoryName": 'glutes',
      "exerciseName": 'Kettlebell thruster',
      "videoLink": 'https://youtu.be/Ze3wxz5T640',
    },
    {
      "categoryName": 'glutes',
      "exerciseName": 'Kneeling Squat',
      "videoLink": 'https://youtu.be/5sP48cwKhis',
    },
    {
      "categoryName": 'glutes',
      "exerciseName": 'Flutter Kicks',
      "videoLink": 'https://youtu.be/ANVdMDaYRts',
    },
    {
      "categoryName": 'glutes',
      "exerciseName": 'Glute Kickback',
      "videoLink": 'https://youtu.be/BNDw4ciQoQI',
    },
  ],
  [
    {
      "categoryName": 'hamstrings',
      "exerciseName": 'Barbell Deadlift',
      "videoLink": 'https://youtu.be/ytGaGIn3SjE',
    },
    {
      "categoryName": 'hamstrings',
      "exerciseName": 'Romanian Deadlift With Dumbbells',
      "videoLink": 'https://youtu.be/hQgFixeXdZo',
    },
    {
      "categoryName": 'hamstrings',
      "exerciseName": 'Clean Deadlift',
      "videoLink": 'https://youtu.be/NU9rfvSyEhc',
    },
    {
      "categoryName": 'hamstrings',
      "exerciseName": 'Sumo deadlift',
      "videoLink": 'https://youtu.be/cDlOSfu-zHY',
    },
    {
      "categoryName": 'hamstrings',
      "exerciseName": 'Romanian Deadlift from Deficit',
      "videoLink": 'https://youtu.be/XLCOasfz1uI',
    },
    {
      "categoryName": 'hamstrings',
      "exerciseName": 'Power Snatch',
      "videoLink": 'https://youtu.be/eZvy51ucmOc',
    },
    {
      "categoryName": 'hamstrings',
      "exerciseName": 'Power Clean from Blocks',
      "videoLink": 'https://youtu.be/V9PKZX8nbw8',
    },
    {
      "categoryName": 'hamstrings',
      "exerciseName": 'Natural Glute Ham Raise',
      "videoLink": 'https://youtu.be/9xSDFVCg2DM',
    },
    {
      "categoryName": 'hamstrings',
      "exerciseName": 'Glute ham raise-',
      "videoLink": 'https://youtu.be/w_7UaXfsbaw',
    },
    {
      "categoryName": 'hamstrings',
      "exerciseName": 'Snatch Deadlift',
      "videoLink": 'https://youtu.be/9DCvbA4Dwbg',
    },
  ],
  [
    {
      "categoryName": 'lats',
      "exerciseName": 'Weighted pull-up',
      "videoLink": 'https://youtu.be/HuuyDNGrCI8',
    },
    {
      "categoryName": 'lats',
      "exerciseName": 'Pullups',
      "videoLink": 'https://youtu.be/eGo4IYlbE5g',
    },
    {
      "categoryName": 'lats',
      "exerciseName": 'Rocky Pull-Ups/Pulldowns',
      "videoLink": 'https://youtu.be/OBJl9qHZe0E',
    },
    {
      "categoryName": 'lats',
      "exerciseName": 'Close-grip pull-down',
      "videoLink": 'https://youtu.be/ecRF8ERf2q4',
    },
    {
      "categoryName": 'lats',
      "exerciseName": 'Pull-up',
      "videoLink": 'https://youtu.be/eGo4IYlbE5g',
    },
    {
      "categoryName": 'lats',
      "exerciseName": 'Muscle Up',
      "videoLink": 'https://youtu.be/_iYvlSMgUGE',
    },
    {
      "categoryName": 'lats',
      "exerciseName": 'Shotgun row',
      "videoLink": 'https://youtu.be/hZzJJ0HJbvw',
    },
    {
      "categoryName": 'lats',
      "exerciseName": 'Close-Grip Front Lat Pulldown',
      "videoLink": 'https://youtu.be/ecRF8ERf2q4',
    },
    {
      "categoryName": 'lats',
      "exerciseName": 'V-bar pull-up',
      "videoLink": 'https://youtu.be/nYXp42TPh_w',
    },
    {
      "categoryName": 'lats',
      "exerciseName": 'Rope climb',
      "videoLink": 'https://youtu.be/9DCvbA4Dwbg',
    },
  ],
  [
    {
      "categoryName": 'lower_back',
      "exerciseName": 'Atlas Stones',
      "videoLink": 'https://youtu.be/LZCm3mU2GhE',
    },
    {
      "categoryName": 'lower_back',
      "exerciseName": 'Barbell deficit deadlift',
      "videoLink": 'https://youtu.be/CpWsUsqBtN8',
    },
    {
      "categoryName": 'lower_back',
      "exerciseName": 'Back extension',
      "videoLink": 'https://youtu.be/ph3pddpKzzw',
    },
    {
      "categoryName": 'lower_back',
      "exerciseName": 'Axle Deadlift',
      "videoLink": 'https://youtu.be/DA1IwrELPUc',
    },
    {
      "categoryName": 'lower_back',
      "exerciseName": 'Hyperextensions With No Hyperextension Bench',
      "videoLink": 'https://youtu.be/ojsRo2FDCww',
    },
    {
      "categoryName": 'lower_back',
      "exerciseName": 'Deadlift with Bands',
      "videoLink": 'https://youtu.be/gUhTvDJQ0Rw',
    },
    {
      "categoryName": 'lower_back',
      "exerciseName": 'Deadlift with Chains',
      "videoLink": 'https://youtu.be/lsmGGj8H-BI',
    },
    {
      "categoryName": 'lower_back',
      "exerciseName": 'Rack Pull with Bands',
      "videoLink": 'https://youtu.be/DfoTP5hKedo',
    },
    {
      "categoryName": 'lower_back',
      "exerciseName": 'Superman',
      "videoLink": 'https://youtu.be/cZxtPxeR2H8',
    },
  ],
  [
    {
      "categoryName": 'middle_back',
      "exerciseName": 'T-Bar Row with Handle',
      "videoLink": 'https://youtu.be/KDEl3AmZbVE',
    },
    {
      "categoryName": 'middle_back',
      "exerciseName": 'Reverse-grip bent-over row',
      "videoLink": 'https://youtu.be/3gdGSSgDby8',
    },
    {
      "categoryName": 'middle_back',
      "exerciseName": 'One-Arm Dumbbell Row',
      "videoLink": 'https://youtu.be/roCP6wCXPqo',
    },
    {
      "categoryName": 'middle_back',
      "exerciseName": 'One-Arm Long Bar Row',
      "videoLink": 'https://youtu.be/Biu_akIOyHc',
    },
    {
      "categoryName": 'middle_back',
      "exerciseName": 'T-Bar Row',
      "videoLink": 'https://youtu.be/j3Igk5nyZE4',
    },
    {
      "categoryName": 'middle_back',
      "exerciseName": 'Bent Over Two-Arm Long Bar Row',
      "videoLink": 'https://youtu.be/e8YF8Z_N0-4',
    },
    {
      "categoryName": 'middle_back',
      "exerciseName": 'Alternating sit-through with crunch',
      "videoLink": 'https://youtu.be/DKbsS9zU9bo',
    },
    {
      "categoryName": 'middle_back',
      "exerciseName": 'Rower',
      "videoLink": 'https://youtu.be/w2hGNM4l5so',
    },
    {
      "categoryName": 'middle_back',
      "exerciseName": 'Seated Cable Rows',
      "videoLink": 'https://youtu.be/sP_4vybjVJs',
    },
    {
      "categoryName": 'middle_back',
      "exerciseName": 'Incline dumbbell row',
      "videoLink": 'https://youtu.be/2LxN3_3atps',
    },
  ],
  [
    {
      "categoryName": 'neck',
      "exerciseName": 'Lying Face Down Plate Neck Resistance',
      "videoLink": 'https://youtu.be/jg3Q7bkabu4',
    },
    {
      "categoryName": 'neck',
      "exerciseName": 'Lying Face Up Plate Neck Resistance',
      "videoLink": 'https://youtu.be/FEhWKplAe1U',
    },
    {
      "categoryName": 'neck',
      "exerciseName": 'Seated Head Harness Neck Resistance',
      "videoLink": 'https://youtu.be/lqCumM-_MXE',
    },
    {
      "categoryName": 'neck',
      "exerciseName": 'Isometric Neck Exercise - Sides',
      "videoLink": 'https://youtu.be/3Owy1hurobA',
    },
    {
      "categoryName": 'neck',
      "exerciseName": 'Isometric Neck Exercise - Front And Back',
      "videoLink": 'https://youtu.be/PSwHo-kcfhc',
    },
    {
      "categoryName": 'neck',
      "exerciseName": 'Neck Bridge Prone',
      "videoLink": 'https://youtu.be/Rs5Qf6PsqB8',
    },
    {
      "categoryName": 'neck',
      "exerciseName": 'Side Neck Stretch',
      "videoLink": 'https://youtu.be/54y0JAT46vE',
    },
    {
      "categoryName": 'neck',
      "exerciseName": 'Chin To Chest Stretch',
      "videoLink": 'https://youtu.be/GjS3i2-BlxA',
    },
    {
      "categoryName": 'neck',
      "exerciseName": 'Neck-SMR',
      "videoLink": 'https://youtu.be/dbHVqG5t0Ig',
    },
  ],
  [
    {
      "categoryName": 'quadriceps',
      "exerciseName": 'Single-Leg Press',
      "videoLink": 'https://youtu.be/ZYDTJaAM-gE',
    },
    {
      "categoryName": 'quadriceps',
      "exerciseName": 'Clean from Blocks',
      "videoLink": 'https://youtu.be/FbtOYhvlQrw',
    },
    {
      "categoryName": 'quadriceps',
      "exerciseName": 'Barbell Full Squat',
      "videoLink": 'https://youtu.be/W7pj9LP7gJ8',
    },
    {
      "categoryName": 'quadriceps',
      "exerciseName": 'Tire flip',
      "videoLink": 'https://youtu.be/aEL9f81F8Do',
    },
    {
      "categoryName": 'quadriceps',
      "exerciseName": 'Barbell back squat to box',
      "videoLink": 'https://youtu.be/nBc_2Jyp3tM',
    },
    {
      "categoryName": 'quadriceps',
      "exerciseName": 'Push-press',
      "videoLink": 'https://youtu.be/9-sGJjjMOpI',
    },
    {
      "categoryName": 'quadriceps',
      "exerciseName": 'Power snatch-',
      "videoLink": 'https://youtu.be/eZvy51ucmOc',
    },
    {
      "categoryName": 'quadriceps',
      "exerciseName": 'Hang Clean',
      "videoLink": 'https://youtu.be/WCdhjfg7fv4',
    },
    {
      "categoryName": 'quadriceps',
      "exerciseName": 'Reverse Band Box Squat',
      "videoLink": 'https://youtu.be/V8nEMucUjZE',
    },
    {
      "categoryName": 'quadriceps',
      "exerciseName": 'Jumping rope',
      "videoLink": 'https://youtu.be/u3zgHI8QnqE',
    },
  ],
  [
    {
      "categoryName": 'traps',
      "exerciseName": 'Smith machine shrug',
      "videoLink": 'https://youtu.be/S9lw1zg8rco',
    },
    {
      "categoryName": 'traps',
      "exerciseName": 'Leverage Shrug',
      "videoLink": 'https://youtu.be/n8jZK0VsYVY',
    },
    {
      "categoryName": 'traps',
      "exerciseName": 'Standing dumbbell shrug',
      "videoLink": 'https://youtu.be/g6qbq4Lf1FI',
    },
    {
      "categoryName": 'traps',
      "exerciseName": 'Standing dumbbell upright row',
      "videoLink": 'https://youtu.be/IhZLB48kluc',
    },
    {
      "categoryName": 'traps',
      "exerciseName": 'Kettlebell sumo deadlift high pull',
      "videoLink": 'https://youtu.be/xF3Lf_7r1-Y',
    },
    {
      "categoryName": 'traps',
      "exerciseName": 'Calf-Machine Shoulder Shrug',
      "videoLink": 'https://youtu.be/8Qla9t5I8rc',
    },
    {
      "categoryName": 'traps',
      "exerciseName": 'Barbell shrug',
      "videoLink": 'https://youtu.be/NAqCVe2mwzM',
    },
    {
      "categoryName": 'traps',
      "exerciseName": 'Barbell behind-the-back shrug',
      "videoLink": 'https://youtu.be/VJyLJAGjptA',
    },
  ],
  [
    {
      "categoryName": 'triceps',
      "exerciseName": 'Triceps dip',
      "videoLink": 'https://youtu.be/6kALZikXxLc',
    },
    {
      "categoryName": 'triceps',
      "exerciseName": 'Decline EZ-bar skullcrusher',
      "videoLink": 'https://youtu.be/d_KZxkY_0cM',
    },
    {
      "categoryName": 'triceps',
      "exerciseName": 'Dumbbell floor press',
      "videoLink": 'https://youtu.be/lNdi7VEf2Ew',
    },
    {
      "categoryName": 'triceps',
      "exerciseName": 'Cable V-bar push-down',
      "videoLink": 'https://youtu.be/nNX-UJjatF0',
    },
    {
      "categoryName": 'triceps',
      "exerciseName": 'Weighted bench dip',
      "videoLink": 'https://youtu.be/egQiO0K-BEw',
    },
    {
      "categoryName": 'triceps',
      "exerciseName": 'EZ-Bar Skullcrusher',
      "videoLink": 'https://youtu.be/d_KZxkY_0cM',
    },
    {
      "categoryName": 'triceps',
      "exerciseName": 'Reverse Grip Triceps Pushdown',
      "videoLink": 'https://youtu.be/2668NKYmls4',
    },
    {
      "categoryName": 'triceps',
      "exerciseName": 'Push-Ups - Close Triceps Position',
      "videoLink": 'https://youtu.be/8d6XytUQO8s',
    },
    {
      "categoryName": 'triceps',
      "exerciseName": 'Kneeling cable triceps extension',
      "videoLink": 'https://youtu.be/E_uhLao7mEQ',
    },
    {
      "categoryName": 'triceps',
      "exerciseName": 'Single-arm cable triceps extension',
      "videoLink": 'https://youtu.be/8rl4ioij6lc',
    },
  ],
  [
    {
      "categoryName": 'cardio',
      "exerciseName": 'Jumping rope',
      "videoLink": 'https://youtu.be/u3zgHI8QnqE',
    },
    {
      "categoryName": 'cardio',
      "exerciseName": 'Stair climber',
      "videoLink": 'https://youtu.be/xSB39wbMz4w',
    },
    {
      "categoryName": 'cardio',
      "exerciseName": 'Bicycling',
      "videoLink": 'https://youtu.be/jhPqTyejY_0',
    },
    {
      "categoryName": 'cardio',
      "exerciseName": 'Rower',
      "videoLink": 'https://youtu.be/w2hGNM4l5so',
    },
    {
      "categoryName": 'cardio',
      "exerciseName": 'Elliptical trainer',
      "videoLink": 'https://youtu.be/EesEvYohy5o',
    },
    {
      "categoryName": 'cardio',
      "exerciseName": 'Stairmaster',
      "videoLink": 'https://youtu.be/xSB39wbMz4w',
    },
    {
      "categoryName": 'cardio',
      "exerciseName": 'Burpee',
      "videoLink": 'https://youtu.be/NCqbpkoiyXE',
    },
    {
      "categoryName": 'cardio',
      "exerciseName": 'Trail Running/Walking',
      "videoLink": 'https://youtu.be/mUJmt1WsnYo',
    },
    {
      "categoryName": 'cardio',
      "exerciseName": 'Skating',
      "videoLink": 'https://youtu.be/-We8_Bbr7y8',
    },
  ],
  [
    {
      "categoryName": 'olympic_weightlifting',
      "exerciseName": 'Clean from Blocks',
      "videoLink": 'https://youtu.be/FbtOYhvlQrw',
    },
    {
      "categoryName": 'olympic_weightlifting',
      "exerciseName": 'Clean Deadlift',
      "videoLink": 'https://youtu.be/NU9rfvSyEhc',
    },
    {
      "categoryName": 'olympic_weightlifting',
      "exerciseName": 'Clean and jerk',
      "videoLink": 'https://youtu.be/9HyWjAk7fhY',
    },
    {
      "categoryName": 'Push-press',
      "exerciseName": 'Clean from Blocks',
      "videoLink": 'https://youtu.be/9-sGJjjMOpI',
    },
    {
      "categoryName": 'olympic_weightlifting',
      "exerciseName": 'Power snatch-',
      "videoLink": 'https://youtu.be/eZvy51ucmOc',
    },
    {
      "categoryName": 'olympic_weightlifting',
      "exerciseName": 'Hang Clean',
      "videoLink": 'https://youtu.be/WCdhjfg7fv4',
    },
    {
      "categoryName": 'olympic_weightlifting',
      "exerciseName": 'Romanian Deadlift from Deficit',
      "videoLink": 'https://youtu.be/XLCOasfz1uI',
    },
    {
      "categoryName": 'olympic_weightlifting',
      "exerciseName": 'Power Snatch',
      "videoLink": 'https://youtu.be/eZvy51ucmOc',
    },
    {
      "categoryName": 'olympic_weightlifting',
      "exerciseName": 'Power Clean from Blocks',
      "videoLink": 'https://youtu.be/V9PKZX8nbw8',
    },
  ],
  [
    {
      "categoryName": 'plyometrics',
      "exerciseName": 'Single Leg Push-off',
      "videoLink": 'https://youtu.be/AI2bnCEtcyY',
    },
    {
      "categoryName": 'plyometrics',
      "exerciseName": 'Side-to-side box skip',
      "videoLink": 'https://youtu.be/oQFykYI4pRM',
    },
    {
      "categoryName": 'plyometrics',
      "exerciseName": 'Mountain climber',
      "videoLink": 'https://youtu.be/cnyTQDSE884',
    },
    {
      "categoryName": 'plyometrics',
      "exerciseName": 'Drop Push',
      "videoLink": 'https://youtu.be/r6lWzFAUGaA',
    },
    {
      "categoryName": 'plyometrics',
      "exerciseName": 'Double Leg Butt Kick',
      "videoLink": 'https://youtu.be/emXqf9WxkqU',
    },
    {
      "categoryName": 'plyometrics',
      "exerciseName": 'Broad jump',
      "videoLink": 'https://youtu.be/96zJo3nlmHI',
    },
    {
      "categoryName": 'plyometrics',
      "exerciseName": 'Sledgehammer swing',
      "videoLink": 'https://youtu.be/UkKA9SMevcM',
    },
    {
      "categoryName": 'plyometrics',
      "exerciseName": 'Box jump',
      "videoLink": 'https://youtu.be/TPJhsE0QeD8',
    },
    {
      "categoryName": 'plyometrics',
      "exerciseName": 'Scissors Jump',
      "videoLink": 'https://youtu.be/5VlnYBz64Pg',
    },
    {
      "categoryName": 'plyometrics',
      "exerciseName": 'Jumping jack-',
      "videoLink": 'https://youtu.be/iSSAk4XCsRA',
    },
  ],
  [
    {
      "categoryName": 'powerlifting',
      "exerciseName": 'Barbell glute bridge',
      "videoLink": 'https://youtu.be/ylpfCk3i-0Y',
    },
    {
      "categoryName": 'powerlifting',
      "exerciseName": 'Barbell deficit deadlift',
      "videoLink": 'https://youtu.be/CpWsUsqBtN8',
    },
    {
      "categoryName": 'powerlifting',
      "exerciseName": 'Barbell back squat to box',
      "videoLink": 'https://youtu.be/nBc_2Jyp3tM',
    },
    {
      "categoryName": 'powerlifting',
      "exerciseName": 'Sumo deadlift',
      "videoLink": 'https://youtu.be/cDlOSfu-zHY',
    },
    {
      "categoryName": 'powerlifting',
      "exerciseName": 'Reverse Band Box Squat',
      "videoLink": 'https://youtu.be/V8nEMucUjZE',
    },
    {
      "categoryName": 'powerlifting',
      "exerciseName": 'Dumbbell floor press',
      "videoLink": 'https://youtu.be/lNdi7VEf2Ew',
    },
    {
      "categoryName": 'powerlifting',
      "exerciseName": 'Barbell Hip Thrust',
      "videoLink": 'https://youtu.be/L1qG25DhAk4',
    },
    {
      "categoryName": 'powerlifting',
      "exerciseName": 'Box Squat with Bands',
      "videoLink": 'https://youtu.be/zwa-VtaB4S0',
    },
    {
      "categoryName": 'powerlifting',
      "exerciseName": 'Squat with Chains',
      "videoLink": 'https://youtu.be/HNJgF6dOBbc',
    },
    {
      "categoryName": 'powerlifting',
      "exerciseName": 'Deadlift with Bands',
      "videoLink": 'https://youtu.be/gUhTvDJQ0Rw',
    },
  ],
  [
    {
      "categoryName": 'strength',
      "exerciseName": 'Single-Leg Press',
      "videoLink": 'https://youtu.be/ZYDTJaAM-gE',
    },
    {
      "categoryName": 'strength',
      "exerciseName": 'Landmine twist',
      "videoLink": 'https://youtu.be/epdBIT32SS0',
    },
    {
      "categoryName": 'strength',
      "exerciseName": 'Weighted pull-up',
      "videoLink": 'https://youtu.be/HuuyDNGrCI8',
    },
    {
      "categoryName": 'strength',
      "exerciseName": 'T-Bar Row with Handle',
      "videoLink": 'https://youtu.be/KDEl3AmZbVE',
    },
    {
      "categoryName": 'strength',
      "exerciseName": 'Palms-down wrist curl over bench',
      "videoLink": 'https://youtu.be/sf9c-iQxRzw',
    },
    {
      "categoryName": 'strength',
      "exerciseName": 'Dumbbell front raise to lateral raise',
      "videoLink": 'https://youtu.be/SqTLytmDy_8',
    },
    {
      "categoryName": 'strength',
      "exerciseName": 'Incline Hammer Curls',
      "videoLink": 'https://youtu.be/cbRSu8Ws_hs',
    },
    {
      "categoryName": 'strength',
      "exerciseName": 'Straight-bar wrist roll-up',
      "videoLink": 'https://youtu.be/lpqSgebi65k',
    },
    {
      "categoryName": 'strength',
      "exerciseName": 'Clean and press',
      "videoLink": 'https://youtu.be/9lSjbxkjCqU',
    },
    {
      "categoryName": 'strength',
      "exerciseName": 'Triceps dip',
      "videoLink": 'https://youtu.be/6kALZikXxLc',
    },
  ],
  [
    {
      "categoryName": 'stretching',
      "exerciseName": 'Hip Circles (Prone)',
      "videoLink": 'https://youtu.be/7kWiUfAFess',
    },
    {
      "categoryName": 'stretching',
      "exerciseName": 'Standing Hip Circles',
      "videoLink": 'https://youtu.be/OvJMG4_nMFc',
    },
    {
      "categoryName": 'stretching',
      "exerciseName": 'Groiners',
      "videoLink": 'https://youtu.be/RSMWpaY_iaQ',
    },
    {
      "categoryName": 'stretching',
      "exerciseName": 'Stomach Vacuum',
      "videoLink": 'https://youtu.be/wiHMum-4nHU',
    },
    {
      "categoryName": 'stretching',
      "exerciseName": 'Side Wrist Pull',
      "videoLink": 'https://youtu.be/9RXXlkJxw2k',
    },
    {
      "categoryName": 'stretching',
      "exerciseName": 'Standing leg swing',
      "videoLink": 'https://youtu.be/hxKfZlW1rys',
    },
    {
      "categoryName": 'stretching',
      "exerciseName": 'Superman',
      "videoLink": 'https://youtu.be/cZxtPxeR2H8',
    },
    {
      "categoryName": 'stretching',
      "exerciseName": 'Iliotibial band SMR',
      "videoLink": 'https://youtu.be/_JTKoCtGAtg',
    },
    {
      "categoryName": 'stretching',
      "exerciseName": 'Windmills',
      "videoLink": 'https://youtu.be/5i79T19L2gE',
    },
    {
      "categoryName": 'stretching',
      "exerciseName": 'Leg-Up Hamstring Stretch',
      "videoLink": 'https://youtu.be/S3JasuboLQc',
    },
  ],
  [
    {
      "categoryName": 'strongman',
      "exerciseName": 'Rickshaw Carry',
      "videoLink": 'https://youtu.be/pRkHLluG-V8',
    },
    {
      "categoryName": 'strongman',
      "exerciseName": 'Atlas Stones',
      "videoLink": 'https://youtu.be/LZCm3mU2GhE',
    },
    {
      "categoryName": 'strongman',
      "exerciseName": "Dumbbell farmer's walk",
      "videoLink": 'https://youtu.be/nqGfgIVteoM',
    },
    {
      "categoryName": 'strongman',
      "exerciseName": 'Tire flip',
      "videoLink": 'https://youtu.be/aEL9f81F8Do',
    },
    {
      "categoryName": 'strongman',
      "exerciseName": 'Axle Deadlift',
      "videoLink": 'https://youtu.be/DA1IwrELPUc',
    },
    {
      "categoryName": 'strongman',
      "exerciseName": 'Bear crawl sled drag',
      "videoLink": 'https://youtu.be/PpQFyr4IBjw',
    },
    {
      "categoryName": 'strongman',
      "exerciseName": 'Yoke Walk',
      "videoLink": 'https://youtu.be/zRsFkNPxaMM',
    },
    {
      "categoryName": 'strongman',
      "exerciseName": 'Circus Bell',
      "videoLink": 'https://youtu.be/aaQoWXfnddE',
    },
    {
      "categoryName": 'strongman',
      "exerciseName": 'Backward Drag',
      "videoLink": 'https://youtu.be/1pNjZiU4fhs',
    },
    {
      "categoryName": 'strongman',
      "exerciseName": 'Sled Push',
      "videoLink": 'https://youtu.be/QaTrePoCT4g',
    },
  ]
];

const List CATEGORY_DESCRIPTION = [
  {
    'categoryName': 'cardio',
    'categoryDescription':
        'Cardiovascular exercises, also known as cardio exercises, are a great way to improve your overall health and fitness. By increasing your heart rate and breathing rate, cardio exercises help strengthen your heart muscle, making it more efficient at pumping blood throughout your body. This, in turn, can lower your risk of developing heart disease and other cardiovascular problems. Regular cardio exercise can also help you build endurance and improve your stamina, allowing you to engage in physical activities for longer periods of time without feeling fatigued. Additionally, cardio exercises can help you lose weight by increasing your metabolism and burning fat. By incorporating regular cardio workouts into your routine, you can enjoy a wide range of health benefits and improve your quality of life.',
  },
  {
    'categoryName': 'olympic_weightlifting',
    'categoryDescription':
        'Olympic weightlifting exercises, such as the snatch and the clean and jerk, are a type of strength training that focus on lifting heavy weights quickly and explosively. These exercises offer numerous benefits for people of all fitness levels. First, Olympic weightlifting exercises help improve overall strength and power, making them an excellent choice for athletes looking to enhance their performance. Additionally, these exercises can help build lean muscle mass, increase bone density, and improve overall body composition. Olympic weightlifting exercises also require a high level of skill and technique, making them a fun and challenging addition to any fitness routine. With consistent training and proper form, Olympic weightlifting exercises can help improve physical performance and overall health.',
  },
  {
    'categoryName': 'plyometrics',
    'categoryDescription':
        'Plyometric exercises are a type of training that involves explosive movements, such as jumping and hopping. These exercises aim to improve speed, power, and agility, making them popular among athletes. Plyometrics can benefit people of all fitness levels by improving overall physical performance and reducing the risk of injury. They can help increase bone density and muscle strength, leading to improved balance and coordination. Additionally, plyometrics can help burn calories and aid in weight loss. Because these exercises are high-impact, it\'s important to start with low-impact variations and gradually progress to more advanced movements. With consistent training, plyometrics can help improve athletic performance and overall physical fitness.',
  },
  {
    'categoryName': 'powerlifting',
    'categoryDescription':
        'Powerlifting exercises are a form of strength training that involves three main lifts: the squat, bench press, and deadlift. These exercises are designed to improve overall strength and power, making them popular among athletes and fitness enthusiasts. Powerlifting can benefit people of all fitness levels by improving muscle mass and bone density, reducing the risk of injury, and improving overall physical performance. These exercises require a high level of technique and form, making them a fun and challenging addition to any workout routine. Additionally, powerlifting can help increase metabolism and aid in weight loss. With consistent training and proper form, powerlifting can help improve physical performance and overall health.',
  },
  {
    'categoryName': 'strength',
    'categoryDescription':
        'Strength exercises, also known as resistance or weight training, involve using external resistance to build and maintain muscular strength and endurance. Regular strength training provides numerous benefits, such as increasing bone density, improving balance and stability, reducing the risk of injury, enhancing overall body composition, and boosting metabolism. It also helps in reducing the risk of chronic diseases such as type 2 diabetes, heart disease, and obesity. By challenging your muscles to work against resistance, you can improve your overall physical performance and increase your ability to perform daily activities with ease. Additionally, strength training has mental health benefits, including improving mood and reducing anxiety and depression. Overall, incorporating strength exercises into your fitness routine can lead to a healthier, stronger, and more confident you.',
  },
  {
    'categoryName': 'stretching',
    'categoryDescription':
        'Stretching exercises involve moving the body into various positions to increase flexibility, improve range of motion, and relieve muscle tension. Regular stretching has numerous benefits, such as reducing the risk of injury by preparing the muscles for physical activity, improving posture, reducing muscle soreness, and enhancing overall athletic performance. Stretching also helps to increase blood flow and circulation to the muscles, which can reduce muscle stiffness and promote relaxation. Additionally, stretching has mental health benefits, such as reducing stress and anxiety levels, promoting relaxation, and improving overall mood. Incorporating stretching exercises into your fitness routine can help to improve overall physical and mental well-being, leading to a more flexible, relaxed, and energized you.',
  },
  {
    'categoryName': 'strongman',
    'categoryDescription':
        'Strongman exercises are a type of strength training that involves lifting heavy objects and performing complex movements to develop full-body strength and power. Regular strongman training can provide numerous benefits, such as improving overall physical strength, increasing muscle mass, and boosting cardiovascular health. It also helps to improve grip strength, balance, and coordination. Additionally, strongman exercises can help to increase bone density, reduce the risk of injury, and improve overall athletic performance. Strongman training is also a great way to challenge yourself both physically and mentally, as it requires a high level of focus and mental toughness. Incorporating strongman exercises into your fitness routine can lead to a stronger, more powerful, and more resilient you.',
  },
];

const List<Map> ARTICLES = [
  {
    "heading": "The Importance of Drinking Water",
    "subheading": "Why Staying Hydrated Is Essential for Good Health",
    "content":
        "Drinking enough water is essential for maintaining good health. Water is necessary for numerous bodily functions, including regulating body temperature, lubricating joints, and transporting nutrients and oxygen to cells.\n\nDehydration can cause a variety of health problems, including headaches, fatigue, and constipation. It can also impair cognitive function and mood, and make it more difficult to perform physical tasks.\n\nTo ensure that you are getting enough water, it is recommended that you drink at least eight cups of water per day. You can also increase your water intake by eating water-rich fruits and vegetables, such as watermelon and cucumber, and by drinking other fluids, such as herbal tea or low-sugar fruit juice.",
  },
  {
    "heading": "The Benefits of Regular Exercise",
    "subheading": "How Exercise Can Improve Your Physical and Mental Health",
    "content":
        "Regular exercise has numerous benefits for both physical and mental health. It can help to improve cardiovascular health, reduce the risk of chronic diseases such as diabetes and cancer, and enhance cognitive function and mood.\n\nExercise can also help to maintain a healthy body weight and improve muscle strength and endurance. It can even help to promote healthy aging and increase lifespan.\n\nTo reap the benefits of exercise, it is recommended that adults engage in at least 150 minutes of moderate-intensity aerobic activity per week, or 75 minutes of vigorous-intensity activity per week. This can include activities such as brisk walking, cycling, swimming, or running.",
  },
  {
    "heading": "The Dangers of a Sedentary Lifestyle",
    "subheading": "Why Sitting Too Much Can Be Harmful to Your Health",
    "content":
        "Sitting for prolonged periods of time can be harmful to your health. Studies have linked sedentary behavior with an increased risk of chronic diseases such as diabetes, heart disease, and cancer.\n\nSitting for extended periods can also contribute to poor posture and muscle imbalances, which can lead to back and neck pain.\n\nTo combat the negative effects of a sedentary lifestyle, it is important to take frequent breaks from sitting and engage in regular physical activity. This can include standing and stretching every hour, taking short walks throughout the day, or using a standing desk or stability ball chair.",
  },
  {
    "heading": "The Benefits of Yoga",
    "subheading":
        "How Practicing Yoga Can Improve Your Physical and Mental Health",
    "content":
        "Yoga is a mind-body practice that has been shown to have numerous benefits for physical and mental health. It can help to improve flexibility, balance, and strength, as well as reduce stress, anxiety, and depression.\n\nYoga can also help to improve respiratory function, lower blood pressure, and reduce chronic pain. It has even been shown to enhance immune function and promote healthy aging.\n\nTo start practicing yoga, it is recommended that you find a qualified instructor who can guide you through the poses and breathing techniques. There are many different types of yoga, so it is important to find a style that suits your needs and fitness level.",
  },
  {
    "heading": "The Benefits of Meditation",
    "subheading": "How Meditation Can Improve Your Mental and Physical Health",
    "content":
        "Meditation is a practice that has been used for thousands of years to promote relaxation, reduce stress, and enhance overall well-being. It can help to lower blood pressure, reduce symptoms of anxiety and depression, and improve sleep quality.\n\nMeditation can also enhance brain function and cognitive performance, and even increase gray matter density in the brain. It has also been shown to improve immune function and reduce inflammation.\n\nTo start meditating, it is recommended that you find a quiet, comfortable place to sit and focus on your breath or a specific word or phrase. There are many different types of meditation, so it is important to find a style that works best for you.",
  },
  {
    "heading": "The Risks of Smoking",
    "subheading": "Why Smoking Is Harmful to Your Health",
    "content":
        "Smoking is one of the leading causes of preventable death worldwide. It can increase the risk of numerous health problems, including lung cancer, heart disease, and stroke.\n\nSmoking can also damage the respiratory system, leading to chronic bronchitis and emphysema. It can also increase the risk of infection and impair wound healing.\n\nTo reduce the risk of these negative health effects, it is recommended that individuals quit smoking as soon as possible. There are many resources available to help individuals quit smoking, including nicotine replacement therapy and support groups.",
  },
  {
    "heading": "The Importance of Sleep",
    "subheading": "Why Getting Enough Sleep Is Essential for Good Health",
    "content":
        "Getting enough sleep is essential for maintaining good health. Sleep helps to regulate hormones, promote immune function, and repair and regenerate tissues and cells.\n\nLack of sleep can lead to a variety of health problems, including fatigue, poor concentration, and an increased risk of chronic diseases such as diabetes and obesity.\n\nTo ensure that you are getting enough sleep, it is recommended that adults aim for seven to nine hours of sleep per night. Establishing a regular sleep routine, avoiding caffeine and alcohol before bedtime, and creating a comfortable sleep environment can all help to promote better sleep.",
  },
  {
    "heading": "The Benefits of Strength Training",
    "subheading": "How Lifting Weights Can Improve Your Health",
    "content":
        "Strength training, also known as resistance training, is a type of exercise that involves lifting weights or using resistance bands to build muscle and improve overall fitness. It can help to increase muscle strength and endurance, improve bone density, and reduce the risk of injury.\n\nStrength training can also boost metabolism and promote weight loss, as well as enhance cognitive function and mood. It has even been shown to improve insulin sensitivity and lower blood sugar levels in individuals with diabetes.\n\nTo start strength training, it is recommended that you work with a qualified fitness professional who can help you develop a safe and effective program tailored to your goals and fitness level.",
  },
  {
    "heading": "The Importance of Stretching",
    "subheading":
        "How Stretching Can Improve Your Flexibility, Posture, and Performance",
    "content":
        "Stretching is an important component of fitness that can help to improve flexibility, posture, and performance. It can help to reduce the risk of injury, improve range of motion, and even enhance athletic performance.\n\nStretching can also help to relieve muscle tension and soreness, and promote relaxation and stress relief. It can be incorporated into any exercise routine or done on its own as a way to improve overall flexibility and mobility.\n\nIt is important to stretch properly and gradually increase the intensity of your stretches over time to avoid injury. A qualified fitness professional can provide guidance and recommendations on the best stretching techniques and exercises for your individual needs.",
  },
  {
    "heading": "The Power of Meditation",
    "subheading":
        "How Meditation Can Improve Your Mental Health and Well-being",
    "content":
        "Meditation is a mindfulness practice that involves focusing your attention on the present moment and observing your thoughts and feelings without judgment. It has been shown to reduce stress, anxiety, and depression, and improve overall mental health and well-being.\n\nMeditation can also help to improve sleep quality, reduce chronic pain, and enhance cognitive function and memory. It can be practiced anywhere and at any time, making it a convenient and effective way to manage stress and improve overall mental health.\n\nThere are many different types of meditation, from mindfulness meditation to loving-kindness meditation. It is important to find a type of meditation that works best for you and to practice regularly for maximum benefits.",
  },
  {
    "heading": "The Benefits of a Plant-Based Diet",
    "subheading":
        "How Eating More Plant Foods Can Improve Your Health and Reduce Your Risk of Chronic Disease",
    "content":
        "A plant-based diet is one that is rich in fruits, vegetables, whole grains, legumes, nuts, and seeds, and low in animal products. It has been shown to reduce the risk of chronic diseases such as heart disease, diabetes, and cancer, and improve overall health and well-being.\n\nPlant-based diets are typically higher in fiber, vitamins, and minerals than diets that are high in animal products. They can also be lower in saturated fat and cholesterol, which can help to improve heart health.\n\nTo transition to a plant-based diet, it is recommended to start by incorporating more plant-based foods into your meals and gradually reducing your intake of animal products. A registered dietitian can provide guidance and recommendations on how to adopt a plant-based diet that meets your individual needs and preferences.",
  },
  {
    "heading": "The Health Benefits of Swimming",
    "subheading":
        "How Swimming Can Help to Improve Your Cardiovascular Health, Muscle Strength, and Mental Health",
    "content":
        "Swimming is a great form of exercise that can provide numerous health benefits. It can help to improve cardiovascular health, increase muscle strength, and promote weight loss and maintenance.\n\nSwimming is also a low-impact exercise that can be easier on the joints than other forms of exercise, making it a good option for individuals with joint pain or injuries. Additionally, it can promote relaxation and stress relief, making it a great way to improve overall mental health and well-being.\n\nTo get the most out of swimming, it is important to practice proper technique and gradually increase the intensity of your workouts over time.",
  },
  {
    "heading": "The Benefits of Strength Training",
    "subheading":
        "How Resistance Training Can Help to Improve Muscle Strength, Bone Density, and Metabolic Health",
    "content":
        "Strength training, also known as resistance training, involves using weights or resistance bands to build muscle strength and improve overall fitness. It can help to increase muscle mass, improve bone density, and boost metabolic health.\n\nStrength training can also help to reduce the risk of chronic diseases such as heart disease, diabetes, and osteoporosis, and improve overall health and well-being. It can be done at home or in a gym, and can be modified to suit individuals of all fitness levels.\n\nTo get the most out of strength training, it is important to use proper form and technique, and to gradually increase the weight or resistance used over time.",
  },
  {
    "heading": "Healthy Skin: Tips for Maintaining Optimal Skin Health",
    "subheading": "A Guide to Protecting and Maintaining Your Skin Health",
    "content":
        "Maintaining healthy skin is important for both appearance and overall health. Here are some tips for protecting and maintaining healthy skin:\n\n1. Protect your skin from the sun with sunscreen and protective clothing\n2. Moisturize regularly to keep your skin hydrated\n3. Eat a healthy diet that is rich in vitamins and minerals\n4. Avoid smoking and excessive alcohol consumption\n5. Practice good hygiene to prevent skin infections\n\nBy following these tips, you can help to protect your skin and maintain a healthy, youthful appearance."
  },
  {
    "heading": "The Benefits of Yoga",
    "subheading":
        "How Yoga Can Improve Flexibility, Strength, and Overall Mental Health",
    "content":
        "Yoga is a mind-body practice that involves physical postures, breathing techniques, and meditation. It can help to improve flexibility, strength, and balance, as well as promote relaxation and stress relief.\n\nYoga has been shown to improve overall mental health and well-being, reducing stress, anxiety, and depression, and improving cognitive function and memory. It can be practiced by individuals of all fitness levels and can be modified to suit individual needs and preferences.\n\nTo get the most out of yoga, it is important to find a qualified instructor and to practice regularly, aiming for at least 30 minutes per day.",
  },
  {
    "heading": "The Dangers of Sitting Too Much",
    "subheading":
        "How Sedentary Behavior Can Contribute to Chronic Disease and Poor Health",
    "content":
        "Sitting for prolonged periods of time has been shown to contribute to chronic diseases such as obesity, diabetes, and heart disease. It can also lead to poor posture, muscle weakness, and reduced flexibility.\n\nTo combat the negative effects of sitting, it is important to engage in regular physical activity, take frequent breaks from sitting, and incorporate more movement into your daily routine. This can include taking the stairs instead of the elevator, standing during phone calls, and taking short walks throughout the day.\n\nIt is also important to maintain good posture while sitting, with your feet flat on the floor, your back straight, and your shoulders relaxed.",
  },
  {
    "heading": "Tips for Reducing Screen Time",
    "subheading": "Reducing Phone Addiction",
    "content":
        "Phone addiction is a growing problem in today's society. Here are some tips for reducing screen time:\n\n1. Setting boundaries and limits on phone use\n2. Finding alternative activities to fill downtime\n3. Turning off notifications and putting the phone away during meals\n4. Using apps that track and limit phone use\n\nBy taking steps to reduce phone addiction, individuals can improve their mental health and well-being."
  },
  {
    "heading": "The Benefits of Mindful Eating",
    "subheading":
        "How Practicing Mindful Eating Can Help to Improve Your Relationship with Food and Promote Healthy Eating Habits",
    "content":
        "Mindful eating involves paying attention to your food and your body's hunger and fullness signals, and being present in the moment while you eat. This can help to improve your relationship with food, reduce overeating, and promote healthy eating habits.\n\nMindful eating has also been shown to reduce stress, improve digestion, and increase overall satisfaction with meals. To practice mindful eating, it is important to eat slowly, savor the flavors and textures of your food, and pay attention to your body's signals of hunger and fullness.",
  },
  {
    "heading": "The Benefits of Strength Training for Women",
    "subheading": "Why Women Should Strength Train",
    "content":
        "Strength training is often associated with men, but it can be incredibly beneficial for women as well. Here are some benefits of strength training for women:\n\n1. Building stronger muscles and bones\n2. Improving balance and coordination\n3. Boosting metabolism and weight loss\n4. Reducing the risk of injury\n\nBy incorporating strength training into their exercise routines, women can improve their physical and mental health."
  },
  {
    "heading": "The Role of Diet in Women's Health",
    "subheading": "Eating a Healthy Diet for Women's Health",
    "content":
        "A healthy diet is essential for maintaining good health, especially for women. Here are some tips for eating a healthy diet:\n\n1. Eating a variety of fruits, vegetables, and whole grains\n2. Choosing lean protein sources\n3. Limiting processed and sugary foods\n4. Staying hydrated\n\nBy nourishing their bodies with healthy foods, women can support their physical and mental well-being."
  },
  {
    "heading": "The Importance of Cardiovascular Exercise for Women",
    "subheading": "Benefits of Cardiovascular Exercise for Women",
    "content":
        "Cardiovascular exercise is important for maintaining good health, especially for women. Here are some benefits of cardiovascular exercise for women:\n\n1. Improving heart health\n2. Reducing the risk of chronic diseases\n3. Boosting mood and mental health\n4. Supporting weight loss\n\nBy incorporating cardiovascular exercise into their routines, women can improve their overall health and well-being."
  },
  {
    "heading": "The Harmful Effects of Pornography Addiction",
    "subheading": "Overcoming Pornography Addiction",
    "content":
        "Pornography addiction is a serious issue that can have harmful effects on an individual's mental and physical health. Here are some tips for overcoming pornography addiction:\n\n1. Acknowledging the addiction and seeking help\n2. Identifying triggers and avoiding them\n3. Developing healthy coping mechanisms\n4. Creating a support network\n\nBy taking steps to overcome pornography addiction, individuals can improve their relationships and overall well-being."
  },
  {
    "heading": "Knee Health: Preventing Injury and Managing Pain",
    "subheading": "A Guide to Keeping Your Knees Healthy and Pain-Free",
    "content":
        "Knee pain and injuries are common, but there are steps you can take to prevent them and manage pain when it occurs. Here are some tips for maintaining healthy knees:\n\n1. Stay active and maintain a healthy weight\n2. Warm up before exercising and cool down after\n3. Wear proper footwear and protective gear when playing sports\n4. Strengthen the muscles around your knees\n5. Avoid activities that put excessive stress on your knees\n\nIf you experience knee pain or injury, rest and apply ice to reduce inflammation. Over-the-counter pain relievers and physical therapy may also be helpful. In some cases, surgery may be necessary to repair damage to the knee."
  },
  {
    "heading": "The Importance of Hydration",
    "subheading":
        "How Staying Hydrated Can Help to Improve Your Physical and Mental Health",
    "content":
        "Drinking enough water and staying hydrated is essential for good health. It can help to regulate body temperature, improve digestion, and support healthy skin and hair.\n\nStaying hydrated can also improve mental clarity and cognitive function, reduce fatigue and headaches, and boost overall energy levels. To ensure that you are getting enough water, it is recommended to drink at least eight 8-ounce glasses of water per day.",
  },
  {
    "heading": "Superfoods for Weight Loss: Do They Really Work?",
    "subheading":
        "An Examination of the Effectiveness of Superfoods for Weight Loss",
    "content":
        "While superfoods are known for their health benefits, some people believe that certain superfoods can also promote weight loss. However, there is no single food or group of foods that can guarantee weight loss.\n\nThat being said, some superfoods can be helpful for weight loss when consumed as part of a healthy diet and lifestyle. For example, foods that are high in fiber and protein can help to promote feelings of fullness and reduce overall calorie intake.\n\nSome superfoods that may be helpful for weight loss include berries, leafy greens, whole grains, nuts, and seeds. However, it is important to remember that weight loss is not solely dependent on what you eat, but also on factors such as exercise and overall calorie intake."
  },
  {
    "heading": "The Impact of Social Media Addiction on Mental Health",
    "subheading": "Addressing Social Media Addiction",
    "content":
        "Social media addiction is a growing problem that can have negative effects on an individual's mental health. Here are some tips for addressing social media addiction:\n\n1. Setting limits on social media use\n2. Unplugging from social media for designated periods of time\n3. Finding alternative activities to fill downtime\n4. Seeking professional help if needed\n\nBy taking steps to address social media addiction, individuals can improve their mental health and well-being."
  },
  {
    "heading": "Common Sexual Health Problems and How to Treat Them",
    "subheading":
        "An Overview of the Most Common Sexual Health Issues and Their Treatments",
    "content":
        "Sexual health problems can affect people of all ages and genders, and they can have a negative impact on relationships and overall quality of life. Some common sexual health problems include erectile dysfunction, premature ejaculation, low libido, and vaginal dryness.\n\nTreatment options for sexual health problems can vary depending on the underlying cause. In some cases, lifestyle changes such as exercise and improved nutrition can help to improve sexual function. In other cases, medications or therapy may be necessary.\n\nIt is important to talk to a healthcare provider if you are experiencing sexual health problems, as they can provide guidance and recommend appropriate treatment options."
  },
  {
    "heading": "The Benefits of Outdoor Exercise",
    "subheading":
        "How Exercising Outdoors Can Improve Your Physical and Mental Health",
    "content":
        "Exercising outdoors can provide numerous health benefits, including improved cardiovascular health, increased muscle strength, and reduced stress and anxiety.\n\nExposure to natural light and fresh air can also improve mood and mental health, boost energy levels, and enhance overall feelings of well-being. To get the most out of outdoor exercise, it is important to dress appropriately for the weather, wear sunscreen, and stay hydrated."
  },
  {
    "heading": "Ayurvedic Medicine: Understanding the Basics",
    "subheading": "An Overview of the Ancient Indian System of Medicine",
    "content":
        "Ayurveda is an ancient Indian system of medicine that has been practiced for thousands of years. It is based on the idea that the body, mind, and spirit are interconnected, and that health is achieved by balancing these elements.\n\nAyurvedic medicine uses a variety of natural treatments, including herbal remedies, massage, and dietary changes, to promote healing and prevent disease. It is often used in combination with modern medicine to provide a holistic approach to health and wellness."
  },
  {
    "heading": "The Role of Nutrition in Sexual Health",
    "subheading": "How What You Eat Can Affect Your Sex Life",
    "content":
        "Good nutrition is important for overall health, and it can also have an impact on sexual health. Eating a balanced diet that includes plenty of fruits, vegetables, whole grains, and lean proteins can help to improve circulation, boost energy levels, and promote hormonal balance, all of which are important for sexual health.\n\nIn addition, certain foods have been shown to have aphrodisiac properties, such as oysters, chocolate, and strawberries. However, it is important to remember that there is no magic food that can guarantee sexual prowess.\n\nIt is also important to avoid excessive alcohol consumption and to limit the intake of foods that are high in saturated and trans fats, which can have a negative impact on cardiovascular health and sexual function."
  },
  {
    "heading": "The Pros and Cons of Modern Medicine",
    "subheading":
        "A Look at the Advantages and Disadvantages of Western Medicine",
    "content":
        "Modern medicine, also known as Western medicine, is based on scientific research and uses advanced technology to diagnose and treat illnesses. It has led to many life-saving advancements, such as antibiotics, vaccines, and surgical procedures.\n\nHowever, modern medicine can also have side effects and may not always address the root cause of a health problem. It can also be expensive and inaccessible to some people. It is important to weigh the pros and cons of modern medicine and consider alternative approaches to healthcare when appropriate."
  },
  {
    "heading": "How to Improve Your Mental Health",
    "subheading": "Simple Strategies for Boosting Your Emotional Well-being",
    "content":
        "Mental health is just as important as physical health, and taking care of your emotional well-being can have a positive impact on all areas of your life. There are many simple strategies you can use to improve your mental health, such as:\n\n- Practicing mindfulness and meditation\n- Getting regular exercise\n- Spending time in nature\n- Engaging in creative hobbies\n- Building strong social connections\n\nIt is also important to seek professional help if you are struggling with mental health issues such as depression, anxiety, or addiction."
  },
  {
    "heading": "The Link Between Exercise and Sexual Health",
    "subheading": "How Physical Activity Can Improve Your Sex Life",
    "content":
        "Regular exercise can have a positive impact on sexual health in both men and women. Exercise helps to improve circulation, boost energy levels, and increase stamina, all of which can enhance sexual performance.\n\nIn addition, exercise can reduce stress and anxiety, which can have a negative impact on sexual function. Exercise also releases endorphins, which can improve mood and promote feelings of pleasure and well-being.\n\nTo reap the benefits of exercise for sexual health, it is recommended to engage in moderate physical activity for at least 30 minutes a day, most days of the week."
  },
  {
    "heading": "10 Superfoods You Should Add to Your Diet",
    "subheading": "These Nutrient-Packed Foods Can Boost Your Health",
    "content":
        "Superfoods are foods that are packed with nutrients and are thought to provide a wide range of health benefits. Here are 10 superfoods you should consider adding to your diet:\n\n1. Blueberries - Rich in antioxidants and fiber, blueberries are great for heart health and brain function.\n\n2. Kale - A nutrient-dense leafy green, kale is high in vitamins A, C, and K, and is thought to have anti-inflammatory properties.\n\n3. Quinoa - A versatile grain that is high in protein, fiber, and essential nutrients.\n\n4. Salmon - Rich in omega-3 fatty acids, salmon is great for heart health and brain function.\n\n5. Avocado - A source of healthy fats and fiber, avocado is great for heart health and may help to lower cholesterol.\n\n6. Almonds - A great source of protein and healthy fats, almonds are thought to have a range of health benefits.\n\n7. Turmeric - A spice with anti-inflammatory properties, turmeric is often used in curry dishes and can be added to smoothies and other recipes.\n\n8. Sweet Potatoes - A good source of fiber, vitamins, and minerals, sweet potatoes are also thought to have anti-inflammatory properties.\n\n9. Spinach - Another nutrient-dense leafy green, spinach is high in vitamins A and C, and is thought to have anti-cancer properties.\n\n10. Greek Yogurt - High in protein and probiotics, Greek yogurt is a great snack or addition to smoothies and other recipes."
  },
];
