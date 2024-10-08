import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EntrepriseRecord extends FirestoreRecord {
  EntrepriseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "Admin" field.
  DocumentReference? _admin;
  DocumentReference? get admin => _admin;
  bool hasAdmin() => _admin != null;

  // "Membres" field.
  List<DocumentReference>? _membres;
  List<DocumentReference> get membres => _membres ?? const [];
  bool hasMembres() => _membres != null;

  void _initializeFields() {
    _titre = snapshotData['Titre'] as String?;
    _admin = snapshotData['Admin'] as DocumentReference?;
    _membres = getDataList(snapshotData['Membres']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Entreprise');

  static Stream<EntrepriseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EntrepriseRecord.fromSnapshot(s));

  static Future<EntrepriseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EntrepriseRecord.fromSnapshot(s));

  static EntrepriseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EntrepriseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EntrepriseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EntrepriseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EntrepriseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EntrepriseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEntrepriseRecordData({
  String? titre,
  DocumentReference? admin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Titre': titre,
      'Admin': admin,
    }.withoutNulls,
  );

  return firestoreData;
}

class EntrepriseRecordDocumentEquality implements Equality<EntrepriseRecord> {
  const EntrepriseRecordDocumentEquality();

  @override
  bool equals(EntrepriseRecord? e1, EntrepriseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.titre == e2?.titre &&
        e1?.admin == e2?.admin &&
        listEquality.equals(e1?.membres, e2?.membres);
  }

  @override
  int hash(EntrepriseRecord? e) =>
      const ListEquality().hash([e?.titre, e?.admin, e?.membres]);

  @override
  bool isValidKey(Object? o) => o is EntrepriseRecord;
}
