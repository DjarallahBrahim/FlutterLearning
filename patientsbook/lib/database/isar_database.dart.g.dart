// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_database.dart.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetPastientDatasCollection on Isar {
  IsarCollection<PastientDatas> get pastientDatass {
    return getCollection('PastientDatas');
  }
}

final PastientDatasSchema = CollectionSchema(
  name: 'PastientDatas',
  schema:
      '{"name":"PastientDatas","idName":"id","properties":[{"name":"anticedents","type":"String"},{"name":"dateEntre","type":"Long"},{"name":"dateNaissance","type":"Long"},{"name":"dateSortie","type":"Long"},{"name":"diagnostic","type":"String"},{"name":"examenParaclinique","type":"String"},{"name":"nom","type":"String"},{"name":"prenom","type":"String"},{"name":"protocolParaclinique","type":"String"},{"name":"scoreClassification","type":"String"},{"name":"sexe","type":"String"},{"name":"signeCliniques","type":"String"},{"name":"suitePostOperatoire","type":"String"},{"name":"traitement","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _PastientDatasNativeAdapter(),
  webAdapter: const _PastientDatasWebAdapter(),
  idName: 'id',
  propertyIds: {
    'anticedents': 0,
    'dateEntre': 1,
    'dateNaissance': 2,
    'dateSortie': 3,
    'diagnostic': 4,
    'examenParaclinique': 5,
    'nom': 6,
    'prenom': 7,
    'protocolParaclinique': 8,
    'scoreClassification': 9,
    'sexe': 10,
    'signeCliniques': 11,
    'suitePostOperatoire': 12,
    'traitement': 13
  },
  listProperties: {},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _PastientDatasWebAdapter extends IsarWebTypeAdapter<PastientDatas> {
  const _PastientDatasWebAdapter();

  @override
  Object serialize(
      IsarCollection<PastientDatas> collection, PastientDatas object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'anticedents', object.anticedents);
    IsarNative.jsObjectSet(
        jsObj, 'dateEntre', object.dateEntre.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'dateNaissance',
        object.dateNaissance.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(
        jsObj, 'dateSortie', object.dateSortie?.toUtc().millisecondsSinceEpoch);
    IsarNative.jsObjectSet(jsObj, 'diagnostic', object.diagnostic);
    IsarNative.jsObjectSet(
        jsObj, 'examenParaclinique', object.examenParaclinique);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'nom', object.nom);
    IsarNative.jsObjectSet(jsObj, 'prenom', object.prenom);
    IsarNative.jsObjectSet(
        jsObj, 'protocolParaclinique', object.protocolParaclinique);
    IsarNative.jsObjectSet(
        jsObj, 'scoreClassification', object.scoreClassification);
    IsarNative.jsObjectSet(jsObj, 'sexe', object.sexe);
    IsarNative.jsObjectSet(jsObj, 'signeCliniques', object.signeCliniques);
    IsarNative.jsObjectSet(
        jsObj, 'suitePostOperatoire', object.suitePostOperatoire);
    IsarNative.jsObjectSet(jsObj, 'traitement', object.traitement);
    return jsObj;
  }

  @override
  PastientDatas deserialize(
      IsarCollection<PastientDatas> collection, dynamic jsObj) {
    final object = PastientDatas();
    object.anticedents = IsarNative.jsObjectGet(jsObj, 'anticedents') ?? '';
    object.dateEntre = IsarNative.jsObjectGet(jsObj, 'dateEntre') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'dateEntre'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0);
    object.dateNaissance =
        IsarNative.jsObjectGet(jsObj, 'dateNaissance') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'dateNaissance'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0);
    object.dateSortie = IsarNative.jsObjectGet(jsObj, 'dateSortie') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'dateSortie'),
                isUtc: true)
            .toLocal()
        : null;
    object.diagnostic = IsarNative.jsObjectGet(jsObj, 'diagnostic') ?? '';
    object.examenParaclinique =
        IsarNative.jsObjectGet(jsObj, 'examenParaclinique') ?? '';
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.nom = IsarNative.jsObjectGet(jsObj, 'nom') ?? '';
    object.prenom = IsarNative.jsObjectGet(jsObj, 'prenom') ?? '';
    object.protocolParaclinique =
        IsarNative.jsObjectGet(jsObj, 'protocolParaclinique') ?? '';
    object.scoreClassification =
        IsarNative.jsObjectGet(jsObj, 'scoreClassification') ?? '';
    object.sexe = IsarNative.jsObjectGet(jsObj, 'sexe') ?? '';
    object.signeCliniques =
        IsarNative.jsObjectGet(jsObj, 'signeCliniques') ?? '';
    object.suitePostOperatoire =
        IsarNative.jsObjectGet(jsObj, 'suitePostOperatoire') ?? '';
    object.traitement = IsarNative.jsObjectGet(jsObj, 'traitement') ?? '';
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'anticedents':
        return (IsarNative.jsObjectGet(jsObj, 'anticedents') ?? '') as P;
      case 'dateEntre':
        return (IsarNative.jsObjectGet(jsObj, 'dateEntre') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'dateEntre'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'dateNaissance':
        return (IsarNative.jsObjectGet(jsObj, 'dateNaissance') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'dateNaissance'),
                    isUtc: true)
                .toLocal()
            : DateTime.fromMillisecondsSinceEpoch(0)) as P;
      case 'dateSortie':
        return (IsarNative.jsObjectGet(jsObj, 'dateSortie') != null
            ? DateTime.fromMillisecondsSinceEpoch(
                    IsarNative.jsObjectGet(jsObj, 'dateSortie'),
                    isUtc: true)
                .toLocal()
            : null) as P;
      case 'diagnostic':
        return (IsarNative.jsObjectGet(jsObj, 'diagnostic') ?? '') as P;
      case 'examenParaclinique':
        return (IsarNative.jsObjectGet(jsObj, 'examenParaclinique') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'nom':
        return (IsarNative.jsObjectGet(jsObj, 'nom') ?? '') as P;
      case 'prenom':
        return (IsarNative.jsObjectGet(jsObj, 'prenom') ?? '') as P;
      case 'protocolParaclinique':
        return (IsarNative.jsObjectGet(jsObj, 'protocolParaclinique') ?? '')
            as P;
      case 'scoreClassification':
        return (IsarNative.jsObjectGet(jsObj, 'scoreClassification') ?? '')
            as P;
      case 'sexe':
        return (IsarNative.jsObjectGet(jsObj, 'sexe') ?? '') as P;
      case 'signeCliniques':
        return (IsarNative.jsObjectGet(jsObj, 'signeCliniques') ?? '') as P;
      case 'suitePostOperatoire':
        return (IsarNative.jsObjectGet(jsObj, 'suitePostOperatoire') ?? '')
            as P;
      case 'traitement':
        return (IsarNative.jsObjectGet(jsObj, 'traitement') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, PastientDatas object) {}
}

class _PastientDatasNativeAdapter extends IsarNativeTypeAdapter<PastientDatas> {
  const _PastientDatasNativeAdapter();

  @override
  void serialize(
      IsarCollection<PastientDatas> collection,
      IsarRawObject rawObj,
      PastientDatas object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.anticedents;
    final _anticedents = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_anticedents.length) as int;
    final value1 = object.dateEntre;
    final _dateEntre = value1;
    final value2 = object.dateNaissance;
    final _dateNaissance = value2;
    final value3 = object.dateSortie;
    final _dateSortie = value3;
    final value4 = object.diagnostic;
    final _diagnostic = IsarBinaryWriter.utf8Encoder.convert(value4);
    dynamicSize += (_diagnostic.length) as int;
    final value5 = object.examenParaclinique;
    final _examenParaclinique = IsarBinaryWriter.utf8Encoder.convert(value5);
    dynamicSize += (_examenParaclinique.length) as int;
    final value6 = object.nom;
    final _nom = IsarBinaryWriter.utf8Encoder.convert(value6);
    dynamicSize += (_nom.length) as int;
    final value7 = object.prenom;
    final _prenom = IsarBinaryWriter.utf8Encoder.convert(value7);
    dynamicSize += (_prenom.length) as int;
    final value8 = object.protocolParaclinique;
    final _protocolParaclinique = IsarBinaryWriter.utf8Encoder.convert(value8);
    dynamicSize += (_protocolParaclinique.length) as int;
    final value9 = object.scoreClassification;
    final _scoreClassification = IsarBinaryWriter.utf8Encoder.convert(value9);
    dynamicSize += (_scoreClassification.length) as int;
    final value10 = object.sexe;
    final _sexe = IsarBinaryWriter.utf8Encoder.convert(value10);
    dynamicSize += (_sexe.length) as int;
    final value11 = object.signeCliniques;
    final _signeCliniques = IsarBinaryWriter.utf8Encoder.convert(value11);
    dynamicSize += (_signeCliniques.length) as int;
    final value12 = object.suitePostOperatoire;
    final _suitePostOperatoire = IsarBinaryWriter.utf8Encoder.convert(value12);
    dynamicSize += (_suitePostOperatoire.length) as int;
    final value13 = object.traitement;
    final _traitement = IsarBinaryWriter.utf8Encoder.convert(value13);
    dynamicSize += (_traitement.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _anticedents);
    writer.writeDateTime(offsets[1], _dateEntre);
    writer.writeDateTime(offsets[2], _dateNaissance);
    writer.writeDateTime(offsets[3], _dateSortie);
    writer.writeBytes(offsets[4], _diagnostic);
    writer.writeBytes(offsets[5], _examenParaclinique);
    writer.writeBytes(offsets[6], _nom);
    writer.writeBytes(offsets[7], _prenom);
    writer.writeBytes(offsets[8], _protocolParaclinique);
    writer.writeBytes(offsets[9], _scoreClassification);
    writer.writeBytes(offsets[10], _sexe);
    writer.writeBytes(offsets[11], _signeCliniques);
    writer.writeBytes(offsets[12], _suitePostOperatoire);
    writer.writeBytes(offsets[13], _traitement);
  }

  @override
  PastientDatas deserialize(IsarCollection<PastientDatas> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = PastientDatas();
    object.anticedents = reader.readString(offsets[0]);
    object.dateEntre = reader.readDateTime(offsets[1]);
    object.dateNaissance = reader.readDateTime(offsets[2]);
    object.dateSortie = reader.readDateTimeOrNull(offsets[3]);
    object.diagnostic = reader.readString(offsets[4]);
    object.examenParaclinique = reader.readString(offsets[5]);
    object.id = id;
    object.nom = reader.readString(offsets[6]);
    object.prenom = reader.readString(offsets[7]);
    object.protocolParaclinique = reader.readString(offsets[8]);
    object.scoreClassification = reader.readString(offsets[9]);
    object.sexe = reader.readString(offsets[10]);
    object.signeCliniques = reader.readString(offsets[11]);
    object.suitePostOperatoire = reader.readString(offsets[12]);
    object.traitement = reader.readString(offsets[13]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readDateTime(offset)) as P;
      case 2:
        return (reader.readDateTime(offset)) as P;
      case 3:
        return (reader.readDateTimeOrNull(offset)) as P;
      case 4:
        return (reader.readString(offset)) as P;
      case 5:
        return (reader.readString(offset)) as P;
      case 6:
        return (reader.readString(offset)) as P;
      case 7:
        return (reader.readString(offset)) as P;
      case 8:
        return (reader.readString(offset)) as P;
      case 9:
        return (reader.readString(offset)) as P;
      case 10:
        return (reader.readString(offset)) as P;
      case 11:
        return (reader.readString(offset)) as P;
      case 12:
        return (reader.readString(offset)) as P;
      case 13:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, PastientDatas object) {}
}

extension PastientDatasQueryWhereSort
    on QueryBuilder<PastientDatas, PastientDatas, QWhere> {
  QueryBuilder<PastientDatas, PastientDatas, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension PastientDatasQueryWhere
    on QueryBuilder<PastientDatas, PastientDatas, QWhereClause> {
  QueryBuilder<PastientDatas, PastientDatas, QAfterWhereClause> idEqualTo(
      int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterWhereClause> idNotEqualTo(
      int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterWhereClause> idBetween(
    int? lowerId,
    int? upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }
}

extension PastientDatasQueryFilter
    on QueryBuilder<PastientDatas, PastientDatas, QFilterCondition> {
  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      anticedentsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'anticedents',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      anticedentsGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'anticedents',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      anticedentsLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'anticedents',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      anticedentsBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'anticedents',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      anticedentsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'anticedents',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      anticedentsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'anticedents',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      anticedentsContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'anticedents',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      anticedentsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'anticedents',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      dateEntreEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'dateEntre',
      value: value,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      dateEntreGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'dateEntre',
      value: value,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      dateEntreLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'dateEntre',
      value: value,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      dateEntreBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'dateEntre',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      dateNaissanceEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'dateNaissance',
      value: value,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      dateNaissanceGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'dateNaissance',
      value: value,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      dateNaissanceLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'dateNaissance',
      value: value,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      dateNaissanceBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'dateNaissance',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      dateSortieIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'dateSortie',
      value: null,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      dateSortieEqualTo(DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'dateSortie',
      value: value,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      dateSortieGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'dateSortie',
      value: value,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      dateSortieLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'dateSortie',
      value: value,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      dateSortieBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'dateSortie',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      diagnosticEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'diagnostic',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      diagnosticGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'diagnostic',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      diagnosticLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'diagnostic',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      diagnosticBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'diagnostic',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      diagnosticStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'diagnostic',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      diagnosticEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'diagnostic',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      diagnosticContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'diagnostic',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      diagnosticMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'diagnostic',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      examenParacliniqueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'examenParaclinique',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      examenParacliniqueGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'examenParaclinique',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      examenParacliniqueLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'examenParaclinique',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      examenParacliniqueBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'examenParaclinique',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      examenParacliniqueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'examenParaclinique',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      examenParacliniqueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'examenParaclinique',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      examenParacliniqueContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'examenParaclinique',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      examenParacliniqueMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'examenParaclinique',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition> nomEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'nom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      nomGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'nom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition> nomLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'nom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition> nomBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'nom',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      nomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'nom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition> nomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'nom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition> nomContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'nom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition> nomMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'nom',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      prenomEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'prenom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      prenomGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'prenom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      prenomLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'prenom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      prenomBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'prenom',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      prenomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'prenom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      prenomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'prenom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      prenomContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'prenom',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      prenomMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'prenom',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      protocolParacliniqueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'protocolParaclinique',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      protocolParacliniqueGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'protocolParaclinique',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      protocolParacliniqueLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'protocolParaclinique',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      protocolParacliniqueBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'protocolParaclinique',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      protocolParacliniqueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'protocolParaclinique',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      protocolParacliniqueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'protocolParaclinique',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      protocolParacliniqueContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'protocolParaclinique',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      protocolParacliniqueMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'protocolParaclinique',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      scoreClassificationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'scoreClassification',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      scoreClassificationGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'scoreClassification',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      scoreClassificationLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'scoreClassification',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      scoreClassificationBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'scoreClassification',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      scoreClassificationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'scoreClassification',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      scoreClassificationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'scoreClassification',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      scoreClassificationContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'scoreClassification',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      scoreClassificationMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'scoreClassification',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition> sexeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sexe',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      sexeGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sexe',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      sexeLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sexe',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition> sexeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sexe',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      sexeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sexe',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      sexeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sexe',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      sexeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sexe',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition> sexeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sexe',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      signeCliniquesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'signeCliniques',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      signeCliniquesGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'signeCliniques',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      signeCliniquesLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'signeCliniques',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      signeCliniquesBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'signeCliniques',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      signeCliniquesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'signeCliniques',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      signeCliniquesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'signeCliniques',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      signeCliniquesContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'signeCliniques',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      signeCliniquesMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'signeCliniques',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      suitePostOperatoireEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'suitePostOperatoire',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      suitePostOperatoireGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'suitePostOperatoire',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      suitePostOperatoireLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'suitePostOperatoire',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      suitePostOperatoireBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'suitePostOperatoire',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      suitePostOperatoireStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'suitePostOperatoire',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      suitePostOperatoireEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'suitePostOperatoire',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      suitePostOperatoireContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'suitePostOperatoire',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      suitePostOperatoireMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'suitePostOperatoire',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      traitementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'traitement',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      traitementGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'traitement',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      traitementLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'traitement',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      traitementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'traitement',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      traitementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'traitement',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      traitementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'traitement',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      traitementContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'traitement',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterFilterCondition>
      traitementMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'traitement',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension PastientDatasQueryLinks
    on QueryBuilder<PastientDatas, PastientDatas, QFilterCondition> {}

extension PastientDatasQueryWhereSortBy
    on QueryBuilder<PastientDatas, PastientDatas, QSortBy> {
  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> sortByAnticedents() {
    return addSortByInternal('anticedents', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortByAnticedentsDesc() {
    return addSortByInternal('anticedents', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> sortByDateEntre() {
    return addSortByInternal('dateEntre', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortByDateEntreDesc() {
    return addSortByInternal('dateEntre', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortByDateNaissance() {
    return addSortByInternal('dateNaissance', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortByDateNaissanceDesc() {
    return addSortByInternal('dateNaissance', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> sortByDateSortie() {
    return addSortByInternal('dateSortie', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortByDateSortieDesc() {
    return addSortByInternal('dateSortie', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> sortByDiagnostic() {
    return addSortByInternal('diagnostic', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortByDiagnosticDesc() {
    return addSortByInternal('diagnostic', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortByExamenParaclinique() {
    return addSortByInternal('examenParaclinique', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortByExamenParacliniqueDesc() {
    return addSortByInternal('examenParaclinique', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> sortByNom() {
    return addSortByInternal('nom', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> sortByNomDesc() {
    return addSortByInternal('nom', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> sortByPrenom() {
    return addSortByInternal('prenom', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> sortByPrenomDesc() {
    return addSortByInternal('prenom', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortByProtocolParaclinique() {
    return addSortByInternal('protocolParaclinique', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortByProtocolParacliniqueDesc() {
    return addSortByInternal('protocolParaclinique', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortByScoreClassification() {
    return addSortByInternal('scoreClassification', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortByScoreClassificationDesc() {
    return addSortByInternal('scoreClassification', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> sortBySexe() {
    return addSortByInternal('sexe', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> sortBySexeDesc() {
    return addSortByInternal('sexe', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortBySigneCliniques() {
    return addSortByInternal('signeCliniques', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortBySigneCliniquesDesc() {
    return addSortByInternal('signeCliniques', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortBySuitePostOperatoire() {
    return addSortByInternal('suitePostOperatoire', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortBySuitePostOperatoireDesc() {
    return addSortByInternal('suitePostOperatoire', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> sortByTraitement() {
    return addSortByInternal('traitement', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      sortByTraitementDesc() {
    return addSortByInternal('traitement', Sort.desc);
  }
}

extension PastientDatasQueryWhereSortThenBy
    on QueryBuilder<PastientDatas, PastientDatas, QSortThenBy> {
  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> thenByAnticedents() {
    return addSortByInternal('anticedents', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenByAnticedentsDesc() {
    return addSortByInternal('anticedents', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> thenByDateEntre() {
    return addSortByInternal('dateEntre', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenByDateEntreDesc() {
    return addSortByInternal('dateEntre', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenByDateNaissance() {
    return addSortByInternal('dateNaissance', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenByDateNaissanceDesc() {
    return addSortByInternal('dateNaissance', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> thenByDateSortie() {
    return addSortByInternal('dateSortie', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenByDateSortieDesc() {
    return addSortByInternal('dateSortie', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> thenByDiagnostic() {
    return addSortByInternal('diagnostic', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenByDiagnosticDesc() {
    return addSortByInternal('diagnostic', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenByExamenParaclinique() {
    return addSortByInternal('examenParaclinique', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenByExamenParacliniqueDesc() {
    return addSortByInternal('examenParaclinique', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> thenByNom() {
    return addSortByInternal('nom', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> thenByNomDesc() {
    return addSortByInternal('nom', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> thenByPrenom() {
    return addSortByInternal('prenom', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> thenByPrenomDesc() {
    return addSortByInternal('prenom', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenByProtocolParaclinique() {
    return addSortByInternal('protocolParaclinique', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenByProtocolParacliniqueDesc() {
    return addSortByInternal('protocolParaclinique', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenByScoreClassification() {
    return addSortByInternal('scoreClassification', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenByScoreClassificationDesc() {
    return addSortByInternal('scoreClassification', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> thenBySexe() {
    return addSortByInternal('sexe', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> thenBySexeDesc() {
    return addSortByInternal('sexe', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenBySigneCliniques() {
    return addSortByInternal('signeCliniques', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenBySigneCliniquesDesc() {
    return addSortByInternal('signeCliniques', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenBySuitePostOperatoire() {
    return addSortByInternal('suitePostOperatoire', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenBySuitePostOperatoireDesc() {
    return addSortByInternal('suitePostOperatoire', Sort.desc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy> thenByTraitement() {
    return addSortByInternal('traitement', Sort.asc);
  }

  QueryBuilder<PastientDatas, PastientDatas, QAfterSortBy>
      thenByTraitementDesc() {
    return addSortByInternal('traitement', Sort.desc);
  }
}

extension PastientDatasQueryWhereDistinct
    on QueryBuilder<PastientDatas, PastientDatas, QDistinct> {
  QueryBuilder<PastientDatas, PastientDatas, QDistinct> distinctByAnticedents(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('anticedents', caseSensitive: caseSensitive);
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct> distinctByDateEntre() {
    return addDistinctByInternal('dateEntre');
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct>
      distinctByDateNaissance() {
    return addDistinctByInternal('dateNaissance');
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct> distinctByDateSortie() {
    return addDistinctByInternal('dateSortie');
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct> distinctByDiagnostic(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('diagnostic', caseSensitive: caseSensitive);
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct>
      distinctByExamenParaclinique({bool caseSensitive = true}) {
    return addDistinctByInternal('examenParaclinique',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct> distinctByNom(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('nom', caseSensitive: caseSensitive);
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct> distinctByPrenom(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('prenom', caseSensitive: caseSensitive);
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct>
      distinctByProtocolParaclinique({bool caseSensitive = true}) {
    return addDistinctByInternal('protocolParaclinique',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct>
      distinctByScoreClassification({bool caseSensitive = true}) {
    return addDistinctByInternal('scoreClassification',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct> distinctBySexe(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sexe', caseSensitive: caseSensitive);
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct>
      distinctBySigneCliniques({bool caseSensitive = true}) {
    return addDistinctByInternal('signeCliniques',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct>
      distinctBySuitePostOperatoire({bool caseSensitive = true}) {
    return addDistinctByInternal('suitePostOperatoire',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<PastientDatas, PastientDatas, QDistinct> distinctByTraitement(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('traitement', caseSensitive: caseSensitive);
  }
}

extension PastientDatasQueryProperty
    on QueryBuilder<PastientDatas, PastientDatas, QQueryProperty> {
  QueryBuilder<PastientDatas, String, QQueryOperations> anticedentsProperty() {
    return addPropertyNameInternal('anticedents');
  }

  QueryBuilder<PastientDatas, DateTime, QQueryOperations> dateEntreProperty() {
    return addPropertyNameInternal('dateEntre');
  }

  QueryBuilder<PastientDatas, DateTime, QQueryOperations>
      dateNaissanceProperty() {
    return addPropertyNameInternal('dateNaissance');
  }

  QueryBuilder<PastientDatas, DateTime?, QQueryOperations>
      dateSortieProperty() {
    return addPropertyNameInternal('dateSortie');
  }

  QueryBuilder<PastientDatas, String, QQueryOperations> diagnosticProperty() {
    return addPropertyNameInternal('diagnostic');
  }

  QueryBuilder<PastientDatas, String, QQueryOperations>
      examenParacliniqueProperty() {
    return addPropertyNameInternal('examenParaclinique');
  }

  QueryBuilder<PastientDatas, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<PastientDatas, String, QQueryOperations> nomProperty() {
    return addPropertyNameInternal('nom');
  }

  QueryBuilder<PastientDatas, String, QQueryOperations> prenomProperty() {
    return addPropertyNameInternal('prenom');
  }

  QueryBuilder<PastientDatas, String, QQueryOperations>
      protocolParacliniqueProperty() {
    return addPropertyNameInternal('protocolParaclinique');
  }

  QueryBuilder<PastientDatas, String, QQueryOperations>
      scoreClassificationProperty() {
    return addPropertyNameInternal('scoreClassification');
  }

  QueryBuilder<PastientDatas, String, QQueryOperations> sexeProperty() {
    return addPropertyNameInternal('sexe');
  }

  QueryBuilder<PastientDatas, String, QQueryOperations>
      signeCliniquesProperty() {
    return addPropertyNameInternal('signeCliniques');
  }

  QueryBuilder<PastientDatas, String, QQueryOperations>
      suitePostOperatoireProperty() {
    return addPropertyNameInternal('suitePostOperatoire');
  }

  QueryBuilder<PastientDatas, String, QQueryOperations> traitementProperty() {
    return addPropertyNameInternal('traitement');
  }
}
