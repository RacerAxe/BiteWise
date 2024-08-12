import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPrefRecord extends FirestoreRecord {
  UserPrefRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "dOB" field.
  String? _dOB;
  String get dOB => _dOB ?? '';
  bool hasDOB() => _dOB != null;

  // "foodAllergy" field.
  String? _foodAllergy;
  String get foodAllergy => _foodAllergy ?? '';
  bool hasFoodAllergy() => _foodAllergy != null;

  // "foodPrefer" field.
  String? _foodPrefer;
  String get foodPrefer => _foodPrefer ?? '';
  bool hasFoodPrefer() => _foodPrefer != null;

  // "exerciseLevel" field.
  String? _exerciseLevel;
  String get exerciseLevel => _exerciseLevel ?? '';
  bool hasExerciseLevel() => _exerciseLevel != null;

  // "fitnessGoal" field.
  String? _fitnessGoal;
  String get fitnessGoal => _fitnessGoal ?? '';
  bool hasFitnessGoal() => _fitnessGoal != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  void _initializeFields() {
    _height = castToType<double>(snapshotData['height']);
    _weight = castToType<double>(snapshotData['weight']);
    _dOB = snapshotData['dOB'] as String?;
    _foodAllergy = snapshotData['foodAllergy'] as String?;
    _foodPrefer = snapshotData['foodPrefer'] as String?;
    _exerciseLevel = snapshotData['exerciseLevel'] as String?;
    _fitnessGoal = snapshotData['fitnessGoal'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _gender = snapshotData['gender'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_pref');

  static Stream<UserPrefRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserPrefRecord.fromSnapshot(s));

  static Future<UserPrefRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserPrefRecord.fromSnapshot(s));

  static UserPrefRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserPrefRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserPrefRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserPrefRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserPrefRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserPrefRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserPrefRecordData({
  double? height,
  double? weight,
  String? dOB,
  String? foodAllergy,
  String? foodPrefer,
  String? exerciseLevel,
  String? fitnessGoal,
  DocumentReference? uid,
  String? gender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'height': height,
      'weight': weight,
      'dOB': dOB,
      'foodAllergy': foodAllergy,
      'foodPrefer': foodPrefer,
      'exerciseLevel': exerciseLevel,
      'fitnessGoal': fitnessGoal,
      'uid': uid,
      'gender': gender,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserPrefRecordDocumentEquality implements Equality<UserPrefRecord> {
  const UserPrefRecordDocumentEquality();

  @override
  bool equals(UserPrefRecord? e1, UserPrefRecord? e2) {
    return e1?.height == e2?.height &&
        e1?.weight == e2?.weight &&
        e1?.dOB == e2?.dOB &&
        e1?.foodAllergy == e2?.foodAllergy &&
        e1?.foodPrefer == e2?.foodPrefer &&
        e1?.exerciseLevel == e2?.exerciseLevel &&
        e1?.fitnessGoal == e2?.fitnessGoal &&
        e1?.uid == e2?.uid &&
        e1?.gender == e2?.gender;
  }

  @override
  int hash(UserPrefRecord? e) => const ListEquality().hash([
        e?.height,
        e?.weight,
        e?.dOB,
        e?.foodAllergy,
        e?.foodPrefer,
        e?.exerciseLevel,
        e?.fitnessGoal,
        e?.uid,
        e?.gender
      ]);

  @override
  bool isValidKey(Object? o) => o is UserPrefRecord;
}
