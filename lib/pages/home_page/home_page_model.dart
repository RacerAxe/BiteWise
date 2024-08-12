import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? proteinData = '0';

  String? carbsData = '0';

  String? fatData = '0';

  String? caloriesData = '0';

  String calorieGoal = '0';

  String? remaining;

  List<double> weeklyCalories = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
  void addToWeeklyCalories(double item) => weeklyCalories.add(item);
  void removeFromWeeklyCalories(double item) => weeklyCalories.remove(item);
  void removeAtIndexFromWeeklyCalories(int index) =>
      weeklyCalories.removeAt(index);
  void insertAtIndexInWeeklyCalories(int index, double item) =>
      weeklyCalories.insert(index, item);
  void updateWeeklyCaloriesAtIndex(int index, Function(double) updateFn) =>
      weeklyCalories[index] = updateFn(weeklyCalories[index]);

  List<String> week = ['1', '2', '3', '4', '5', '6', '7'];
  void addToWeek(String item) => week.add(item);
  void removeFromWeek(String item) => week.remove(item);
  void removeAtIndexFromWeek(int index) => week.removeAt(index);
  void insertAtIndexInWeek(int index, String item) => week.insert(index, item);
  void updateWeekAtIndex(int index, Function(String) updateFn) =>
      week[index] = updateFn(week[index]);

  List<String> weekLetter = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  void addToWeekLetter(String item) => weekLetter.add(item);
  void removeFromWeekLetter(String item) => weekLetter.remove(item);
  void removeAtIndexFromWeekLetter(int index) => weekLetter.removeAt(index);
  void insertAtIndexInWeekLetter(int index, String item) =>
      weekLetter.insert(index, item);
  void updateWeekLetterAtIndex(int index, Function(String) updateFn) =>
      weekLetter[index] = updateFn(weekLetter[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Home_Page widget.
  UserPrefRecord? userPrefData;
  // Stores action output result for [Firestore Query - Query a collection] action in Home_Page widget.
  List<MealTrackingRecord>? todayMeals;
  // Stores action output result for [Firestore Query - Query a collection] action in Home_Page widget.
  List<MealTrackingRecord>? currWeekMeals;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
