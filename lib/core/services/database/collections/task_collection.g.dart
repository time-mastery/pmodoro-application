// GENERATED CODE - DO NOT MODIFY BY HAND

part of "task_collection.dart";

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskCollectionCollection on Isar {
  IsarCollection<TaskCollection> get taskCollections => this.collection();
}

const TaskCollectionSchema = CollectionSchema(
  name: r"TaskCollection",
  id: 5562253486380726738,
  properties: {
    r"category": PropertySchema(
      id: 0,
      name: r"category",
      type: IsarType.string,
    ),
    r"deadLineTime": PropertySchema(
      id: 1,
      name: r"deadLineTime",
      type: IsarType.string,
    ),
    r"description": PropertySchema(
      id: 2,
      name: r"description",
      type: IsarType.string,
    ),
    r"done": PropertySchema(
      id: 3,
      name: r"done",
      type: IsarType.bool,
    ),
    r"doneTime": PropertySchema(
      id: 4,
      name: r"doneTime",
      type: IsarType.string,
    ),
    r"title": PropertySchema(
      id: 5,
      name: r"title",
      type: IsarType.string,
    ),
    r"uid": PropertySchema(
      id: 6,
      name: r"uid",
      type: IsarType.string,
    )
  },
  estimateSize: _taskCollectionEstimateSize,
  serialize: _taskCollectionSerialize,
  deserialize: _taskCollectionDeserialize,
  deserializeProp: _taskCollectionDeserializeProp,
  idName: r"id",
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _taskCollectionGetId,
  getLinks: _taskCollectionGetLinks,
  attach: _taskCollectionAttach,
  version: "3.1.0+1",
);

int _taskCollectionEstimateSize(
  TaskCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.deadLineTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.doneTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _taskCollectionSerialize(
  TaskCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category);
  writer.writeString(offsets[1], object.deadLineTime);
  writer.writeString(offsets[2], object.description);
  writer.writeBool(offsets[3], object.done);
  writer.writeString(offsets[4], object.doneTime);
  writer.writeString(offsets[5], object.title);
  writer.writeString(offsets[6], object.uid);
}

TaskCollection _taskCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaskCollection();
  object.category = reader.readStringOrNull(offsets[0]);
  object.deadLineTime = reader.readStringOrNull(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.done = reader.readBoolOrNull(offsets[3]);
  object.doneTime = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.title = reader.readStringOrNull(offsets[5]);
  object.uid = reader.readStringOrNull(offsets[6]);
  return object;
}

P _taskCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError("Unknown property with id $propertyId");
  }
}

Id _taskCollectionGetId(TaskCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskCollectionGetLinks(TaskCollection object) {
  return [];
}

void _taskCollectionAttach(
    IsarCollection<dynamic> col, Id id, TaskCollection object) {
  object.id = id;
}

extension TaskCollectionQueryWhereSort
    on QueryBuilder<TaskCollection, TaskCollection, QWhere> {
  QueryBuilder<TaskCollection, TaskCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaskCollectionQueryWhere
    on QueryBuilder<TaskCollection, TaskCollection, QWhereClause> {
  QueryBuilder<TaskCollection, TaskCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<TaskCollection, TaskCollection, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterWhereClause> idBetween(
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

extension TaskCollectionQueryFilter
    on QueryBuilder<TaskCollection, TaskCollection, QFilterCondition> {
  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"category",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"category",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      categoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"category",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      categoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"category",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      categoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"category",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      categoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"category",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"category",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"category",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"category",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"category",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"category",
        value: "",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"category",
        value: "",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      deadLineTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"deadLineTime",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      deadLineTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"deadLineTime",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      deadLineTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"deadLineTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      deadLineTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"deadLineTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      deadLineTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"deadLineTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      deadLineTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"deadLineTime",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      deadLineTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"deadLineTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      deadLineTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"deadLineTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      deadLineTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"deadLineTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      deadLineTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"deadLineTime",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      deadLineTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"deadLineTime",
        value: "",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      deadLineTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"deadLineTime",
        value: "",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"description",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"description",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"description",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"description",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"description",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"description",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"description",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"description",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"description",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"description",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"description",
        value: "",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"description",
        value: "",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"done",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"done",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"done",
        value: value,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"doneTime",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"doneTime",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"doneTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"doneTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"doneTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"doneTime",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"doneTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"doneTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"doneTime",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"doneTime",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"doneTime",
        value: "",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      doneTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"doneTime",
        value: "",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"id",
        value: value,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
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

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
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

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"title",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"title",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"title",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"title",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"title",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"title",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"title",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"title",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"title",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"title",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"title",
        value: "",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"title",
        value: "",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      uidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r"uid",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      uidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r"uid",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      uidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"uid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      uidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r"uid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      uidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r"uid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      uidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r"uid",
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      uidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r"uid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      uidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r"uid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      uidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r"uid",
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      uidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r"uid",
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r"uid",
        value: "",
      ));
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r"uid",
        value: "",
      ));
    });
  }
}

extension TaskCollectionQueryObject
    on QueryBuilder<TaskCollection, TaskCollection, QFilterCondition> {}

extension TaskCollectionQueryLinks
    on QueryBuilder<TaskCollection, TaskCollection, QFilterCondition> {}

extension TaskCollectionQuerySortBy
    on QueryBuilder<TaskCollection, TaskCollection, QSortBy> {
  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"category", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"category", Sort.desc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy>
      sortByDeadLineTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"deadLineTime", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy>
      sortByDeadLineTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"deadLineTime", Sort.desc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"description", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"description", Sort.desc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> sortByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"done", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> sortByDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"done", Sort.desc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> sortByDoneTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"doneTime", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy>
      sortByDoneTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"doneTime", Sort.desc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"title", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"title", Sort.desc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"uid", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"uid", Sort.desc);
    });
  }
}

extension TaskCollectionQuerySortThenBy
    on QueryBuilder<TaskCollection, TaskCollection, QSortThenBy> {
  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"category", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"category", Sort.desc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy>
      thenByDeadLineTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"deadLineTime", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy>
      thenByDeadLineTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"deadLineTime", Sort.desc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"description", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"description", Sort.desc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> thenByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"done", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> thenByDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"done", Sort.desc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> thenByDoneTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"doneTime", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy>
      thenByDoneTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"doneTime", Sort.desc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"id", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"id", Sort.desc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"title", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"title", Sort.desc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"uid", Sort.asc);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r"uid", Sort.desc);
    });
  }
}

extension TaskCollectionQueryWhereDistinct
    on QueryBuilder<TaskCollection, TaskCollection, QDistinct> {
  QueryBuilder<TaskCollection, TaskCollection, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"category", caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QDistinct>
      distinctByDeadLineTime({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"deadLineTime", caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"description", caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QDistinct> distinctByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"done");
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QDistinct> distinctByDoneTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"doneTime", caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"title", caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskCollection, TaskCollection, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r"uid", caseSensitive: caseSensitive);
    });
  }
}

extension TaskCollectionQueryProperty
    on QueryBuilder<TaskCollection, TaskCollection, QQueryProperty> {
  QueryBuilder<TaskCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"id");
    });
  }

  QueryBuilder<TaskCollection, String?, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"category");
    });
  }

  QueryBuilder<TaskCollection, String?, QQueryOperations>
      deadLineTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"deadLineTime");
    });
  }

  QueryBuilder<TaskCollection, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"description");
    });
  }

  QueryBuilder<TaskCollection, bool?, QQueryOperations> doneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"done");
    });
  }

  QueryBuilder<TaskCollection, String?, QQueryOperations> doneTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"doneTime");
    });
  }

  QueryBuilder<TaskCollection, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"title");
    });
  }

  QueryBuilder<TaskCollection, String?, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r"uid");
    });
  }
}
