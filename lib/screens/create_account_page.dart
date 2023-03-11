import './login_screen.dart';
import 'package:fiteness_x/Widgets/social_login_buttons.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../Widgets/accept_policy.dart';
import '../Widgets/input_widget.dart';

class CreateAccount extends StatelessWidget {
  static const routeName = '/createaccount';
  late TextEditingController firstName = TextEditingController();
  late TextEditingController lastName = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
                  AcceptPolicy(),
                  Container(
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
            )));
  }
}
