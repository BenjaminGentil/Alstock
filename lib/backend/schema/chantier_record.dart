import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChantierRecord extends FirestoreRecord {
  ChantierRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "Adresse" field.
  String? _adresse;
  String get adresse => _adresse ?? '';
  bool hasAdresse() => _adresse != null;

  // "ValeurMax" field.
  double? _valeurMax;
  double get valeurMax => _valeurMax ?? 0.0;
  bool hasValeurMax() => _valeurMax != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _titre = snapshotData['Titre'] as String?;
    _adresse = snapshotData['Adresse'] as String?;
    _valeurMax = castToType<double>(snapshotData['ValeurMax']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Chantier')
          : FirebaseFirestore.instance.collectionGroup('Chantier');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Chantier').doc(id);

  static Stream<ChantierRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChantierRecord.fromSnapshot(s));

  static Future<ChantierRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChantierRecord.fromSnapshot(s));

  static ChantierRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChantierRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChantierRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChantierRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChantierRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChantierRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChantierRecordData({
  String? titre,
  String? adresse,
  double? valeurMax,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Titre': titre,
      'Adresse': adresse,
      'ValeurMax': valeurMax,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChantierRecordDocumentEquality implements Equality<ChantierRecord> {
  const ChantierRecordDocumentEquality();

  @override
  bool equals(ChantierRecord? e1, ChantierRecord? e2) {
    return e1?.titre == e2?.titre &&
        e1?.adresse == e2?.adresse &&
        e1?.valeurMax == e2?.valeurMax;
  }

  @override
  int hash(ChantierRecord? e) =>
      const ListEquality().hash([e?.titre, e?.adresse, e?.valeurMax]);

  @override
  bool isValidKey(Object? o) => o is ChantierRecord;
}
