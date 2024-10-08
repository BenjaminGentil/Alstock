import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuiviDeChantierRecord extends FirestoreRecord {
  SuiviDeChantierRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Chantier" field.
  DocumentReference? _chantier;
  DocumentReference? get chantier => _chantier;
  bool hasChantier() => _chantier != null;

  // "Titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "DateRendu" field.
  DateTime? _dateRendu;
  DateTime? get dateRendu => _dateRendu;
  bool hasDateRendu() => _dateRendu != null;

  // "Statut" field.
  String? _statut;
  String get statut => _statut ?? '';
  bool hasStatut() => _statut != null;

  // "Commentaire" field.
  List<CommentaireStruct>? _commentaire;
  List<CommentaireStruct> get commentaire => _commentaire ?? const [];
  bool hasCommentaire() => _commentaire != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _chantier = snapshotData['Chantier'] as DocumentReference?;
    _titre = snapshotData['Titre'] as String?;
    _dateRendu = snapshotData['DateRendu'] as DateTime?;
    _statut = snapshotData['Statut'] as String?;
    _commentaire = getStructList(
      snapshotData['Commentaire'],
      CommentaireStruct.fromMap,
    );
    _description = snapshotData['Description'] as String?;
    _image = snapshotData['Image'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('SuiviDeChantier')
          : FirebaseFirestore.instance.collectionGroup('SuiviDeChantier');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('SuiviDeChantier').doc(id);

  static Stream<SuiviDeChantierRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuiviDeChantierRecord.fromSnapshot(s));

  static Future<SuiviDeChantierRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SuiviDeChantierRecord.fromSnapshot(s));

  static SuiviDeChantierRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuiviDeChantierRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuiviDeChantierRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuiviDeChantierRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuiviDeChantierRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuiviDeChantierRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuiviDeChantierRecordData({
  DocumentReference? chantier,
  String? titre,
  DateTime? dateRendu,
  String? statut,
  String? description,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Chantier': chantier,
      'Titre': titre,
      'DateRendu': dateRendu,
      'Statut': statut,
      'Description': description,
      'Image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuiviDeChantierRecordDocumentEquality
    implements Equality<SuiviDeChantierRecord> {
  const SuiviDeChantierRecordDocumentEquality();

  @override
  bool equals(SuiviDeChantierRecord? e1, SuiviDeChantierRecord? e2) {
    const listEquality = ListEquality();
    return e1?.chantier == e2?.chantier &&
        e1?.titre == e2?.titre &&
        e1?.dateRendu == e2?.dateRendu &&
        e1?.statut == e2?.statut &&
        listEquality.equals(e1?.commentaire, e2?.commentaire) &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image;
  }

  @override
  int hash(SuiviDeChantierRecord? e) => const ListEquality().hash([
        e?.chantier,
        e?.titre,
        e?.dateRendu,
        e?.statut,
        e?.commentaire,
        e?.description,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is SuiviDeChantierRecord;
}
