import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiteness_x/Widgets/tabs_page.dart';
import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:fiteness_x/modals/meal_modal.dart';

import '../Widgets/onboardingandloginwidgets/accept_policy.dart';
import '../Widgets/onboardingandloginwidgets/input_widget.dart';
import '../Widgets/onboardingandloginwidgets/social_login_buttons.dart';
import './login_screen.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  static const routeName = '/createaccount';

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  late TextEditingController firstName = TextEditingController();

  late TextEditingController lastName = TextEditingController();

  late TextEditingController email = TextEditingController();

  late TextEditingController password = TextEditingController();
  late TextEditingController confirmpassword = TextEditingController();

  bool isLoading = false;

  Future signUp(BuildContext context) async {
    if (firstName.text.isEmpty ||
        lastName.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty) {
      showErrorDialogWithoutRetry(
          context, "Please fill in all the credentials");
      return;
    } else if (password.text != confirmpassword.text) {
      showErrorDialogWithoutRetry(
          context, "Password and Confirm Password do not match");
      return;
    }

    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    setState(() {
      isLoading = true;
    });
    try {
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      setUserDetails(UserModal(
        userId: user.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        dateOfBirth: routeArgs['dob'],
        gender: routeArgs['gender'],
        weightInKgs: routeArgs['weight'],
        heightInCM: routeArgs['height'],
        bmi: getCalculatedBMI(routeArgs['weight'], routeArgs['height']),
        bmr: getCalculatedBMR(routeArgs['weight'], routeArgs['height'],
            routeArgs['dob'], routeArgs['gender']),
        ibw: getCalculatedIdealBodyWeight(
            routeArgs['height'], routeArgs['gender']),
      ));

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user!.uid)
          .set(getUserDetailsInJSON);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {
        return TabsPage();
      }), (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      showErrorDialogWithoutRetry(context, e.message.toString());
    }
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        if (isLoading) Loader(),
        Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                  ),
                  const Text(
                    'Hey there',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    'Create an Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InputWidget(
                      labelName: 'First Name',
                      textController: firstName,
                      iconName: Icons.person_2_outlined),
                  InputWidget(
                      labelName: 'Last Name',
                      textController: lastName,
                      iconName: Icons.person_2_outlined),
                  InputWidget(
                      labelName: 'Email',
                      textController: email,
                      iconName: Icons.email_outlined),
                  InputWidget(
                      labelName: 'Password',
                      textController: password,
                      iconName: Icons.lock_outline),
                  InputWidget(
                      labelName: 'Confirm Password',
                      textController: confirmpassword,
                      iconName: Icons.lock_outline),
                  AcceptPolicy(),
                  GestureDetector(
                    onTap: () {
                      signUp(context);
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin:
                          const EdgeInsets.only(top: 100, left: 10, right: 10),
                      decoration: BoxDecoration(
                          gradient: primaryLinearGradient,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
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
                      Center(
                          child: Container(
                        width: 40,
                        height: 20,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Theme.of(context).canvasColor,
                        child: const Text(
                          'Or',
                          style: TextStyle(fontSize: 12),
                        ),
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialLoginButtons(),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Already have an account ',
                        style: TextStyle(color: Color(0xFF1D1617)),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushNamed(LoginScreen.routeName);
                              },
                            text: 'Login',
                            style: TextStyle(color: Color(0xFFC58BF2)),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            )),
      ],
    ));
  }
}
