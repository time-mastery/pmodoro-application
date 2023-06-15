// GENERATED CODE - DO NOT MODIFY BY HAND

part of "habit_collection.dart";

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHabitCollectionCollection on Isar {
  IsarCollection<HabitCollection> get habitCollections => this.collection();
}

const HabitCollectionSchema = CollectionSchema(
  name: r"HabitCollection",
  id: -9048742641665595188,
  properties: {
    r"habitColor": PropertySchema(
      id: 0,
      name: r"habitColor",
      type: IsarType.long,
    ),
    r"habitDescription": PropertySchema(
      id: 1,
      name: r"habitDescription",
      type: IsarType.string,
    ),
    r"habitIcon": PropertySchema(
      id: 2,
      name: r"habitIcon",
      type: IsarType.string,
    ),
    r"habitTitle": PropertySchema(
      id: 3,
      name: r"habitTitle",
      type: IsarType.string,
    ),
    r"overviews": PropertySchema(
      id: 4,
      name: r"overviews",
      type: IsarType.stringList,
    ),
    r"uuid": PropertySchema(
      id: 5,
      name: r"uuid",
      type: IsarType.string,
    )
  },
  estimateSize: _habitCollectionEstimateSize,
  serialize: _habitCollectionSerialize,
  deserialize: _habitCollectionDeserialize,
  deserializeProp: _habitCollectionDeserializeProp,
  idName: r"id",
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _habitCollectionGetId,
  getLinks: _habitCollectionGetLinks,
  attach: _habitCollectionAttach,
  version: "3.1.0+1",
);

int _habitCollectionEstimateSize(
  HabitCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.habitDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.habitIcon;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.habitTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.overviews;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.uuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _habitCollectionSerialize(
  HabitCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.habitColor);
  writer.writeString(offsets[1], object.habitDescription);
  writer.writeString(offsets[2], object.habitIcon);
  writer.writeString(offsets[3], object.habitTitle);
  writer.writeStringList(offsets[4], object.overviews);
  writer.writeString(offsets[5], object.uuid);
}

HabitCollection _habitCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HabitCollection();
  object.habitColor = reader.readLongOrNull(offsets[0]);
  object.habitDescription = reader.readStringOrNull(offsets[1]);
  object.habitIcon = reader.readStringOrNull(offsets[2]);
  object.habitTitle = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.overviews = reader.readStringList(offsets[4]);
  object.uuid = reader.readStringOrNull(offsets[5]);
  return object;
}

P _habitCollectionDeserializeProp<P>(
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
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringList(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError("Unknown property with id $propertyId");
  }
}

Id _habitCollectionGetId(HabitCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _habitCollectionGetLinks(HabitCollection object) {
  return [];
}

void _habitCollectionAttach(
    IsarCollection<dynamic> col, Id id, HabitCollection object) {
  object.id = id;
}

extension HabitCollectionQueryWhereSort
    on QueryBuilder<HabitCollection, HabitCollection, QWhere> {
  QueryBuilder<HabitCollection, HabitCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HabitCollectionQueryWhere
    on QueryBuilder<HabitCollection, HabitCollection, QWhereClause> {
  QueryBuilder<HabitCollection, HabitCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterWhereClause>
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

  QueryBuilder<HabitCollection, HabitCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterWhereClause> idBetween(
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

extension HabitCollectionQueryFilter
    on QueryBuilder<HabitCollection, HabitCollection, QFilterCondition> {
  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitColorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"habitColor",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitColorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"habitColor",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitColorEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"habitColor",
        value: value,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitColorGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"habitColor",
        value: value,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitColorLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"habitColor",
        value: value,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitColorBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"habitColor",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"habitDescription",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"habitDescription",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"habitDescription",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"habitDescription",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"habitDescription",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"habitDescription",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"habitDescription",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"habitDescription",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"habitDescription",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"habitDescription",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"habitDescription",
        value: "",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"habitDescription",
        value: "",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitIconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"habitIcon",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitIconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"habitIcon",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitIconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"habitIcon",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitIconGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"habitIcon",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitIconLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"habitIcon",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitIconBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"habitIcon",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitIconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"habitIcon",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitIconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"habitIcon",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitIconContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"habitIcon",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitIconMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"habitIcon",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitIconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"habitIcon",
        value: "",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitIconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"habitIcon",
        value: "",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"habitTitle",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"habitTitle",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitTitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"habitTitle",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"habitTitle",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"habitTitle",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"habitTitle",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"habitTitle",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"habitTitle",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"habitTitle",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"habitTitle",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"habitTitle",
        value: "",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      habitTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"habitTitle",
        value: "",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"id",
        value: value,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
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

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
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

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
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

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"overviews",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"overviews",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"overviews",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"overviews",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"overviews",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"overviews",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"overviews",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"overviews",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"overviews",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"overviews",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"overviews",
        value: "",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"overviews",
        value: "",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r"overviews",
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r"overviews",
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r"overviews",
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r"overviews",
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r"overviews",
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      overviewsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r"overviews",
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"uuid",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"uuid",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      uuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"uuid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      uuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"uuid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      uuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"uuid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      uuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"uuid",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"uuid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"uuid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"uuid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"uuid",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"uuid",
        value: "",
      ));
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"uuid",
        value: "",
      ));
    });
  }
}

extension HabitCollectionQueryObject
    on QueryBuilder<HabitCollection, HabitCollection, QFilterCondition> {}

extension HabitCollectionQueryLinks
    on QueryBuilder<HabitCollection, HabitCollection, QFilterCondition> {}

extension HabitCollectionQuerySortBy
    on QueryBuilder<HabitCollection, HabitCollection, QSortBy> {
  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      sortByHabitColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitColor", Sort.asc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      sortByHabitColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitColor", Sort.desc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      sortByHabitDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitDescription", Sort.asc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      sortByHabitDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitDescription", Sort.desc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      sortByHabitIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitIcon", Sort.asc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      sortByHabitIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitIcon", Sort.desc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      sortByHabitTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitTitle", Sort.asc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      sortByHabitTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitTitle", Sort.desc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"uuid", Sort.asc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"uuid", Sort.desc);
    });
  }
}

extension HabitCollectionQuerySortThenBy
    on QueryBuilder<HabitCollection, HabitCollection, QSortThenBy> {
  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      thenByHabitColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitColor", Sort.asc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      thenByHabitColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitColor", Sort.desc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      thenByHabitDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitDescription", Sort.asc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      thenByHabitDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitDescription", Sort.desc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      thenByHabitIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitIcon", Sort.asc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      thenByHabitIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitIcon", Sort.desc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      thenByHabitTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitTitle", Sort.asc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      thenByHabitTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"habitTitle", Sort.desc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"id", Sort.asc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"id", Sort.desc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"uuid", Sort.asc);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"uuid", Sort.desc);
    });
  }
}

extension HabitCollectionQueryWhereDistinct
    on QueryBuilder<HabitCollection, HabitCollection, QDistinct> {
  QueryBuilder<HabitCollection, HabitCollection, QDistinct>
      distinctByHabitColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"habitColor");
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QDistinct>
      distinctByHabitDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"habitDescription",
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QDistinct> distinctByHabitIcon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"habitIcon", caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QDistinct>
      distinctByHabitTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"habitTitle", caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QDistinct>
      distinctByOverviews() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"overviews");
    });
  }

  QueryBuilder<HabitCollection, HabitCollection, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"uuid", caseSensitive: caseSensitive);
    });
  }
}

extension HabitCollectionQueryProperty
    on QueryBuilder<HabitCollection, HabitCollection, QQueryProperty> {
  QueryBuilder<HabitCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"id");
    });
  }

  QueryBuilder<HabitCollection, int?, QQueryOperations> habitColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"habitColor");
    });
  }

  QueryBuilder<HabitCollection, String?, QQueryOperations>
      habitDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"habitDescription");
    });
  }

  QueryBuilder<HabitCollection, String?, QQueryOperations> habitIconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"habitIcon");
    });
  }

  QueryBuilder<HabitCollection, String?, QQueryOperations>
      habitTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"habitTitle");
    });
  }

  QueryBuilder<HabitCollection, List<String>?, QQueryOperations>
      overviewsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"overviews");
    });
  }

  QueryBuilder<HabitCollection, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"uuid");
    });
  }
}
