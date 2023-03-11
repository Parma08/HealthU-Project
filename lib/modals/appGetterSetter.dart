import 'meal_modal.dart';

late List<MealModal> selectedMeals = [];

void setSelectedMeal(MealModal meal) {
  print('THIS CALLLED');
  selectedMeals.insert(selectedMeals.length, meal);
  print("SET METHID $selectedMeals");
}

List<MealModal> get getSelectedMeal {
  print("SET METHID $selectedMeals");
  return selectedMeals;
}
