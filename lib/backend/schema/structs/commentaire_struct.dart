// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentaireStruct extends FFFirebaseStruct {
  CommentaireStruct({
    String? titre,
    DateTime? date,
    String? description,
    String? image,
    DocumentReference? owner,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titre = titre,
        _date = date,
        _description = description,
        _image = image,
        _owner = owner,
        super(firestoreUtilData);

  // "Titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  set titre(String? val) => _titre = val;

  bool hasTitre() => _titre != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "Owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  set owner(DocumentReference? val) => _owner = val;

  bool hasOwner() => _owner != null;

  static CommentaireStruct fromMap(Map<String, dynamic> data) =>
      CommentaireStruct(
        titre: data['Titre'] as String?,
        date: data['Date'] as DateTime?,
        description: data['Description'] as String?,
        image: data['Image'] as String?,
        owner: data['Owner'] as DocumentReference?,
      );

  static CommentaireStruct? maybeFromMap(dynamic data) => data is Map
      ? CommentaireStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Titre': _titre,
        'Date': _date,
        'Description': _description,
        'Image': _image,
        'Owner': _owner,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Titre': serializeParam(
          _titre,
          ParamType.String,
        ),
        'Date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'Image': serializeParam(
          _image,
          ParamType.String,
        ),
        'Owner': serializeParam(
          _owner,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CommentaireStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentaireStruct(
        titre: deserializeParam(
          data['Titre'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['Date'],
          ParamType.DateTime,
          false,
        ),
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['Image'],
          ParamType.String,
          false,
        ),
        owner: deserializeParam(
          data['Owner'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'CommentaireStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentaireStruct &&
        titre == other.titre &&
        date == other.date &&
        description == other.description &&
        image == other.image &&
        owner == other.owner;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([titre, date, description, image, owner]);
}

CommentaireStruct createCommentaireStruct({
  String? titre,
  DateTime? date,
  String? description,
  String? image,
  DocumentReference? owner,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommentaireStruct(
      titre: titre,
      date: date,
      description: description,
      image: image,
      owner: owner,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommentaireStruct? updateCommentaireStruct(
  CommentaireStruct? commentaire, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    commentaire
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommentaireStructData(
  Map<String, dynamic> firestoreData,
  CommentaireStruct? commentaire,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (commentaire == null) {
    return;
  }
  if (commentaire.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && commentaire.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commentaireData =
      getCommentaireFirestoreData(commentaire, forFieldValue);
  final nestedData =
      commentaireData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = commentaire.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommentaireFirestoreData(
  CommentaireStruct? commentaire, [
  bool forFieldValue = false,
]) {
  if (commentaire == null) {
    return {};
  }
  final firestoreData = mapToFirestore(commentaire.toMap());

  // Add any Firestore field values
  commentaire.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommentaireListFirestoreData(
  List<CommentaireStruct>? commentaires,
) =>
    commentaires?.map((e) => getCommentaireFirestoreData(e, true)).toList() ??
    [];
