import 'package:fiteness_x/Widgets/utils/info_page.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:flutter/gestures.dart';
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
              text: TextSpan(
                  text: 'By continuing you accept our ',
                  style: TextStyle(color: Color(0xFFADA4A5), fontSize: 12),
                  children: [
                    TextSpan(
                        text: 'Privacy Policy',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return InfoPage(
                                  heading: 'Privacy Policy',
                                  content: PRIVACY_POLICY);
                            }));
                          },
                        style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(text: ' and '),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return InfoPage(
                                  heading: 'Terms of Use',
                                  content: PRIVACY_POLICY);
                            }));
                          },
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
