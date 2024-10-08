import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AchatRecord extends FirestoreRecord {
  AchatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Produit" field.
  DocumentReference? _produit;
  DocumentReference? get produit => _produit;
  bool hasProduit() => _produit != null;

  // "Quantite" field.
  double? _quantite;
  double get quantite => _quantite ?? 0.0;
  bool hasQuantite() => _quantite != null;

  // "PrixUnitaire" field.
  double? _prixUnitaire;
  double get prixUnitaire => _prixUnitaire ?? 0.0;
  bool hasPrixUnitaire() => _prixUnitaire != null;

  // "Statut" field.
  String? _statut;
  String get statut => _statut ?? '';
  bool hasStatut() => _statut != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _produit = snapshotData['Produit'] as DocumentReference?;
    _quantite = castToType<double>(snapshotData['Quantite']);
    _prixUnitaire = castToType<double>(snapshotData['PrixUnitaire']);
    _statut = snapshotData['Statut'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Achat')
          : FirebaseFirestore.instance.collectionGroup('Achat');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Achat').doc(id);

  static Stream<AchatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AchatRecord.fromSnapshot(s));

  static Future<AchatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AchatRecord.fromSnapshot(s));

  static AchatRecord fromSnapshot(DocumentSnapshot snapshot) => AchatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AchatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AchatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AchatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AchatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAchatRecordData({
  DocumentReference? produit,
  double? quantite,
  double? prixUnitaire,
  String? statut,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Produit': produit,
      'Quantite': quantite,
      'PrixUnitaire': prixUnitaire,
      'Statut': statut,
    }.withoutNulls,
  );

  return firestoreData;
}

class AchatRecordDocumentEquality implements Equality<AchatRecord> {
  const AchatRecordDocumentEquality();

  @override
  bool equals(AchatRecord? e1, AchatRecord? e2) {
    return e1?.produit == e2?.produit &&
        e1?.quantite == e2?.quantite &&
        e1?.prixUnitaire == e2?.prixUnitaire &&
        e1?.statut == e2?.statut;
  }

  @override
  int hash(AchatRecord? e) => const ListEquality()
      .hash([e?.produit, e?.quantite, e?.prixUnitaire, e?.statut]);

  @override
  bool isValidKey(Object? o) => o is AchatRecord;
}
