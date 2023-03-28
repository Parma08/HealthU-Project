import 'dart:math';

import 'package:flutter/material.dart';

class HomePageIndicator extends StatelessWidget {
  HomePageIndicator({super.key});

  late Color indicatorFGColor;
  late Color indicatorBGColor;
  late String category;
  late double degreeRotation;
  double bmi = 32;

  Widget indicatorBuilder(double value, Color color) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(15),
        width: 320,
        height: 320,
        child: CircularProgressIndicator(
          strokeWidth: 7,
          value: value,
          color: color,
        ),
      ),
    );
  }

  void findIndicatorBGColor() {
    degreeRotation = (bmi - 15) * 12;
    if (bmi < 15) {
      degreeRotation = 5;
    } else if (bmi > 45) {
      degreeRotation = 355;
    }

    if (bmi < 18.5) {
      indicatorFGColor = Color(0xFF000080);
      indicatorBGColor = Color.fromRGBO(173, 216, 230, 0.9);
      category = 'Underweight';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      indicatorFGColor = Color(0xFF000080);
      indicatorBGColor = Color(0xFF4CAF50);
      category = 'Normal weight';
    } else if (bmi >= 25 && bmi <= 29.9) {
      indicatorFGColor = Color(0xFF333333);
      indicatorBGColor = Color.fromRGBO(255, 215, 0, 0.9);
      category = 'Overweight';
    } else if (bmi >= 30 && bmi <= 34.9) {
      indicatorFGColor = Color(0xFF333333);
      indicatorBGColor = Color.fromRGBO(255, 165, 0, 0.9);
      category = 'Obese class I';
    } else if (bmi >= 35 && bmi <= 39.9) {
      indicatorFGColor = Color(0xFFF5F5F5);
      indicatorBGColor = Color.fromRGBO(255, 140, 0, 0.9);
      category = 'Obese class II';
    } else if (bmi >= 40) {
      indicatorFGColor = Color(0xFFF5F5F5);
      indicatorBGColor = Color.fromRGBO(255, 0, 0, 0.9);
      category = 'Obese class III';
    }
  }

  @override
  Widget build(BuildContext context) {
    findIndicatorBGColor();
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        width: 320,
        height: 320,
        child: Stack(
          children: [
            indicatorBuilder(1, Color(0XFFFF0000)),
            indicatorBuilder(0.81992, Color(0XFFFF8C00)),
            indicatorBuilder(0.65659, Color(0XFFFFA500)),
            indicatorBuilder(0.49326, Color(0XFFFFD700)),
            indicatorBuilder(0.32993, Color(0xFF4CAF50)),
            indicatorBuilder(0.1166, Color(0XFFADD8E6)),
            Center(
              child: Container(
                width: 270,
                height: 270,
                decoration: BoxDecoration(
                    color: indicatorBGColor, shape: BoxShape.circle),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'body\nmass index'.toUpperCase(),
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        '${bmi}',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: indicatorFGColor,
                            fontSize: 25),
                      ),
                    ),
                    Text('${category}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: indicatorFGColor,
                        ))
                  ],
                ),
              ),
            ),
            Positioned(
                left: 152,
                top: 8,
                child: Transform.rotate(
                  angle: (pi / 180) * degreeRotation,
                  origin: Offset(0, 144),
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(158, 158, 158, 0.4),
                            blurRadius: 3)
                      ],
                      color: indicatorBGColor,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
