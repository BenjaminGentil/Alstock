import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DepotRecord extends FirestoreRecord {
  DepotRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _titre = snapshotData['Titre'] as String?;
    _type = snapshotData['Type'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Depot')
          : FirebaseFirestore.instance.collectionGroup('Depot');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Depot').doc(id);

  static Stream<DepotRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DepotRecord.fromSnapshot(s));

  static Future<DepotRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DepotRecord.fromSnapshot(s));

  static DepotRecord fromSnapshot(DocumentSnapshot snapshot) => DepotRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DepotRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DepotRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DepotRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DepotRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDepotRecordData({
  String? titre,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Titre': titre,
      'Type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class DepotRecordDocumentEquality implements Equality<DepotRecord> {
  const DepotRecordDocumentEquality();

  @override
  bool equals(DepotRecord? e1, DepotRecord? e2) {
    return e1?.titre == e2?.titre && e1?.type == e2?.type;
  }

  @override
  int hash(DepotRecord? e) => const ListEquality().hash([e?.titre, e?.type]);

  @override
  bool isValidKey(Object? o) => o is DepotRecord;
}
