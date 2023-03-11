import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:fiteness_x/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MealMakingSteps extends StatelessWidget {
  List<String> mealMakingSteps;
  MealMakingSteps(this.mealMakingSteps);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Step by Step',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 19),
                ),
                Text('${mealMakingSteps.length} Steps',
                    style: TextStyle(color: Color(0xFF7B6F72), fontSize: 14))
              ],
            ),
          ),
          ...mealMakingSteps.map((step) {
            return Container(
                padding: EdgeInsets.only(left: 12, right: 10),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: LayoutBuilder(
                  builder: (ctx, constraints) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment(0, -0.95),
                          children: [
                            DottedBorder(
                                color: Color(0xFFC58BF2),
                                dashPattern: [3, 1],
                                padding: EdgeInsets.all(0),
                                child: Container(
                                  height: constraints.maxHeight,
                                  width: 1,
                                )),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 2, color: Color(0xFFC58BF2)),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      gradient: secondaryLinearGradient,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  padding: EdgeInsets.zero,
                                  margin: EdgeInsets.zero,
                                  child: Text(
                                    'Step ${mealMakingSteps.indexOf(step) + 1}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight - 40,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      step,
                                      style: TextStyle(
                                        color: Color(0xFF7B6F72),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ));
          }).toList()
        ],
      ),
    );
  }
}
