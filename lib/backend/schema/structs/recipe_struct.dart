// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipeStruct extends FFFirebaseStruct {
  RecipeStruct({
    String? recipeName,
    String? picture,
    List<String>? ingredients,
    List<String>? steps,
    int? calories,
    int? protein,
    int? carbs,
    int? fat,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _recipeName = recipeName,
        _picture = picture,
        _ingredients = ingredients,
        _steps = steps,
        _calories = calories,
        _protein = protein,
        _carbs = carbs,
        _fat = fat,
        super(firestoreUtilData);

  // "recipeName" field.
  String? _recipeName;
  String get recipeName => _recipeName ?? '';
  set recipeName(String? val) => _recipeName = val;

  bool hasRecipeName() => _recipeName != null;

  // "picture" field.
  String? _picture;
  String get picture => _picture ?? '';
  set picture(String? val) => _picture = val;

  bool hasPicture() => _picture != null;

  // "ingredients" field.
  List<String>? _ingredients;
  List<String> get ingredients => _ingredients ?? const [];
  set ingredients(List<String>? val) => _ingredients = val;

  void updateIngredients(Function(List<String>) updateFn) {
    updateFn(_ingredients ??= []);
  }

  bool hasIngredients() => _ingredients != null;

  // "steps" field.
  List<String>? _steps;
  List<String> get steps => _steps ?? const [];
  set steps(List<String>? val) => _steps = val;

  void updateSteps(Function(List<String>) updateFn) {
    updateFn(_steps ??= []);
  }

  bool hasSteps() => _steps != null;

  // "calories" field.
  int? _calories;
  int get calories => _calories ?? 0;
  set calories(int? val) => _calories = val;

  void incrementCalories(int amount) => calories = calories + amount;

  bool hasCalories() => _calories != null;

  // "protein" field.
  int? _protein;
  int get protein => _protein ?? 0;
  set protein(int? val) => _protein = val;

  void incrementProtein(int amount) => protein = protein + amount;

  bool hasProtein() => _protein != null;

  // "carbs" field.
  int? _carbs;
  int get carbs => _carbs ?? 0;
  set carbs(int? val) => _carbs = val;

  void incrementCarbs(int amount) => carbs = carbs + amount;

  bool hasCarbs() => _carbs != null;

  // "fat" field.
  int? _fat;
  int get fat => _fat ?? 0;
  set fat(int? val) => _fat = val;

  void incrementFat(int amount) => fat = fat + amount;

  bool hasFat() => _fat != null;

  static RecipeStruct fromMap(Map<String, dynamic> data) => RecipeStruct(
        recipeName: data['recipeName'] as String?,
        picture: data['picture'] as String?,
        ingredients: getDataList(data['ingredients']),
        steps: getDataList(data['steps']),
        calories: castToType<int>(data['calories']),
        protein: castToType<int>(data['protein']),
        carbs: castToType<int>(data['carbs']),
        fat: castToType<int>(data['fat']),
      );

  static RecipeStruct? maybeFromMap(dynamic data) =>
      data is Map ? RecipeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'recipeName': _recipeName,
        'picture': _picture,
        'ingredients': _ingredients,
        'steps': _steps,
        'calories': _calories,
        'protein': _protein,
        'carbs': _carbs,
        'fat': _fat,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'recipeName': serializeParam(
          _recipeName,
          ParamType.String,
        ),
        'picture': serializeParam(
          _picture,
          ParamType.String,
        ),
        'ingredients': serializeParam(
          _ingredients,
          ParamType.String,
          isList: true,
        ),
        'steps': serializeParam(
          _steps,
          ParamType.String,
          isList: true,
        ),
        'calories': serializeParam(
          _calories,
          ParamType.int,
        ),
        'protein': serializeParam(
          _protein,
          ParamType.int,
        ),
        'carbs': serializeParam(
          _carbs,
          ParamType.int,
        ),
        'fat': serializeParam(
          _fat,
          ParamType.int,
        ),
      }.withoutNulls;

  static RecipeStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecipeStruct(
        recipeName: deserializeParam(
          data['recipeName'],
          ParamType.String,
          false,
        ),
        picture: deserializeParam(
          data['picture'],
          ParamType.String,
          false,
        ),
        ingredients: deserializeParam<String>(
          data['ingredients'],
          ParamType.String,
          true,
        ),
        steps: deserializeParam<String>(
          data['steps'],
          ParamType.String,
          true,
        ),
        calories: deserializeParam(
          data['calories'],
          ParamType.int,
          false,
        ),
        protein: deserializeParam(
          data['protein'],
          ParamType.int,
          false,
        ),
        carbs: deserializeParam(
          data['carbs'],
          ParamType.int,
          false,
        ),
        fat: deserializeParam(
          data['fat'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RecipeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RecipeStruct &&
        recipeName == other.recipeName &&
        picture == other.picture &&
        listEquality.equals(ingredients, other.ingredients) &&
        listEquality.equals(steps, other.steps) &&
        calories == other.calories &&
        protein == other.protein &&
        carbs == other.carbs &&
        fat == other.fat;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [recipeName, picture, ingredients, steps, calories, protein, carbs, fat]);
}

RecipeStruct createRecipeStruct({
  String? recipeName,
  String? picture,
  int? calories,
  int? protein,
  int? carbs,
  int? fat,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecipeStruct(
      recipeName: recipeName,
      picture: picture,
      calories: calories,
      protein: protein,
      carbs: carbs,
      fat: fat,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecipeStruct? updateRecipeStruct(
  RecipeStruct? recipe, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recipe
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecipeStructData(
  Map<String, dynamic> firestoreData,
  RecipeStruct? recipe,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recipe == null) {
    return;
  }
  if (recipe.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recipe.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recipeData = getRecipeFirestoreData(recipe, forFieldValue);
  final nestedData = recipeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = recipe.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecipeFirestoreData(
  RecipeStruct? recipe, [
  bool forFieldValue = false,
]) {
  if (recipe == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recipe.toMap());

  // Add any Firestore field values
  recipe.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecipeListFirestoreData(
  List<RecipeStruct>? recipes,
) =>
    recipes?.map((e) => getRecipeFirestoreData(e, true)).toList() ?? [];
