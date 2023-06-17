// GENERATED CODE - DO NOT MODIFY BY HAND

part of "daily_goal_collection.dart";

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDailyGoalCollectionCollection on Isar {
  IsarCollection<DailyGoalCollection> get dailyGoalCollections =>
      this.collection();
}

const DailyGoalCollectionSchema = CollectionSchema(
  name: r"DailyGoalCollection",
  id: 9151664406038383939,
  properties: {
    r"count": PropertySchema(
      id: 0,
      name: r"count",
      type: IsarType.long,
    ),
    r"dateTime": PropertySchema(
      id: 1,
      name: r"dateTime",
      type: IsarType.string,
    )
  },
  estimateSize: _dailyGoalCollectionEstimateSize,
  serialize: _dailyGoalCollectionSerialize,
  deserialize: _dailyGoalCollectionDeserialize,
  deserializeProp: _dailyGoalCollectionDeserializeProp,
  idName: r"id",
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dailyGoalCollectionGetId,
  getLinks: _dailyGoalCollectionGetLinks,
  attach: _dailyGoalCollectionAttach,
  version: "3.1.0+1",
);

int _dailyGoalCollectionEstimateSize(
  DailyGoalCollection object,
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
  return bytesCount;
}

void _dailyGoalCollectionSerialize(
  DailyGoalCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.count);
  writer.writeString(offsets[1], object.dateTime);
}

DailyGoalCollection _dailyGoalCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyGoalCollection();
  object.count = reader.readLongOrNull(offsets[0]);
  object.dateTime = reader.readStringOrNull(offsets[1]);
  object.id = id;
  return object;
}

P _dailyGoalCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError("Unknown property with id $propertyId");
  }
}

Id _dailyGoalCollectionGetId(DailyGoalCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dailyGoalCollectionGetLinks(
    DailyGoalCollection object) {
  return [];
}

void _dailyGoalCollectionAttach(
    IsarCollection<dynamic> col, Id id, DailyGoalCollection object) {
  object.id = id;
}

extension DailyGoalCollectionQueryWhereSort
    on QueryBuilder<DailyGoalCollection, DailyGoalCollection, QWhere> {
  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DailyGoalCollectionQueryWhere
    on QueryBuilder<DailyGoalCollection, DailyGoalCollection, QWhereClause> {
  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterWhereClause>
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

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterWhereClause>
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

extension DailyGoalCollectionQueryFilter on QueryBuilder<DailyGoalCollection,
    DailyGoalCollection, QFilterCondition> {
  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
      countIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"count",
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
      countIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"count",
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
      countEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"count",
        value: value,
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
      countGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"count",
        value: value,
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
      countLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"count",
        value: value,
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
      countBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"count",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
      dateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"dateTime",
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
      dateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"dateTime",
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
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

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
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

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
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

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
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

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
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

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
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

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
      dateTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"dateTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
      dateTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"dateTime",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
      dateTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"dateTime",
        value: "",
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
      dateTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"dateTime",
        value: "",
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"id",
        value: value,
      ));
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
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

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
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

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterFilterCondition>
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
}

extension DailyGoalCollectionQueryObject on QueryBuilder<DailyGoalCollection,
    DailyGoalCollection, QFilterCondition> {}

extension DailyGoalCollectionQueryLinks on QueryBuilder<DailyGoalCollection,
    DailyGoalCollection, QFilterCondition> {}

extension DailyGoalCollectionQuerySortBy
    on QueryBuilder<DailyGoalCollection, DailyGoalCollection, QSortBy> {
  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterSortBy>
      sortByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"count", Sort.asc);
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterSortBy>
      sortByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"count", Sort.desc);
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterSortBy>
      sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"dateTime", Sort.asc);
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterSortBy>
      sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"dateTime", Sort.desc);
    });
  }
}

extension DailyGoalCollectionQuerySortThenBy
    on QueryBuilder<DailyGoalCollection, DailyGoalCollection, QSortThenBy> {
  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterSortBy>
      thenByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"count", Sort.asc);
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterSortBy>
      thenByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"count", Sort.desc);
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterSortBy>
      thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"dateTime", Sort.asc);
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterSortBy>
      thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"dateTime", Sort.desc);
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"id", Sort.asc);
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"id", Sort.desc);
    });
  }
}

extension DailyGoalCollectionQueryWhereDistinct
    on QueryBuilder<DailyGoalCollection, DailyGoalCollection, QDistinct> {
  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QDistinct>
      distinctByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"count");
    });
  }

  QueryBuilder<DailyGoalCollection, DailyGoalCollection, QDistinct>
      distinctByDateTime({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"dateTime", caseSensitive: caseSensitive);
    });
  }
}

extension DailyGoalCollectionQueryProperty
    on QueryBuilder<DailyGoalCollection, DailyGoalCollection, QQueryProperty> {
  QueryBuilder<DailyGoalCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"id");
    });
  }

  QueryBuilder<DailyGoalCollection, int?, QQueryOperations> countProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"count");
    });
  }

  QueryBuilder<DailyGoalCollection, String?, QQueryOperations>
      dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"dateTime");
    });
  }
}
