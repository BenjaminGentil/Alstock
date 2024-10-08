import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategorieRecord extends FirestoreRecord {
  CategorieRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _titre = snapshotData['Titre'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Categorie')
          : FirebaseFirestore.instance.collectionGroup('Categorie');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Categorie').doc(id);

  static Stream<CategorieRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategorieRecord.fromSnapshot(s));

  static Future<CategorieRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategorieRecord.fromSnapshot(s));

  static CategorieRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategorieRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategorieRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategorieRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategorieRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategorieRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategorieRecordData({
  String? titre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Titre': titre,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategorieRecordDocumentEquality implements Equality<CategorieRecord> {
  const CategorieRecordDocumentEquality();

  @override
  bool equals(CategorieRecord? e1, CategorieRecord? e2) {
    return e1?.titre == e2?.titre;
  }

  @override
  int hash(CategorieRecord? e) => const ListEquality().hash([e?.titre]);

  @override
  bool isValidKey(Object? o) => o is CategorieRecord;
}
