import 'package:flutter/material.dart';

class AcceptPolicy extends StatefulWidget {
  @override
  State<AcceptPolicy> createState() => _AcceptPolicyState();
}

class _AcceptPolicyState extends State<AcceptPolicy> {
  bool checkboxController = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: checkboxController,
            onChanged: (val) {
              setState(() {
                checkboxController = val!;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          Container(
            width: 250,
            child: RichText(
              text: const TextSpan(
                  text: 'By continuing you accept our ',
                  style: TextStyle(color: Color(0xFFADA4A5), fontSize: 12),
                  children: [
                    TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(text: ' and '),
                    TextSpan(
                        text: 'Term of use',
                        style: TextStyle(decoration: TextDecoration.underline))
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
