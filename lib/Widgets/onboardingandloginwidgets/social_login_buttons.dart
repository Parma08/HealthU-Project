import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});
  Widget SocialLoginBuilder(String logoLink) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(width: 1, color: Color.fromARGB(105, 123, 123, 123))),
      child: Image.asset(
        logoLink,
        fit: BoxFit.cover,
        height: 35,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginBuilder('assets/images/google.png'),
        SocialLoginBuilder('assets/images/facebook.png'),
      ],
    );
  }
}
