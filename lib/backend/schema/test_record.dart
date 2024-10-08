import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestRecord extends FirestoreRecord {
  TestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "inte" field.
  int? _inte;
  int get inte => _inte ?? 0;
  bool hasInte() => _inte != null;

  void _initializeFields() {
    _inte = castToType<int>(snapshotData['inte']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('test');

  static Stream<TestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestRecord.fromSnapshot(s));

  static Future<TestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestRecord.fromSnapshot(s));

  static TestRecord fromSnapshot(DocumentSnapshot snapshot) => TestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestRecordData({
  int? inte,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'inte': inte,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestRecordDocumentEquality implements Equality<TestRecord> {
  const TestRecordDocumentEquality();

  @override
  bool equals(TestRecord? e1, TestRecord? e2) {
    return e1?.inte == e2?.inte;
  }

  @override
  int hash(TestRecord? e) => const ListEquality().hash([e?.inte]);

  @override
  bool isValidKey(Object? o) => o is TestRecord;
}
