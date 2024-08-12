import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double caloriesCalculation(
  String carbs,
  String protein,
  String fats,
) {
  return double.parse(
    (double.parse(carbs) * 4 +
            double.parse(protein) * 4 +
            double.parse(fats) * 9)
        .toStringAsFixed(1),
  );
}

List<dynamic>? parseRecipe2(String? input) {
  if (input == null || input.isEmpty) {
    return null;
  }

  try {
    // Replace single quotes with double quotes to make it valid JSON
    String validJsonString = input.replaceAll("'", '"');

    // Parse the string into a List of dynamic objects
    List<dynamic> jsonList = json.decode(validJsonString);

    return jsonList;
  } catch (e) {
    print('Error parsing JSON: $e');
    return null;
  }
}

double caloriesCalculationDouble(
  double carbs,
  double protein,
  double fats,
) {
  return double.parse(
    (carbs * 4 + protein * 4 + fats * 9).toStringAsFixed(1),
  );
}

List<RecipeStruct> parseRecipes(String text) {
  final recipePattern = RegExp(
    r'Recipe name:\s*(.*?)\s*picture:\s*(.*?)\s*Ingredients:\s*([\s\S]*?)\s*Steps:\s*([\s\S]*?)\s*Calories:\s*(\d+)\s*Protein:\s*(\d+)g\s*Carbs:\s*(\d+)g\s*Fat:\s*(\d+)g\s*(?=(Recipe name:|$))',
    multiLine: true,
  );

  final matches = recipePattern.allMatches(text);
  final recipes = <RecipeStruct>[];
  print("match");
  for (var match in matches) {
    if (recipes.length >= 3) break;

    print('Matched Recipe:');
    print('Name: ${match.group(1)?.trim()}');
    print('Picture: ${match.group(2)?.trim()}');
    print('Ingredients: ${match.group(3)?.trim()}');
    print('Steps: ${match.group(4)?.trim()}');
    print('Calories: ${match.group(5)}');
    print('Protein: ${match.group(6)}g');
    print('Carbs: ${match.group(7)}g');
    print('Fat: ${match.group(8)}g');
    print('---------------------');

    final name = match.group(1)!.trim();
    final picture = match.group(2)!.trim();
    final ingredients =
        match.group(3)!.trim().split('\n').map((s) => s.trim()).toList();
    final steps =
        match.group(4)!.trim().split('\n').map((s) => s.trim()).toList();
    final calories = int.parse(match.group(5)!);
    final protein = int.parse(match.group(6)!);
    final carbs = int.parse(match.group(7)!);
    final fat = int.parse(match.group(8)!);

    recipes.add(RecipeStruct(
      recipeName: name,
      picture: picture,
      ingredients: ingredients,
      steps: steps,
      calories: calories,
      protein: protein,
      carbs: carbs,
      fat: fat,
    ));
  }

  return recipes;
}

double? strToDoubleFunction(String str) {
  return double.parse(str);
}

DateTime getThirdLastMonday() {
  // Get the date of the second last sunday
  DateTime now = DateTime.now();
  return DateTime(now.year, now.month, now.day)
      .subtract(Duration(days: now.weekday + 13));
}

DateTime getMonday() {
  // Get the date of the second last sunday
  DateTime now = DateTime.now();
  return DateTime(now.year, now.month, now.day)
      .subtract(Duration(days: now.weekday - 1));
}

DateTime getSecondLastMonday() {
  // Get the date of the second last sunday
  DateTime now = DateTime.now();
  return DateTime(now.year, now.month, now.day)
      .subtract(Duration(days: now.weekday + 6));
}

DateTime? getTodayMidnightTime() {
  // get today's midnight time
  DateTime now = DateTime.now();
  DateTime todayMidnight = DateTime(now.year, now.month, now.day);
  return todayMidnight;
}

String getCalorieGoal(UserPrefRecord userData) {
  // The BMR equation for the average American woman is: (4.7 x your height in inches) + (4.35 x your weight in pounds) - (4.7 x your age in years). Add 655 to this total for the BMR.. The BMR equation for the average American man is: (12.7 x your height in inches) + (6.23 x your weight in pounds) - (6.8 x your age in years). Add 66 to the total for the BMR. Please use getAge to calculate age from dOB.

  double heightConvert = feetConvertion(userData.height);

  double bmr;

  if (userData.gender == 'Female') {
    bmr = (15.88 * heightConvert) +
        (4.536 * userData.weight) -
        (5 * getAge(userData.dOB)) -
        161;
  } else {
    bmr = (15.88 * heightConvert) +
        (4.536 * userData.weight) -
        (5 * getAge(userData.dOB)) +
        5;
  }

  double bmr_multiple;
  switch (userData.exerciseLevel) {
    case 'sedentary':
      bmr_multiple = 1.2;
      break;
    case 'lightlyActive':
      bmr_multiple = 1.375;
      break;
    case 'moderatelyActive':
      bmr_multiple = 1.55;
      break;
    case 'veryActive':
      bmr_multiple = 1.7255;
      break;
    default:
      bmr_multiple = 1.9;
      break;
  }

  double goal_multiple;
  switch (userData.fitnessGoal) {
    case 'Weight Loss':
      goal_multiple = 0.8;
      break;
    case 'Weight Gain':
      goal_multiple = 1.2;
      break;
    default:
      goal_multiple = 1;
      break;
  }

  return (bmr * bmr_multiple * goal_multiple).round().toString();
}

int getAge(String dob) {
  // get age of the given date of birth (MM/DD/YYYY)
  DateTime today = DateTime.now();
  DateTime birthDate = DateFormat("MM/dd/yyyy").parse(dob);
  int age = today.year - birthDate.year;
  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }
  return age;
}

double testCode(
  String dOB,
  double height,
  double weight,
  String exerciseLevel,
  String gender,
  String goal,
) {
  double heightConvert = feetConvertion(height);

  double bmr;
  // if (gender == 'Female') {
  //   bmr = (4.7 * heightConvert) + (4.35 * weight) - (4.7 * getAge(dOB)) + 655;
  // } else {
  //   bmr = (12.7 * heightConvert) + (6.23 * weight) - (6.8 * getAge(dOB)) + 66;
  // }

  if (gender == 'Female') {
    bmr = (15.88 * heightConvert) + (4.536 * weight) - (5 * getAge(dOB)) - 161;
  } else {
    bmr = (15.88 * heightConvert) + (4.536 * weight) - (5 * getAge(dOB)) + 5;
  }

  double bmr_multiple;
  switch (exerciseLevel) {
    case 'sedentary':
      bmr_multiple = 1.2;
      break;
    case 'lightlyActive':
      bmr_multiple = 1.375;
      break;
    case 'moderatelyActive':
      bmr_multiple = 1.55;
      break;
    case 'veryActive':
      bmr_multiple = 1.7255;
      break;
    default:
      bmr_multiple = 1.9;
      break;
  }

  double goal_multiple;
  switch (goal) {
    case 'Weight Loss':
      goal_multiple = 0.8;
      break;
    case 'Weight Gain':
      goal_multiple = 1.2;
      break;
    default:
      goal_multiple = 1;
      break;
  }

  return bmr * bmr_multiple * goal_multiple;
}

double feetConvertion(double height) {
  int feet = height.floor();
  double inches = (height - feet) * 100;
  return (feet * 12) + inches;
}

String calculateRemaining(
  String goals,
  String current,
) {
  // Parse strings to integers with default value of 0 if parsing fails
  int parsedVar1 = int.parse(goals);
  int parsedVar2 = int.parse(current);

  // Perform max operation
  int result = math.max(0, parsedVar1 - parsedVar2);

  return result.toString();
}

List<double> getWeeklyCalories(List<MealTrackingRecord>? mealData) {
  // Calculate user's calories by day. Order output from Monday, Tuesday, ... to Sunday. If that day's data does not exist, fill in 0.
  // Define a list of 7 elements to store the total calories for each day of the week
  List<double> weeklyCalories = List.filled(7, 0.0);

  // Define a map to store the meal data by day of the week
  Map<int, List<MealTrackingRecord>> mealDataByDay = {};

  // Group the meal data by day of the week
  if (mealData != null) {
    for (MealTrackingRecord meal in mealData) {
      DateTime currDate = meal.date!;
      int dayOfWeek = currDate.weekday;
      if (!mealDataByDay.containsKey(dayOfWeek)) {
        mealDataByDay[dayOfWeek] = [];
      }
      mealDataByDay[dayOfWeek]!.add(meal);
    }

    // Calculate the total calories for each day of the week
    for (int i = 1; i <= 7; i++) {
      if (mealDataByDay.containsKey(i)) {
        double totalCalories = 0.0;
        for (MealTrackingRecord meal in mealDataByDay[i]!) {
          totalCalories += meal.calories.toInt();
        }
        weeklyCalories[i - 1] = totalCalories;
      }
    }
  }

  return weeklyCalories;
}

String getPrompt(
  String? prepTime,
  String? cookTime,
  String? otherIngredients,
  String? foodPref,
  String? foodAllergy,
  String? fitnessGoal,
) {
  // Give input variables default value if they don't have data
  prepTime = prepTime!.isEmpty ? "20" : prepTime;
  cookTime = cookTime!.isEmpty ? "20" : cookTime;
  otherIngredients = otherIngredients!.isEmpty ? "None" : otherIngredients;
  foodPref = foodPref!.isEmpty ? "everything" : foodPref;
  foodAllergy = foodAllergy!.isEmpty ? "nothing" : foodAllergy;
  fitnessGoal = fitnessGoal!.isEmpty ? "being healthy" : fitnessGoal;

  // System message
  String sysMsg =
      ''' You're an AI assistant good at generating recipe ideas with calorie information. 
      You'll give a recipe idea based on the ingredients in the given photo. Please consider user requirements. 
      Output in this format:''';

  // Primary content / Instruction
  String getIngredients =
      "Provide 3 key ingredients and their weights in gram.";
  String getSteps =
      "Provide 3 key steps for preparing this dish. Each step in a new line with number of the step.";

  // Supporting content: input from ingredients page, user preferences
  String userRequirements =
      "User requirements: Cooking time: $cookTime minutes; preparation time: $prepTime minutes; other ingredients: $otherIngredients.";
  String userPreferences =
      "User's fitness goal is $fitnessGoal, is allergic to $foodAllergy, prefers $foodPref.";

  // Cue: generate in json, log success or not, log error message if any
  String cue =
      "If you cannot analyze the photo or provided ingredients, log false in the isSuccess field and provide error message in the errorMsg field.";
  String format = '''
      {
      "name": "Example Dish",
      "carbs": 25.5,
      "fats": 10.3,
      "proteins": 15.8,
      "ingredients": "ingredient1 150g, ingredient2 200g, ingredient3 10g",
      "steps": "Step 1: Do this. Step 2: Do that.",
      "isSuccess": true,
      "errorMsg": ""
    }
  ''';

  // Combine instructions
  String output = sysMsg +
      format +
      cue +
      getIngredients +
      getSteps +
      userRequirements +
      userPreferences;

  return output;
}

RecipeDTStruct genRecipeVar(String? input) {
  // Returm empty RecipeDT with false indicator
  if (input == null || input.isEmpty) {
    return RecipeDTStruct(
      name: null,
      carbs: 0.0,
      fats: 0.0,
      proteins: 0.0,
      ingredients: null,
      steps: null,
      isSuccess: false,
      errorMsg: null,
    );
  }

  // Try if the string can be decoded and transformed into a RecipeDT, form an empty RecipeDT with false indicator if fails
  try {
    final Map<String, dynamic> jsonMap = json.decode(input);

    // Handling empty strings by setting them to null
    jsonMap.forEach((key, value) {
      if (value is String && value.isEmpty) {
        jsonMap[key] = null;
      }
    });

    return RecipeDTStruct(
      name: jsonMap['name'] as String?,
      carbs: jsonMap['carbs']?.toDouble(),
      fats: jsonMap['carbs']?.toDouble(),
      proteins: jsonMap['proteins']?.toDouble(),
      ingredients: jsonMap['ingredients'] as String?,
      steps: jsonMap['steps'] as String?,
      isSuccess: jsonMap['isSuccess'] as bool?,
      errorMsg: jsonMap['errorMsg'] as String?,
    );
  } catch (e) {
    return RecipeDTStruct(
      name: null,
      carbs: 0.0,
      fats: 0.0,
      proteins: 0.0,
      ingredients: null,
      steps: null,
      isSuccess: false,
      errorMsg: e.toString(),
    );
  }
}
