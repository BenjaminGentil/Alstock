import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StockDepotRecord extends FirestoreRecord {
  StockDepotRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Depot" field.
  DocumentReference? _depot;
  DocumentReference? get depot => _depot;
  bool hasDepot() => _depot != null;

  // "Produit" field.
  DocumentReference? _produit;
  DocumentReference? get produit => _produit;
  bool hasProduit() => _produit != null;

  // "Quantite" field.
  double? _quantite;
  double get quantite => _quantite ?? 0.0;
  bool hasQuantite() => _quantite != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _depot = snapshotData['Depot'] as DocumentReference?;
    _produit = snapshotData['Produit'] as DocumentReference?;
    _quantite = castToType<double>(snapshotData['Quantite']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Stock-Depot')
          : FirebaseFirestore.instance.collectionGroup('Stock-Depot');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Stock-Depot').doc(id);

  static Stream<StockDepotRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StockDepotRecord.fromSnapshot(s));

  static Future<StockDepotRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StockDepotRecord.fromSnapshot(s));

  static StockDepotRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StockDepotRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StockDepotRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StockDepotRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StockDepotRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StockDepotRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStockDepotRecordData({
  DocumentReference? depot,
  DocumentReference? produit,
  double? quantite,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Depot': depot,
      'Produit': produit,
      'Quantite': quantite,
    }.withoutNulls,
  );

  return firestoreData;
}

class StockDepotRecordDocumentEquality implements Equality<StockDepotRecord> {
  const StockDepotRecordDocumentEquality();

  @override
  bool equals(StockDepotRecord? e1, StockDepotRecord? e2) {
    return e1?.depot == e2?.depot &&
        e1?.produit == e2?.produit &&
        e1?.quantite == e2?.quantite;
  }

  @override
  int hash(StockDepotRecord? e) =>
      const ListEquality().hash([e?.depot, e?.produit, e?.quantite]);

  @override
  bool isValidKey(Object? o) => o is StockDepotRecord;
}
