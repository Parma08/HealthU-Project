import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroductionScreen extends StatelessWidget {
  static const routeName = '/introductionscreen';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: SvgPicture.asset(
              routeArgs['icon'],
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 30),
            child: Container(
              width: 200,
              child: Text(
                routeArgs['titleText'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              routeArgs['bodyText'],
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            alignment: Alignment(0.9, 0.7),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 68,
                  width: 68,
                  child: CircularProgressIndicator(
                    color: Color(0xFF92A3FD),
                    strokeWidth: 2,
                    value: routeArgs['progressPercent'],
                  ),
                ),
                InkWell(
                    onTap: () {
                      routeArgs['onTapMethod'](context);
                    },
                    child: Container(
                      child: Container(
                        height: 60,
                        width: 60,
                        child: Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            gradient: primaryLinearGradient,
                            shape: BoxShape.circle),
                      ),
                    )),
              ],
            ),
          )),
        ],
      ),
    ));
  }
}
