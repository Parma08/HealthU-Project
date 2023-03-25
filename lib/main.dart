import 'Widgets/meal_screen_widgets/daily_meal_schedule_widgets/daily_meal_schedule.dart';
import 'screens/get_started_screen.dart';
import 'screens/introduction_screen.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/create_account_page.dart';
import 'screens/login_screen.dart';
import 'Widgets/tabs_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xFF92A3FD),
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabsPage(),
      theme: appTheme,
      routes: {
        GetStartedScreen.routeName: (ctx) => GetStartedScreen(),
        IntroductionScreen.routeName: (ctx) => IntroductionScreen(),
        CreateAccount.routeName: (ctx) => CreateAccount(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        TabsPage.routeName: (ctx) => TabsPage(),
        DailyMealSchedule.routeName: (ctx) => DailyMealSchedule(),
      },
    );
  }
}

class OnBoardingScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetStartedScreen(),
    );
  }
}
