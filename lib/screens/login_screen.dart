import 'package:fiteness_x/Screens/create_account_page.dart';
import 'package:fiteness_x/Widgets/social_login_buttons.dart';
import 'package:fiteness_x/Widgets/tabs_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes.dart';
import '../Widgets/input_widget.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/loginscreen';
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  const Text(
                    'Forgot your password',
                    style: TextStyle(
                        color: Color(0xFFADA4A5),
                        fontSize: 10,
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(TabsPage.routeName);
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
                  SocialLoginButtons(),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account yet? ',
                          style: TextStyle(color: Color(0xFF1D1617)),
                          children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushNamed(CreateAccount.routeName);
                              },
                            text: 'Register',
                            style: TextStyle(color: Color(0xFFC58BF2)))
                      ])),
                ],
              ),
            )));
  }
}
