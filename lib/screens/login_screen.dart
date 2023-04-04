import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiteness_x/Screens/create_account_page.dart';
import 'package:fiteness_x/Widgets/Home_Screen_Widgets/reset_password_screen.dart';
import 'package:fiteness_x/Widgets/onboardingandloginwidgets/complete_your_profile.dart';
import 'package:fiteness_x/Widgets/onboardingandloginwidgets/welcome_screen.dart';
import 'package:fiteness_x/Widgets/tabs_page.dart';
import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Widgets/onboardingandloginwidgets/input_widget.dart';
import '../Widgets/onboardingandloginwidgets/social_login_buttons.dart';
import '../modals/firebaseservice.dart';
import '../themes.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginscreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool isLoading = false;

  Future login(BuildContext context) async {
    if (email.text.isEmpty || password.text.isEmpty) {
      showErrorDialogWithoutRetry(context, 'Please fill all the Credentials');
      return;
    }
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      await initializeDatabaseRelatedThingsForApp();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {
        return WelcomeScreen();
      }), (route) => false);
    } on FirebaseAuthException catch (e) {
      showErrorDialogWithoutRetry(
          context,
          e.message
              .toString()
              .split('.')[0]
              .replaceFirst('identifier', 'email'));
    }

    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        if (isLoading) Loader(),
        IgnorePointer(
          ignoring: isLoading,
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).padding.top + 20,
                    ),
                    const Text(
                      'Hey there',
                      style: TextStyle(fontSize: 16),
                    ),
                    const Text(
                      'Welcome Back',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InputWidget(
                        labelName: 'Email',
                        textController: email,
                        iconName: Icons.email_outlined),
                    InputWidget(
                        labelName: 'Password',
                        textController: password,
                        iconName: Icons.lock_outline),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(ResetPasswordScreen.routeName);
                      },
                      child: Text(
                        'Forgot your password',
                        style: TextStyle(
                            color: Color(0xFFADA4A5),
                            fontSize: 10,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    GestureDetector(
                        onTap: () {
                          login(context);
                        },
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.only(
                              top: 100, left: 10, right: 10),
                          decoration: BoxDecoration(
                              gradient: primaryLinearGradient,
                              borderRadius: BorderRadius.circular(100)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/Login.svg'),
                                const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )
                              ]),
                        )),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(52, 52, 52, 0.3)))),
                        ),
                        // Center(
                        //     child: Container(
                        //   width: 40,
                        //   height: 20,
                        //   padding: EdgeInsets.symmetric(horizontal: 10),
                        //   color: Theme.of(context).canvasColor,
                        //   child: const Text(
                        //     'Or',
                        //     style: TextStyle(fontSize: 12),
                        //   ),
                        // ))
                      ],
                    ),
                    // SocialLoginButtons(),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account yet? ',
                            style: TextStyle(color: Color(0xFF1D1617)),
                            children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .pushNamed(CompleteYourProfile.routeName);
                                },
                              text: 'Register',
                              style: TextStyle(color: Color(0xFFC58BF2)))
                        ])),
                  ],
                ),
              )),
        ),
      ],
    ));
  }
}
