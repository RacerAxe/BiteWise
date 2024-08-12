import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealTrackingRecord extends FirestoreRecord {
  MealTrackingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "calories" field.
  double? _calories;
  double get calories => _calories ?? 0.0;
  bool hasCalories() => _calories != null;

  // "fat" field.
  double? _fat;
  double get fat => _fat ?? 0.0;
  bool hasFat() => _fat != null;

  // "protein" field.
  double? _protein;
  double get protein => _protein ?? 0.0;
  bool hasProtein() => _protein != null;

  // "carbs" field.
  double? _carbs;
  double get carbs => _carbs ?? 0.0;
  bool hasCarbs() => _carbs != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _calories = castToType<double>(snapshotData['calories']);
    _fat = castToType<double>(snapshotData['fat']);
    _protein = castToType<double>(snapshotData['protein']);
    _carbs = castToType<double>(snapshotData['carbs']);
    _date = snapshotData['date'] as DateTime?;
    _uid = snapshotData['uid'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Meal_Tracking');

  static Stream<MealTrackingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MealTrackingRecord.fromSnapshot(s));

  static Future<MealTrackingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MealTrackingRecord.fromSnapshot(s));

  static MealTrackingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MealTrackingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MealTrackingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MealTrackingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MealTrackingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MealTrackingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMealTrackingRecordData({
  double? calories,
  double? fat,
  double? protein,
  double? carbs,
  DateTime? date,
  DocumentReference? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'calories': calories,
      'fat': fat,
      'protein': protein,
      'carbs': carbs,
      'date': date,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class MealTrackingRecordDocumentEquality
    implements Equality<MealTrackingRecord> {
  const MealTrackingRecordDocumentEquality();

  @override
  bool equals(MealTrackingRecord? e1, MealTrackingRecord? e2) {
    return e1?.calories == e2?.calories &&
        e1?.fat == e2?.fat &&
        e1?.protein == e2?.protein &&
        e1?.carbs == e2?.carbs &&
        e1?.date == e2?.date &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(MealTrackingRecord? e) => const ListEquality()
      .hash([e?.calories, e?.fat, e?.protein, e?.carbs, e?.date, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is MealTrackingRecord;
}
