// GENERATED CODE - DO NOT MODIFY BY HAND

part of "pomodoro_collection.dart";

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPomodoroCollectionCollection on Isar {
  IsarCollection<PomodoroCollection> get pomodoroCollections =>
      this.collection();
}

const PomodoroCollectionSchema = CollectionSchema(
  name: r"PomodoroCollection",
  id: -8169570769239597303,
  properties: {
    r"dateTime": PropertySchema(
      id: 0,
      name: r"dateTime",
      type: IsarType.string,
    ),
    r"duration": PropertySchema(
      id: 1,
      name: r"duration",
      type: IsarType.long,
    ),
    r"taskUid": PropertySchema(
      id: 2,
      name: r"taskUid",
      type: IsarType.string,
    )
  },
  estimateSize: _pomodoroCollectionEstimateSize,
  serialize: _pomodoroCollectionSerialize,
  deserialize: _pomodoroCollectionDeserialize,
  deserializeProp: _pomodoroCollectionDeserializeProp,
  idName: r"id",
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pomodoroCollectionGetId,
  getLinks: _pomodoroCollectionGetLinks,
  attach: _pomodoroCollectionAttach,
  version: "3.1.0+1",
);

int _pomodoroCollectionEstimateSize(
  PomodoroCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dateTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taskUid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _pomodoroCollectionSerialize(
  PomodoroCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.dateTime);
  writer.writeLong(offsets[1], object.duration);
  writer.writeString(offsets[2], object.taskUid);
}

PomodoroCollection _pomodoroCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PomodoroCollection();
  object.dateTime = reader.readStringOrNull(offsets[0]);
  object.duration = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.taskUid = reader.readStringOrNull(offsets[2]);
  return object;
}

P _pomodoroCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError("Unknown property with id $propertyId");
  }
}

Id _pomodoroCollectionGetId(PomodoroCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pomodoroCollectionGetLinks(
    PomodoroCollection object) {
  return [];
}

void _pomodoroCollectionAttach(
    IsarCollection<dynamic> col, Id id, PomodoroCollection object) {
  object.id = id;
}

extension PomodoroCollectionQueryWhereSort
    on QueryBuilder<PomodoroCollection, PomodoroCollection, QWhere> {
  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PomodoroCollectionQueryWhere
    on QueryBuilder<PomodoroCollection, PomodoroCollection, QWhereClause> {
  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PomodoroCollectionQueryFilter
    on QueryBuilder<PomodoroCollection, PomodoroCollection, QFilterCondition> {
  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      dateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"dateTime",
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      dateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"dateTime",
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      dateTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"dateTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      dateTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"dateTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      dateTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"dateTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      dateTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"dateTime",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      dateTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"dateTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      dateTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"dateTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      dateTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"dateTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      dateTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"dateTime",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      dateTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"dateTime",
        value: "",
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      dateTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"dateTime",
        value: "",
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"duration",
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"duration",
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      durationEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"duration",
        value: value,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      durationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"duration",
        value: value,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      durationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"duration",
        value: value,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      durationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"duration",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"id",
        value: value,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"id",
        value: value,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"id",
        value: value,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"id",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      taskUidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"taskUid",
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      taskUidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"taskUid",
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      taskUidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"taskUid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      taskUidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"taskUid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      taskUidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"taskUid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      taskUidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"taskUid",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      taskUidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"taskUid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      taskUidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"taskUid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      taskUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"taskUid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      taskUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"taskUid",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      taskUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"taskUid",
        value: "",
      ));
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterFilterCondition>
      taskUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"taskUid",
        value: "",
      ));
    });
  }
}

extension PomodoroCollectionQueryObject
    on QueryBuilder<PomodoroCollection, PomodoroCollection, QFilterCondition> {}

extension PomodoroCollectionQueryLinks
    on QueryBuilder<PomodoroCollection, PomodoroCollection, QFilterCondition> {}

extension PomodoroCollectionQuerySortBy
    on QueryBuilder<PomodoroCollection, PomodoroCollection, QSortBy> {
  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"dateTime", Sort.asc);
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"dateTime", Sort.desc);
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"duration", Sort.asc);
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"duration", Sort.desc);
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      sortByTaskUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"taskUid", Sort.asc);
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      sortByTaskUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"taskUid", Sort.desc);
    });
  }
}

extension PomodoroCollectionQuerySortThenBy
    on QueryBuilder<PomodoroCollection, PomodoroCollection, QSortThenBy> {
  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"dateTime", Sort.asc);
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"dateTime", Sort.desc);
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"duration", Sort.asc);
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"duration", Sort.desc);
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"id", Sort.asc);
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"id", Sort.desc);
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      thenByTaskUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"taskUid", Sort.asc);
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QAfterSortBy>
      thenByTaskUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"taskUid", Sort.desc);
    });
  }
}

extension PomodoroCollectionQueryWhereDistinct
    on QueryBuilder<PomodoroCollection, PomodoroCollection, QDistinct> {
  QueryBuilder<PomodoroCollection, PomodoroCollection, QDistinct>
      distinctByDateTime({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"dateTime", caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QDistinct>
      distinctByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"duration");
    });
  }

  QueryBuilder<PomodoroCollection, PomodoroCollection, QDistinct>
      distinctByTaskUid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"taskUid", caseSensitive: caseSensitive);
    });
  }
}

extension PomodoroCollectionQueryProperty
    on QueryBuilder<PomodoroCollection, PomodoroCollection, QQueryProperty> {
  QueryBuilder<PomodoroCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"id");
    });
  }

  QueryBuilder<PomodoroCollection, String?, QQueryOperations>
      dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"dateTime");
    });
  }

  QueryBuilder<PomodoroCollection, int?, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"duration");
    });
  }

  QueryBuilder<PomodoroCollection, String?, QQueryOperations>
      taskUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"taskUid");
    });
  }
}
