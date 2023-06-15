// GENERATED CODE - DO NOT MODIFY BY HAND

part of "habit_tracker_collection.dart";

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHabitTrackerCollectionCollection on Isar {
  IsarCollection<HabitTrackerCollection> get habitTrackerCollections =>
      this.collection();
}

const HabitTrackerCollectionSchema = CollectionSchema(
  name: r"HabitTrackerCollection",
  id: 8402804562760761386,
  properties: {
    r"dateTime": PropertySchema(
      id: 0,
      name: r"dateTime",
      type: IsarType.dateTime,
    ),
    r"habitId": PropertySchema(
      id: 1,
      name: r"habitId",
      type: IsarType.string,
    )
  },
  estimateSize: _habitTrackerCollectionEstimateSize,
  serialize: _habitTrackerCollectionSerialize,
  deserialize: _habitTrackerCollectionDeserialize,
  deserializeProp: _habitTrackerCollectionDeserializeProp,
  idName: r"id",
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _habitTrackerCollectionGetId,
  getLinks: _habitTrackerCollectionGetLinks,
  attach: _habitTrackerCollectionAttach,
  version: "3.1.0+1",
);

int _habitTrackerCollectionEstimateSize(
  HabitTrackerCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.habitId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _habitTrackerCollectionSerialize(
  HabitTrackerCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateTime);
  writer.writeString(offsets[1], object.habitId);
}

HabitTrackerCollection _habitTrackerCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HabitTrackerCollection();
  object.dateTime = reader.readDateTimeOrNull(offsets[0]);
  object.habitId = reader.readStringOrNull(offsets[1]);
  object.id = id;
  return object;
}

P _habitTrackerCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError("Unknown property with id $propertyId");
  }
}

Id _habitTrackerCollectionGetId(HabitTrackerCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _habitTrackerCollectionGetLinks(
    HabitTrackerCollection object) {
  return [];
}

void _habitTrackerCollectionAttach(
    IsarCollection<dynamic> col, Id id, HabitTrackerCollection object) {
  object.id = id;
}

extension HabitTrackerCollectionQueryWhereSort
    on QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QWhere> {
  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HabitTrackerCollectionQueryWhere on QueryBuilder<
    HabitTrackerCollection, HabitTrackerCollection, QWhereClause> {
  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterWhereClause> idBetween(
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

extension HabitTrackerCollectionQueryFilter on QueryBuilder<
    HabitTrackerCollection, HabitTrackerCollection, QFilterCondition> {
  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> dateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"dateTime",
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> dateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"dateTime",
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> dateTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"dateTime",
        value: value,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> dateTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"dateTime",
        value: value,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> dateTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"dateTime",
        value: value,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> dateTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"dateTime",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> habitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"habitId",
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> habitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"habitId",
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> habitIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"habitId",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> habitIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"habitId",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> habitIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"habitId",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> habitIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"habitId",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> habitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"habitId",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> habitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"habitId",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
          QAfterFilterCondition>
      habitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"habitId",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
          QAfterFilterCondition>
      habitIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"habitId",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> habitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"habitId",
        value: "",
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> habitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"habitId",
        value: "",
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"id",
        value: value,
      ));
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection,
      QAfterFilterCondition> idBetween(
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

extension HabitTrackerCollectionQueryObject on QueryBuilder<
    HabitTrackerCollection, HabitTrackerCollection, QFilterCondition> {}

extension HabitTrackerCollectionQueryLinks on QueryBuilder<
    HabitTrackerCollection, HabitTrackerCollection, QFilterCondition> {}

extension HabitTrackerCollectionQuerySortBy
    on QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QSortBy> {
  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QAfterSortBy>
      sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"dateTime", Sort.asc);
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QAfterSortBy>
      sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"dateTime", Sort.desc);
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QAfterSortBy>
      sortByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitId", Sort.asc);
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QAfterSortBy>
      sortByHabitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitId", Sort.desc);
    });
  }
}

extension HabitTrackerCollectionQuerySortThenBy on QueryBuilder<
    HabitTrackerCollection, HabitTrackerCollection, QSortThenBy> {
  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QAfterSortBy>
      thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"dateTime", Sort.asc);
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QAfterSortBy>
      thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"dateTime", Sort.desc);
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QAfterSortBy>
      thenByHabitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitId", Sort.asc);
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QAfterSortBy>
      thenByHabitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitId", Sort.desc);
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"id", Sort.asc);
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"id", Sort.desc);
    });
  }
}

extension HabitTrackerCollectionQueryWhereDistinct
    on QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QDistinct> {
  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QDistinct>
      distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"dateTime");
    });
  }

  QueryBuilder<HabitTrackerCollection, HabitTrackerCollection, QDistinct>
      distinctByHabitId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"habitId", caseSensitive: caseSensitive);
    });
  }
}

extension HabitTrackerCollectionQueryProperty on QueryBuilder<
    HabitTrackerCollection, HabitTrackerCollection, QQueryProperty> {
  QueryBuilder<HabitTrackerCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"id");
    });
  }

  QueryBuilder<HabitTrackerCollection, DateTime?, QQueryOperations>
      dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"dateTime");
    });
  }

  QueryBuilder<HabitTrackerCollection, String?, QQueryOperations>
      habitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"habitId");
    });
  }
}
