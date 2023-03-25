import 'package:fiteness_x/Widgets/Workout_Widgets/workout_list.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:flutter/material.dart';

class WorkoutCategoryByBodyNameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.only(left: 40, bottom: 5),
        child: Text(
          'Choose From Body Part',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      ...WORKOUT_CATEGORY_BY_BODY_PART.map((workout) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return WorkoutList(
                muscleGroup: workout.searchByName,
                exerciseType: '',
                imageLink: workout.imageLink,
              );
            }));
          },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(146, 163, 253, 0.5),
                  Color.fromRGBO(157, 206, 255, 0.5),
                ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width * 80,
            margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
            height: 160,
            padding: EdgeInsets.all(10),
            child: LayoutBuilder(builder: (_, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workout.categoryName,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '11 Exercises',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        alignment: Alignment.center,
                        width: constraints.maxWidth * 0.25,
                        height: constraints.maxHeight * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          'View More',
                          style:
                              TextStyle(fontSize: 10, color: Color(0xFF92A3FD)),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
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
      }).toList()
    ]);
  }
}
