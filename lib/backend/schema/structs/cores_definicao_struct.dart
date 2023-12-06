// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoresDefinicaoStruct extends FFFirebaseStruct {
  CoresDefinicaoStruct({
    Color? primarycolor,
    Color? secondarycolor,
    Color? tertiarycolor,
    Color? alternatecolor,
    Color? primarytext,
    Color? secondarytext,
    Color? primarybackground,
    Color? secondarybackground,
    Color? customBottom,
    Color? customStarPrimary,
    Color? customStarSecondary,
    Color? customAlternateSecondary,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _primarycolor = primarycolor,
        _secondarycolor = secondarycolor,
        _tertiarycolor = tertiarycolor,
        _alternatecolor = alternatecolor,
        _primarytext = primarytext,
        _secondarytext = secondarytext,
        _primarybackground = primarybackground,
        _secondarybackground = secondarybackground,
        _customBottom = customBottom,
        _customStarPrimary = customStarPrimary,
        _customStarSecondary = customStarSecondary,
        _customAlternateSecondary = customAlternateSecondary,
        super(firestoreUtilData);

  // "primarycolor" field.
  Color? _primarycolor;
  Color? get primarycolor => _primarycolor;
  set primarycolor(Color? val) => _primarycolor = val;
  bool hasPrimarycolor() => _primarycolor != null;

  // "secondarycolor" field.
  Color? _secondarycolor;
  Color? get secondarycolor => _secondarycolor;
  set secondarycolor(Color? val) => _secondarycolor = val;
  bool hasSecondarycolor() => _secondarycolor != null;

  // "tertiarycolor" field.
  Color? _tertiarycolor;
  Color? get tertiarycolor => _tertiarycolor;
  set tertiarycolor(Color? val) => _tertiarycolor = val;
  bool hasTertiarycolor() => _tertiarycolor != null;

  // "alternatecolor" field.
  Color? _alternatecolor;
  Color? get alternatecolor => _alternatecolor;
  set alternatecolor(Color? val) => _alternatecolor = val;
  bool hasAlternatecolor() => _alternatecolor != null;

  // "primarytext" field.
  Color? _primarytext;
  Color? get primarytext => _primarytext;
  set primarytext(Color? val) => _primarytext = val;
  bool hasPrimarytext() => _primarytext != null;

  // "secondarytext" field.
  Color? _secondarytext;
  Color? get secondarytext => _secondarytext;
  set secondarytext(Color? val) => _secondarytext = val;
  bool hasSecondarytext() => _secondarytext != null;

  // "primarybackground" field.
  Color? _primarybackground;
  Color? get primarybackground => _primarybackground;
  set primarybackground(Color? val) => _primarybackground = val;
  bool hasPrimarybackground() => _primarybackground != null;

  // "secondarybackground" field.
  Color? _secondarybackground;
  Color? get secondarybackground => _secondarybackground;
  set secondarybackground(Color? val) => _secondarybackground = val;
  bool hasSecondarybackground() => _secondarybackground != null;

  // "CustomBottom" field.
  Color? _customBottom;
  Color? get customBottom => _customBottom;
  set customBottom(Color? val) => _customBottom = val;
  bool hasCustomBottom() => _customBottom != null;

  // "CustomStarPrimary" field.
  Color? _customStarPrimary;
  Color? get customStarPrimary => _customStarPrimary;
  set customStarPrimary(Color? val) => _customStarPrimary = val;
  bool hasCustomStarPrimary() => _customStarPrimary != null;

  // "CustomStarSecondary" field.
  Color? _customStarSecondary;
  Color? get customStarSecondary => _customStarSecondary;
  set customStarSecondary(Color? val) => _customStarSecondary = val;
  bool hasCustomStarSecondary() => _customStarSecondary != null;

  // "CustomAlternateSecondary" field.
  Color? _customAlternateSecondary;
  Color? get customAlternateSecondary => _customAlternateSecondary;
  set customAlternateSecondary(Color? val) => _customAlternateSecondary = val;
  bool hasCustomAlternateSecondary() => _customAlternateSecondary != null;

  static CoresDefinicaoStruct fromMap(Map<String, dynamic> data) =>
      CoresDefinicaoStruct(
        primarycolor: getSchemaColor(data['primarycolor']),
        secondarycolor: getSchemaColor(data['secondarycolor']),
        tertiarycolor: getSchemaColor(data['tertiarycolor']),
        alternatecolor: getSchemaColor(data['alternatecolor']),
        primarytext: getSchemaColor(data['primarytext']),
        secondarytext: getSchemaColor(data['secondarytext']),
        primarybackground: getSchemaColor(data['primarybackground']),
        secondarybackground: getSchemaColor(data['secondarybackground']),
        customBottom: getSchemaColor(data['CustomBottom']),
        customStarPrimary: getSchemaColor(data['CustomStarPrimary']),
        customStarSecondary: getSchemaColor(data['CustomStarSecondary']),
        customAlternateSecondary:
            getSchemaColor(data['CustomAlternateSecondary']),
      );

  static CoresDefinicaoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CoresDefinicaoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'primarycolor': _primarycolor,
        'secondarycolor': _secondarycolor,
        'tertiarycolor': _tertiarycolor,
        'alternatecolor': _alternatecolor,
        'primarytext': _primarytext,
        'secondarytext': _secondarytext,
        'primarybackground': _primarybackground,
        'secondarybackground': _secondarybackground,
        'CustomBottom': _customBottom,
        'CustomStarPrimary': _customStarPrimary,
        'CustomStarSecondary': _customStarSecondary,
        'CustomAlternateSecondary': _customAlternateSecondary,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'primarycolor': serializeParam(
          _primarycolor,
          ParamType.Color,
        ),
        'secondarycolor': serializeParam(
          _secondarycolor,
          ParamType.Color,
        ),
        'tertiarycolor': serializeParam(
          _tertiarycolor,
          ParamType.Color,
        ),
        'alternatecolor': serializeParam(
          _alternatecolor,
          ParamType.Color,
        ),
        'primarytext': serializeParam(
          _primarytext,
          ParamType.Color,
        ),
        'secondarytext': serializeParam(
          _secondarytext,
          ParamType.Color,
        ),
        'primarybackground': serializeParam(
          _primarybackground,
          ParamType.Color,
        ),
        'secondarybackground': serializeParam(
          _secondarybackground,
          ParamType.Color,
        ),
        'CustomBottom': serializeParam(
          _customBottom,
          ParamType.Color,
        ),
        'CustomStarPrimary': serializeParam(
          _customStarPrimary,
          ParamType.Color,
        ),
        'CustomStarSecondary': serializeParam(
          _customStarSecondary,
          ParamType.Color,
        ),
        'CustomAlternateSecondary': serializeParam(
          _customAlternateSecondary,
          ParamType.Color,
        ),
      }.withoutNulls;

  static CoresDefinicaoStruct fromSerializableMap(Map<String, dynamic> data) =>
      CoresDefinicaoStruct(
        primarycolor: deserializeParam(
          data['primarycolor'],
          ParamType.Color,
          false,
        ),
        secondarycolor: deserializeParam(
          data['secondarycolor'],
          ParamType.Color,
          false,
        ),
        tertiarycolor: deserializeParam(
          data['tertiarycolor'],
          ParamType.Color,
          false,
        ),
        alternatecolor: deserializeParam(
          data['alternatecolor'],
          ParamType.Color,
          false,
        ),
        primarytext: deserializeParam(
          data['primarytext'],
          ParamType.Color,
          false,
        ),
        secondarytext: deserializeParam(
          data['secondarytext'],
          ParamType.Color,
          false,
        ),
        primarybackground: deserializeParam(
          data['primarybackground'],
          ParamType.Color,
          false,
        ),
        secondarybackground: deserializeParam(
          data['secondarybackground'],
          ParamType.Color,
          false,
        ),
        customBottom: deserializeParam(
          data['CustomBottom'],
          ParamType.Color,
          false,
        ),
        customStarPrimary: deserializeParam(
          data['CustomStarPrimary'],
          ParamType.Color,
          false,
        ),
        customStarSecondary: deserializeParam(
          data['CustomStarSecondary'],
          ParamType.Color,
          false,
        ),
        customAlternateSecondary: deserializeParam(
          data['CustomAlternateSecondary'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'CoresDefinicaoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CoresDefinicaoStruct &&
        primarycolor == other.primarycolor &&
        secondarycolor == other.secondarycolor &&
        tertiarycolor == other.tertiarycolor &&
        alternatecolor == other.alternatecolor &&
        primarytext == other.primarytext &&
        secondarytext == other.secondarytext &&
        primarybackground == other.primarybackground &&
        secondarybackground == other.secondarybackground &&
        customBottom == other.customBottom &&
        customStarPrimary == other.customStarPrimary &&
        customStarSecondary == other.customStarSecondary &&
        customAlternateSecondary == other.customAlternateSecondary;
  }

  @override
  int get hashCode => const ListEquality().hash([
        primarycolor,
        secondarycolor,
        tertiarycolor,
        alternatecolor,
        primarytext,
        secondarytext,
        primarybackground,
        secondarybackground,
        customBottom,
        customStarPrimary,
        customStarSecondary,
        customAlternateSecondary
      ]);
}

CoresDefinicaoStruct createCoresDefinicaoStruct({
  Color? primarycolor,
  Color? secondarycolor,
  Color? tertiarycolor,
  Color? alternatecolor,
  Color? primarytext,
  Color? secondarytext,
  Color? primarybackground,
  Color? secondarybackground,
  Color? customBottom,
  Color? customStarPrimary,
  Color? customStarSecondary,
  Color? customAlternateSecondary,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CoresDefinicaoStruct(
      primarycolor: primarycolor,
      secondarycolor: secondarycolor,
      tertiarycolor: tertiarycolor,
      alternatecolor: alternatecolor,
      primarytext: primarytext,
      secondarytext: secondarytext,
      primarybackground: primarybackground,
      secondarybackground: secondarybackground,
      customBottom: customBottom,
      customStarPrimary: customStarPrimary,
      customStarSecondary: customStarSecondary,
      customAlternateSecondary: customAlternateSecondary,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CoresDefinicaoStruct? updateCoresDefinicaoStruct(
  CoresDefinicaoStruct? coresDefinicao, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    coresDefinicao
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCoresDefinicaoStructData(
  Map<String, dynamic> firestoreData,
  CoresDefinicaoStruct? coresDefinicao,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (coresDefinicao == null) {
    return;
  }
  if (coresDefinicao.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && coresDefinicao.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final coresDefinicaoData =
      getCoresDefinicaoFirestoreData(coresDefinicao, forFieldValue);
  final nestedData =
      coresDefinicaoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = coresDefinicao.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCoresDefinicaoFirestoreData(
  CoresDefinicaoStruct? coresDefinicao, [
  bool forFieldValue = false,
]) {
  if (coresDefinicao == null) {
    return {};
  }
  final firestoreData = mapToFirestore(coresDefinicao.toMap());

  // Add any Firestore field values
  coresDefinicao.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCoresDefinicaoListFirestoreData(
  List<CoresDefinicaoStruct>? coresDefinicaos,
) =>
    coresDefinicaos
        ?.map((e) => getCoresDefinicaoFirestoreData(e, true))
        .toList() ??
    [];
