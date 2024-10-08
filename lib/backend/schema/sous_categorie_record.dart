import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SousCategorieRecord extends FirestoreRecord {
  SousCategorieRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Categorie" field.
  DocumentReference? _categorie;
  DocumentReference? get categorie => _categorie;
  bool hasCategorie() => _categorie != null;

  // "Titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _categorie = snapshotData['Categorie'] as DocumentReference?;
    _titre = snapshotData['Titre'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Sous-categorie')
          : FirebaseFirestore.instance.collectionGroup('Sous-categorie');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Sous-categorie').doc(id);

  static Stream<SousCategorieRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SousCategorieRecord.fromSnapshot(s));

  static Future<SousCategorieRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SousCategorieRecord.fromSnapshot(s));

  static SousCategorieRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SousCategorieRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SousCategorieRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SousCategorieRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SousCategorieRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SousCategorieRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSousCategorieRecordData({
  DocumentReference? categorie,
  String? titre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Categorie': categorie,
      'Titre': titre,
    }.withoutNulls,
  );

  return firestoreData;
}

class SousCategorieRecordDocumentEquality
    implements Equality<SousCategorieRecord> {
  const SousCategorieRecordDocumentEquality();

  @override
  bool equals(SousCategorieRecord? e1, SousCategorieRecord? e2) {
    return e1?.categorie == e2?.categorie && e1?.titre == e2?.titre;
  }

  @override
  int hash(SousCategorieRecord? e) =>
      const ListEquality().hash([e?.categorie, e?.titre]);

  @override
  bool isValidKey(Object? o) => o is SousCategorieRecord;
}
