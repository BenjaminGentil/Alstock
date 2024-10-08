import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StockChantierRecord extends FirestoreRecord {
  StockChantierRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Chantier" field.
  DocumentReference? _chantier;
  DocumentReference? get chantier => _chantier;
  bool hasChantier() => _chantier != null;

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
    _chantier = snapshotData['Chantier'] as DocumentReference?;
    _produit = snapshotData['Produit'] as DocumentReference?;
    _quantite = castToType<double>(snapshotData['Quantite']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Stock-Chantier')
          : FirebaseFirestore.instance.collectionGroup('Stock-Chantier');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Stock-Chantier').doc(id);

  static Stream<StockChantierRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StockChantierRecord.fromSnapshot(s));

  static Future<StockChantierRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StockChantierRecord.fromSnapshot(s));

  static StockChantierRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StockChantierRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StockChantierRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StockChantierRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StockChantierRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StockChantierRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStockChantierRecordData({
  DocumentReference? chantier,
  DocumentReference? produit,
  double? quantite,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Chantier': chantier,
      'Produit': produit,
      'Quantite': quantite,
    }.withoutNulls,
  );

  return firestoreData;
}

class StockChantierRecordDocumentEquality
    implements Equality<StockChantierRecord> {
  const StockChantierRecordDocumentEquality();

  @override
  bool equals(StockChantierRecord? e1, StockChantierRecord? e2) {
    return e1?.chantier == e2?.chantier &&
        e1?.produit == e2?.produit &&
        e1?.quantite == e2?.quantite;
  }

  @override
  int hash(StockChantierRecord? e) =>
      const ListEquality().hash([e?.chantier, e?.produit, e?.quantite]);

  @override
  bool isValidKey(Object? o) => o is StockChantierRecord;
}
