import 'package:fiteness_x/Widgets/Workout_Widgets/workout_list.dart';
import 'package:flutter/material.dart';

import '../../modals/constants.dart';

class WorkoutCategoryByType extends StatelessWidget {
  const WorkoutCategoryByType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 40, bottom: 5),
            child: Text(
              'Choose From Category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: WORKOUT_CATEGORY_BY_TYPE.map((workout) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return WorkoutList(
                        muscleGroup: '',
                        exerciseType: workout.searchByName,
                        imageLink: workout.imageLink,
                      );
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(146, 163, 253, 0.5),
                              Color.fromRGBO(157, 206, 255, 0.5),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight),
                        borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width * 0.70,
                    height: 160,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.all(10),
                    child: LayoutBuilder(builder: (_, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  workout.categoryName,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '10 Exercises',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  alignment: Alignment.center,
                                  width: constraints.maxWidth * 0.35,
                                  height: constraints.maxHeight * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Text(
                                    'View More',
                                    style: TextStyle(
                                        fontSize: 10, color: Color(0xFF92A3FD)),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: constraints.maxHeight * 0.8,
                            width: constraints.maxWidth * 0.4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                workout.imageLink,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
