import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiteness_x/Widgets/utils/loader_error_handle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes.dart';
import '../onboardingandloginwidgets/input_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = '\\reset-password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool isLoading = false;

  TextEditingController email = TextEditingController();

  Future resetPassword(BuildContext context) async {
    if (email.text.isEmpty) {
      showErrorDialogWithoutRetry(context, 'Please fill your Email address');
      return;
    }
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      showSuccessDialog(
          context: context,
          successMessage: 'Please find to password reset link in your Email');
      Future.delayed(Duration(seconds: 4), () {
        Navigator.of(context).pop();
      });
    } on FirebaseAuthException catch (e) {
      showErrorDialogWithoutRetry(
          context,
          e.message
              .toString()
              .split('.')[0]
              .replaceFirst('identifier', 'email'));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF92A3FD),
        elevation: 0,
        title: Text(
          'Reset Password',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
      ),
      body: Stack(
        children: [
          if (isLoading) Loader(),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 80),
                width: MediaQuery.of(context).size.width,
                height: 100,
                alignment: Alignment.center,
                child: InputWidget(
                    labelName: 'Email',
                    textController: email,
                    iconName: Icons.email_outlined),
              ),
              GestureDetector(
                  onTap: () {
                    resetPassword(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
                    decoration: BoxDecoration(
                        gradient: primaryLinearGradient,
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Reset Password ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Icon(
                            Icons.lock_reset,
                            color: Colors.white,
                          ),
                        ]),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
