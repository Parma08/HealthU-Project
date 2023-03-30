import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiteness_x/Widgets/Home_Screen_Widgets/reset_password_screen.dart';
import 'package:fiteness_x/Widgets/onboardingandloginwidgets/complete_your_profile.dart';
import 'package:fiteness_x/Widgets/onboardingandloginwidgets/welcome_screen.dart';
import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';

import 'Widgets/meal_screen_widgets/daily_meal_schedule_widgets/daily_meal_schedule.dart';
import 'screens/get_started_screen.dart';
import 'screens/introduction_screen.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/create_account_page.dart';
import 'screens/login_screen.dart';
import 'Widgets/tabs_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loader();
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Something Went Wrong!'),
            );
          }
          if (snapshot.hasData) {
            return TabsPage();
          } else {
            return GetStartedScreen();
          }
        },
      ),
      theme: appTheme,
      routes: {
        GetStartedScreen.routeName: (ctx) => GetStartedScreen(),
        IntroductionScreen.routeName: (ctx) => IntroductionScreen(),
        CreateAccount.routeName: (ctx) => CreateAccount(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        TabsPage.routeName: (ctx) => TabsPage(),
        DailyMealSchedule.routeName: (ctx) => DailyMealSchedule(),
        WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
        CompleteYourProfile.routeName: (ctx) => CompleteYourProfile(),
        ResetPasswordScreen.routeName: (ctx) => ResetPasswordScreen(),
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
