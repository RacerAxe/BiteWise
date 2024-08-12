// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RecipeDTStruct extends FFFirebaseStruct {
  RecipeDTStruct({
    String? name,
    double? carbs,
    double? fats,
    double? proteins,
    String? ingredients,
    String? steps,
    bool? isSuccess,
    String? errorMsg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _carbs = carbs,
        _fats = fats,
        _proteins = proteins,
        _ingredients = ingredients,
        _steps = steps,
        _isSuccess = isSuccess,
        _errorMsg = errorMsg,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "carbs" field.
  double? _carbs;
  double get carbs => _carbs ?? 0.0;
  set carbs(double? val) => _carbs = val;

  void incrementCarbs(double amount) => carbs = carbs + amount;

  bool hasCarbs() => _carbs != null;

  // "fats" field.
  double? _fats;
  double get fats => _fats ?? 0.0;
  set fats(double? val) => _fats = val;

  void incrementFats(double amount) => fats = fats + amount;

  bool hasFats() => _fats != null;

  // "proteins" field.
  double? _proteins;
  double get proteins => _proteins ?? 0.0;
  set proteins(double? val) => _proteins = val;

  void incrementProteins(double amount) => proteins = proteins + amount;

  bool hasProteins() => _proteins != null;

  // "ingredients" field.
  String? _ingredients;
  String get ingredients => _ingredients ?? '';
  set ingredients(String? val) => _ingredients = val;

  bool hasIngredients() => _ingredients != null;

  // "steps" field.
  String? _steps;
  String get steps => _steps ?? '';
  set steps(String? val) => _steps = val;

  bool hasSteps() => _steps != null;

  // "isSuccess" field.
  bool? _isSuccess;
  bool get isSuccess => _isSuccess ?? true;
  set isSuccess(bool? val) => _isSuccess = val;

  bool hasIsSuccess() => _isSuccess != null;

  // "errorMsg" field.
  String? _errorMsg;
  String get errorMsg => _errorMsg ?? '';
  set errorMsg(String? val) => _errorMsg = val;

  bool hasErrorMsg() => _errorMsg != null;

  static RecipeDTStruct fromMap(Map<String, dynamic> data) => RecipeDTStruct(
        name: data['name'] as String?,
        carbs: castToType<double>(data['carbs']),
        fats: castToType<double>(data['fats']),
        proteins: castToType<double>(data['proteins']),
        ingredients: data['ingredients'] as String?,
        steps: data['steps'] as String?,
        isSuccess: data['isSuccess'] as bool?,
        errorMsg: data['errorMsg'] as String?,
      );

  static RecipeDTStruct? maybeFromMap(dynamic data) =>
      data is Map ? RecipeDTStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'carbs': _carbs,
        'fats': _fats,
        'proteins': _proteins,
        'ingredients': _ingredients,
        'steps': _steps,
        'isSuccess': _isSuccess,
        'errorMsg': _errorMsg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'carbs': serializeParam(
          _carbs,
          ParamType.double,
        ),
        'fats': serializeParam(
          _fats,
          ParamType.double,
        ),
        'proteins': serializeParam(
          _proteins,
          ParamType.double,
        ),
        'ingredients': serializeParam(
          _ingredients,
          ParamType.String,
        ),
        'steps': serializeParam(
          _steps,
          ParamType.String,
        ),
        'isSuccess': serializeParam(
          _isSuccess,
          ParamType.bool,
        ),
        'errorMsg': serializeParam(
          _errorMsg,
          ParamType.String,
        ),
      }.withoutNulls;

  static RecipeDTStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecipeDTStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        carbs: deserializeParam(
          data['carbs'],
          ParamType.double,
          false,
        ),
        fats: deserializeParam(
          data['fats'],
          ParamType.double,
          false,
        ),
        proteins: deserializeParam(
          data['proteins'],
          ParamType.double,
          false,
        ),
        ingredients: deserializeParam(
          data['ingredients'],
          ParamType.String,
          false,
        ),
        steps: deserializeParam(
          data['steps'],
          ParamType.String,
          false,
        ),
        isSuccess: deserializeParam(
          data['isSuccess'],
          ParamType.bool,
          false,
        ),
        errorMsg: deserializeParam(
          data['errorMsg'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RecipeDTStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecipeDTStruct &&
        name == other.name &&
        carbs == other.carbs &&
        fats == other.fats &&
        proteins == other.proteins &&
        ingredients == other.ingredients &&
        steps == other.steps &&
        isSuccess == other.isSuccess &&
        errorMsg == other.errorMsg;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [name, carbs, fats, proteins, ingredients, steps, isSuccess, errorMsg]);
}

RecipeDTStruct createRecipeDTStruct({
  String? name,
  double? carbs,
  double? fats,
  double? proteins,
  String? ingredients,
  String? steps,
  bool? isSuccess,
  String? errorMsg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecipeDTStruct(
      name: name,
      carbs: carbs,
      fats: fats,
      proteins: proteins,
      ingredients: ingredients,
      steps: steps,
      isSuccess: isSuccess,
      errorMsg: errorMsg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecipeDTStruct? updateRecipeDTStruct(
  RecipeDTStruct? recipeDT, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recipeDT
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecipeDTStructData(
  Map<String, dynamic> firestoreData,
  RecipeDTStruct? recipeDT,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recipeDT == null) {
    return;
  }
  if (recipeDT.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recipeDT.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recipeDTData = getRecipeDTFirestoreData(recipeDT, forFieldValue);
  final nestedData = recipeDTData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = recipeDT.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecipeDTFirestoreData(
  RecipeDTStruct? recipeDT, [
  bool forFieldValue = false,
]) {
  if (recipeDT == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recipeDT.toMap());

  // Add any Firestore field values
  recipeDT.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecipeDTListFirestoreData(
  List<RecipeDTStruct>? recipeDTs,
) =>
    recipeDTs?.map((e) => getRecipeDTFirestoreData(e, true)).toList() ?? [];
