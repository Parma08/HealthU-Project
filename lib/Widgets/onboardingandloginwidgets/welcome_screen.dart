import 'package:fiteness_x/Widgets/tabs_page.dart';
import 'package:fiteness_x/modals/appGetterSetter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../themes.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = '/welcome-screen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
        child: LayoutBuilder(builder: (_, contraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: contraints.maxHeight * 0.50,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 10,
                ),
                child: SvgPicture.asset(
                    'assets/images/welcome_screen_illustration.svg'),
              ),
              Container(
                height: contraints.maxHeight * 0.40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            '${userDetails.firstName}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1D1617)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          alignment: Alignment.center,
                          child: Text(
                            'You are all set now, let’s reach your goals together with us',
                            style: TextStyle(
                                fontSize: 14, color: Color(0XFF7B6F72)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(TabsPage.routeName);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: primaryLinearGradient,
                            borderRadius: BorderRadius.circular(100)),
                        child: const Text(
                          'Go To Home',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
