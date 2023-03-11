import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
      titleMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
      titleSmall: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 22, color: Colors.black),
      bodySmall: TextStyle(fontSize: 18, color: Colors.black),
    ),
    // canvasColor: Color.fromARGB(255, 253, 253, 253),
    canvasColor: Colors.white);
const LinearGradient primaryLinearGradient = LinearGradient(
    colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);
const LinearGradient secondaryLinearGradient = LinearGradient(
    colors: [Color(0xFFC58BF2), Color(0xFFEEA4CE)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight);

const List<Map<String, String>> CATEGORY_INFO = [
  {
    'category': 'Chicken',
    'cText':
        'Chicken is a popular and versatile source of protein that can be prepared in various ways. It is low in fat and calories, making it a healthier option compared to red meat. Chicken is also a good source of essential nutrients, such as vitamin B6, niacin, and phosphorus, as well as a rich source of selenium, which is important for thyroid function and immune health. However, there are some potential drawbacks to consuming chicken, such as the risk of foodborne illness, particularly from undercooked or contaminated chicken. Additionally, some chicken products may contain harmful additives, such as antibiotics, hormones, and artificial preservatives, which can be harmful to human health. Therefore, it is important to choose high-quality chicken that is free from harmful additives and cooked thoroughly to minimize the risk of foodborne illness. Overall, chicken can be a healthy and nutritious addition to a balanced diet, but it is important to be mindful of the potential risks and make informed choices when purchasing and preparing it.',
  },
  {
    'category': 'Dessert',
    'cText':
        'Desserts are a type of food that is typically consumed after a meal or as a snack. While desserts are often associated with indulgence and pleasure, they are generally high in sugar, fat, and calories, which can lead to weight gain and other health problems if consumed in excess. Some potential benefits of desserts are that they can provide a quick source of energy and satisfy a sweet craving, which may help prevent overeating or snacking on less healthy options. Additionally, some desserts, such as fruit-based desserts, can provide important vitamins, fiber, and antioxidants that support overall health. However, it is important to consume desserts in moderation and choose healthier options when possible, such as fresh fruit, yogurt, or homemade baked goods that use healthier ingredients, like whole grains and natural sweeteners. Ultimately, while desserts can be a fun and enjoyable part of a balanced diet, it is important to be mindful of the potential drawbacks and make informed choices to support overall health and wellbeing.',
  },
  {
    'category': 'Pasta',
    'cText':
        'Pasta is a popular and versatile food that is made from wheat flour and water, and sometimes eggs. It is a good source of complex carbohydrates, which provide energy for the body, as well as fiber, which promotes digestive health and may help lower cholesterol levels. Additionally, pasta is often low in fat and can be a good source of protein when served with meat or other protein-rich ingredients. However, some types of pasta may be high in refined carbohydrates, which can cause a rapid increase in blood sugar levels, particularly in those with diabetes. Additionally, some pasta dishes can be high in calories, especially when served with high-fat sauces or cheese. To promote optimal nutrition, it is important to choose whole-grain pasta varieties, which are higher in fiber and other important nutrients, such as B vitamins and iron, and to pair pasta with a variety of vegetables and protein-rich ingredients. Overall, when consumed in moderation and prepared in a healthy manner, pasta can be a nutritious and satisfying part of a balanced diet.',
  },
  {
    'category': 'Seafood',
    'cText':
        'Seafood refers to a variety of aquatic animals that are consumed as food, including fish, shellfish, and crustaceans. Seafood is a rich source of high-quality protein, healthy fats, vitamins, and minerals. It is particularly high in omega-3 fatty acids, which have been linked to a lower risk of heart disease, stroke, and other chronic conditions. Additionally, seafood is often low in saturated fat and calories, making it a healthy option for those looking to maintain or lose weight. However, some types of seafood may be contaminated with mercury or other pollutants, which can be harmful to human health, particularly for pregnant women and young children. It is important to choose seafood that is low in mercury and other contaminants, such as wild-caught salmon, sardines, and shrimp, and to prepare seafood in a healthy manner, such as grilling or baking instead of frying. Overall, seafood can be a healthy and delicious addition to a balanced diet, but it is important to be mindful of the potential risks and make informed choices when purchasing and consuming seafood.',
  },
  {
    'category': 'Vegan',
    'cText':
        'A vegan diet is a plant-based eating pattern that excludes all animal products, including meat, fish, dairy, eggs, and honey. Veganism has gained popularity in recent years due to its perceived health and environmental benefits. A vegan diet can offer numerous health benefits, such as a lower risk of heart disease, certain cancers, and type 2 diabetes, as well as lower blood pressure and cholesterol levels. It may also promote weight loss and improve gut health. However, there are some potential drawbacks to a vegan diet, such as a higher risk of nutrient deficiencies, especially vitamin B12, iron, calcium, and omega-3 fatty acids. Vegans need to ensure that they consume adequate amounts of these nutrients through fortified foods or supplements. Additionally, some people may find it challenging to meet their protein needs on a vegan diet, but this can be achieved by consuming a variety of plant-based protein sources such as beans, lentils, tofu, tempeh, and nuts. Overall, a well-planned vegan diet can be a healthy and sustainable eating pattern, but it requires careful consideration and planning to meet all of the body\'s nutrient needs.',
  },
  {
    'category': 'Vegetarian',
    'cText':
        'A vegetarian diet is a plant-based eating pattern that excludes meat, fish, and poultry. Vegetarianism is often associated with numerous health benefits, such as a lower risk of heart disease, certain cancers, and type 2 diabetes, as well as lower blood pressure and cholesterol levels. Additionally, a vegetarian diet can be high in fiber, vitamins, and minerals, which are important for overall health and wellbeing. However, there are some potential drawbacks to a vegetarian diet, such as a higher risk of nutrient deficiencies, particularly vitamin B12, iron, calcium, and omega-3 fatty acids. Vegetarians need to ensure that they consume adequate amounts of these nutrients through fortified foods or supplements. Additionally, some people may find it challenging to meet their protein needs on a vegetarian diet, but this can be achieved by consuming a variety of plant-based protein sources such as beans, lentils, tofu, tempeh, and nuts. Overall, a well-planned vegetarian diet can be a healthy and sustainable eating pattern, but it requires careful consideration and planning to meet all of the body\'s nutrient needs.',
  },
];
