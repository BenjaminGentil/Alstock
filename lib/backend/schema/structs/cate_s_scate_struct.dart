// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CateSScateStruct extends FFFirebaseStruct {
  CateSScateStruct({
    DocumentReference? ssCate,
    DocumentReference? cate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ssCate = ssCate,
        _cate = cate,
        super(firestoreUtilData);

  // "SsCate" field.
  DocumentReference? _ssCate;
  DocumentReference? get ssCate => _ssCate;
  set ssCate(DocumentReference? val) => _ssCate = val;

  bool hasSsCate() => _ssCate != null;

  // "Cate" field.
  DocumentReference? _cate;
  DocumentReference? get cate => _cate;
  set cate(DocumentReference? val) => _cate = val;

  bool hasCate() => _cate != null;

  static CateSScateStruct fromMap(Map<String, dynamic> data) =>
      CateSScateStruct(
        ssCate: data['SsCate'] as DocumentReference?,
        cate: data['Cate'] as DocumentReference?,
      );

  static CateSScateStruct? maybeFromMap(dynamic data) => data is Map
      ? CateSScateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'SsCate': _ssCate,
        'Cate': _cate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'SsCate': serializeParam(
          _ssCate,
          ParamType.DocumentReference,
        ),
        'Cate': serializeParam(
          _cate,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CateSScateStruct fromSerializableMap(Map<String, dynamic> data) =>
      CateSScateStruct(
        ssCate: deserializeParam(
          data['SsCate'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Entreprise', 'Sous-categorie'],
        ),
        cate: deserializeParam(
          data['Cate'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Entreprise', 'Categorie'],
        ),
      );

  @override
  String toString() => 'CateSScateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CateSScateStruct &&
        ssCate == other.ssCate &&
        cate == other.cate;
  }

  @override
  int get hashCode => const ListEquality().hash([ssCate, cate]);
}

CateSScateStruct createCateSScateStruct({
  DocumentReference? ssCate,
  DocumentReference? cate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CateSScateStruct(
      ssCate: ssCate,
      cate: cate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CateSScateStruct? updateCateSScateStruct(
  CateSScateStruct? cateSScate, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cateSScate
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCateSScateStructData(
  Map<String, dynamic> firestoreData,
  CateSScateStruct? cateSScate,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cateSScate == null) {
    return;
  }
  if (cateSScate.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cateSScate.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cateSScateData = getCateSScateFirestoreData(cateSScate, forFieldValue);
  final nestedData = cateSScateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cateSScate.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCateSScateFirestoreData(
  CateSScateStruct? cateSScate, [
  bool forFieldValue = false,
]) {
  if (cateSScate == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cateSScate.toMap());

  // Add any Firestore field values
  cateSScate.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCateSScateListFirestoreData(
  List<CateSScateStruct>? cateSScates,
) =>
    cateSScates?.map((e) => getCateSScateFirestoreData(e, true)).toList() ?? [];
