import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IngredientsRequiredWidget extends StatelessWidget {
  List<String> ingredients;
  List<String> ingredientQuantity;

  IngredientsRequiredWidget(
      {required this.ingredients, required this.ingredientQuantity}) {
    print("INGREDIENS ${ingredients}");
    print("INGREDIENS ${ingredientQuantity}");
    // print("INGREDIENS ${ingredients.length}");
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ingredients Required',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 19),
                    ),
                    Text('${ingredients.length} items',
                        style:
                            TextStyle(color: Color(0xFF7B6F72), fontSize: 14)),
                  ],
                ),
              ),
              Container(
                // margin: EdgeInsets.only(left: 20),
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Container(
                        height: 200,
                        width: 150,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color(0xFFF7F8F8),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Image.network(
                                'https://www.themealdb.com/images/ingredients/${ingredients[index]}-small.png',
                                height: 100,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                ingredients[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              ),
                            ),
                            Text(ingredientQuantity[index],
                                style: TextStyle(
                                    color: Color(0xFF7B6F72), fontSize: 14)),
                          ],
                        ));
                  },
                  itemCount: ingredientQuantity.length,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
