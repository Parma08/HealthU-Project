import 'package:flutter/material.dart';

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
