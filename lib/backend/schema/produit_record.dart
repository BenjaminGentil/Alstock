import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProduitRecord extends FirestoreRecord {
  ProduitRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Unite" field.
  String? _unite;
  String get unite => _unite ?? '';
  bool hasUnite() => _unite != null;

  // "PrixUnitaire" field.
  double? _prixUnitaire;
  double get prixUnitaire => _prixUnitaire ?? 0.0;
  bool hasPrixUnitaire() => _prixUnitaire != null;

  // "QuantiteTotale" field.
  double? _quantiteTotale;
  double get quantiteTotale => _quantiteTotale ?? 0.0;
  bool hasQuantiteTotale() => _quantiteTotale != null;

  // "Categorie" field.
  DocumentReference? _categorie;
  DocumentReference? get categorie => _categorie;
  bool hasCategorie() => _categorie != null;

  // "SousCategorie" field.
  DocumentReference? _sousCategorie;
  DocumentReference? get sousCategorie => _sousCategorie;
  bool hasSousCategorie() => _sousCategorie != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _titre = snapshotData['Titre'] as String?;
    _description = snapshotData['Description'] as String?;
    _image = snapshotData['Image'] as String?;
    _unite = snapshotData['Unite'] as String?;
    _prixUnitaire = castToType<double>(snapshotData['PrixUnitaire']);
    _quantiteTotale = castToType<double>(snapshotData['QuantiteTotale']);
    _categorie = snapshotData['Categorie'] as DocumentReference?;
    _sousCategorie = snapshotData['SousCategorie'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Produit')
          : FirebaseFirestore.instance.collectionGroup('Produit');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Produit').doc(id);

  static Stream<ProduitRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProduitRecord.fromSnapshot(s));

  static Future<ProduitRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProduitRecord.fromSnapshot(s));

  static ProduitRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProduitRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProduitRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProduitRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProduitRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProduitRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProduitRecordData({
  String? titre,
  String? description,
  String? image,
  String? unite,
  double? prixUnitaire,
  double? quantiteTotale,
  DocumentReference? categorie,
  DocumentReference? sousCategorie,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Titre': titre,
      'Description': description,
      'Image': image,
      'Unite': unite,
      'PrixUnitaire': prixUnitaire,
      'QuantiteTotale': quantiteTotale,
      'Categorie': categorie,
      'SousCategorie': sousCategorie,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProduitRecordDocumentEquality implements Equality<ProduitRecord> {
  const ProduitRecordDocumentEquality();

  @override
  bool equals(ProduitRecord? e1, ProduitRecord? e2) {
    return e1?.titre == e2?.titre &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.unite == e2?.unite &&
        e1?.prixUnitaire == e2?.prixUnitaire &&
        e1?.quantiteTotale == e2?.quantiteTotale &&
        e1?.categorie == e2?.categorie &&
        e1?.sousCategorie == e2?.sousCategorie;
  }

  @override
  int hash(ProduitRecord? e) => const ListEquality().hash([
        e?.titre,
        e?.description,
        e?.image,
        e?.unite,
        e?.prixUnitaire,
        e?.quantiteTotale,
        e?.categorie,
        e?.sousCategorie
      ]);

  @override
  bool isValidKey(Object? o) => o is ProduitRecord;
}
