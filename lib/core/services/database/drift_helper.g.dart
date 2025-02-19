// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_helper.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String? title;
  const Category({required this.id, this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
    };
  }

  Category copyWith({int? id, Value<String?> title = const Value.absent()}) =>
      Category(
        id: id ?? this.id,
        title: title.present ? title.value : this.title,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category && other.id == this.id && other.title == this.title);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String?> title;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  CategoriesCompanion copyWith({Value<int>? id, Value<String?>? title}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $DailyGoalsTable extends DailyGoals
    with TableInfo<$DailyGoalsTable, DailyGoal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyGoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _goalDateTimeMeta =
      const VerificationMeta('goalDateTime');
  @override
  late final GeneratedColumn<String> goalDateTime = GeneratedColumn<String>(
      'goal_date_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, count, goalDateTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_goals';
  @override
  VerificationContext validateIntegrity(Insertable<DailyGoal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    }
    if (data.containsKey('goal_date_time')) {
      context.handle(
          _goalDateTimeMeta,
          goalDateTime.isAcceptableOrUnknown(
              data['goal_date_time']!, _goalDateTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyGoal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyGoal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count']),
      goalDateTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goal_date_time']),
    );
  }

  @override
  $DailyGoalsTable createAlias(String alias) {
    return $DailyGoalsTable(attachedDatabase, alias);
  }
}

class DailyGoal extends DataClass implements Insertable<DailyGoal> {
  final int id;
  final int? count;
  final String? goalDateTime;
  const DailyGoal({required this.id, this.count, this.goalDateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || count != null) {
      map['count'] = Variable<int>(count);
    }
    if (!nullToAbsent || goalDateTime != null) {
      map['goal_date_time'] = Variable<String>(goalDateTime);
    }
    return map;
  }

  DailyGoalsCompanion toCompanion(bool nullToAbsent) {
    return DailyGoalsCompanion(
      id: Value(id),
      count:
          count == null && nullToAbsent ? const Value.absent() : Value(count),
      goalDateTime: goalDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(goalDateTime),
    );
  }

  factory DailyGoal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyGoal(
      id: serializer.fromJson<int>(json['id']),
      count: serializer.fromJson<int?>(json['count']),
      goalDateTime: serializer.fromJson<String?>(json['goalDateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'count': serializer.toJson<int?>(count),
      'goalDateTime': serializer.toJson<String?>(goalDateTime),
    };
  }

  DailyGoal copyWith(
          {int? id,
          Value<int?> count = const Value.absent(),
          Value<String?> goalDateTime = const Value.absent()}) =>
      DailyGoal(
        id: id ?? this.id,
        count: count.present ? count.value : this.count,
        goalDateTime:
            goalDateTime.present ? goalDateTime.value : this.goalDateTime,
      );
  DailyGoal copyWithCompanion(DailyGoalsCompanion data) {
    return DailyGoal(
      id: data.id.present ? data.id.value : this.id,
      count: data.count.present ? data.count.value : this.count,
      goalDateTime: data.goalDateTime.present
          ? data.goalDateTime.value
          : this.goalDateTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyGoal(')
          ..write('id: $id, ')
          ..write('count: $count, ')
          ..write('goalDateTime: $goalDateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, count, goalDateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyGoal &&
          other.id == this.id &&
          other.count == this.count &&
          other.goalDateTime == this.goalDateTime);
}

class DailyGoalsCompanion extends UpdateCompanion<DailyGoal> {
  final Value<int> id;
  final Value<int?> count;
  final Value<String?> goalDateTime;
  const DailyGoalsCompanion({
    this.id = const Value.absent(),
    this.count = const Value.absent(),
    this.goalDateTime = const Value.absent(),
  });
  DailyGoalsCompanion.insert({
    this.id = const Value.absent(),
    this.count = const Value.absent(),
    this.goalDateTime = const Value.absent(),
  });
  static Insertable<DailyGoal> custom({
    Expression<int>? id,
    Expression<int>? count,
    Expression<String>? goalDateTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (count != null) 'count': count,
      if (goalDateTime != null) 'goal_date_time': goalDateTime,
    });
  }

  DailyGoalsCompanion copyWith(
      {Value<int>? id, Value<int?>? count, Value<String?>? goalDateTime}) {
    return DailyGoalsCompanion(
      id: id ?? this.id,
      count: count ?? this.count,
      goalDateTime: goalDateTime ?? this.goalDateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (goalDateTime.present) {
      map['goal_date_time'] = Variable<String>(goalDateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyGoalsCompanion(')
          ..write('id: $id, ')
          ..write('count: $count, ')
          ..write('goalDateTime: $goalDateTime')
          ..write(')'))
        .toString();
  }
}

class $HabitsTable extends Habits with TableInfo<$HabitsTable, Habit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _habitTitleMeta =
      const VerificationMeta('habitTitle');
  @override
  late final GeneratedColumn<String> habitTitle = GeneratedColumn<String>(
      'habit_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _habitDescriptionMeta =
      const VerificationMeta('habitDescription');
  @override
  late final GeneratedColumn<String> habitDescription = GeneratedColumn<String>(
      'habit_description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _habitIconMeta =
      const VerificationMeta('habitIcon');
  @override
  late final GeneratedColumn<String> habitIcon = GeneratedColumn<String>(
      'habit_icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _habitColorMeta =
      const VerificationMeta('habitColor');
  @override
  late final GeneratedColumn<int> habitColor = GeneratedColumn<int>(
      'habit_color', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _overviewsMeta =
      const VerificationMeta('overviews');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> overviews =
      GeneratedColumn<String>('overviews', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($HabitsTable.$converteroverviewsn);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        uuid,
        habitTitle,
        habitDescription,
        habitIcon,
        habitColor,
        overviews
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits';
  @override
  VerificationContext validateIntegrity(Insertable<Habit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    }
    if (data.containsKey('habit_title')) {
      context.handle(
          _habitTitleMeta,
          habitTitle.isAcceptableOrUnknown(
              data['habit_title']!, _habitTitleMeta));
    }
    if (data.containsKey('habit_description')) {
      context.handle(
          _habitDescriptionMeta,
          habitDescription.isAcceptableOrUnknown(
              data['habit_description']!, _habitDescriptionMeta));
    }
    if (data.containsKey('habit_icon')) {
      context.handle(_habitIconMeta,
          habitIcon.isAcceptableOrUnknown(data['habit_icon']!, _habitIconMeta));
    }
    if (data.containsKey('habit_color')) {
      context.handle(
          _habitColorMeta,
          habitColor.isAcceptableOrUnknown(
              data['habit_color']!, _habitColorMeta));
    }
    context.handle(_overviewsMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Habit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Habit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid']),
      habitTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}habit_title']),
      habitDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}habit_description']),
      habitIcon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}habit_icon']),
      habitColor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}habit_color']),
      overviews: $HabitsTable.$converteroverviewsn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overviews'])),
    );
  }

  @override
  $HabitsTable createAlias(String alias) {
    return $HabitsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converteroverviews =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $converteroverviewsn =
      NullAwareTypeConverter.wrap($converteroverviews);
}

class Habit extends DataClass implements Insertable<Habit> {
  final int id;
  final String? uuid;
  final String? habitTitle;
  final String? habitDescription;
  final String? habitIcon;
  final int? habitColor;
  final List<String>? overviews;
  const Habit(
      {required this.id,
      this.uuid,
      this.habitTitle,
      this.habitDescription,
      this.habitIcon,
      this.habitColor,
      this.overviews});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || uuid != null) {
      map['uuid'] = Variable<String>(uuid);
    }
    if (!nullToAbsent || habitTitle != null) {
      map['habit_title'] = Variable<String>(habitTitle);
    }
    if (!nullToAbsent || habitDescription != null) {
      map['habit_description'] = Variable<String>(habitDescription);
    }
    if (!nullToAbsent || habitIcon != null) {
      map['habit_icon'] = Variable<String>(habitIcon);
    }
    if (!nullToAbsent || habitColor != null) {
      map['habit_color'] = Variable<int>(habitColor);
    }
    if (!nullToAbsent || overviews != null) {
      map['overviews'] =
          Variable<String>($HabitsTable.$converteroverviewsn.toSql(overviews));
    }
    return map;
  }

  HabitsCompanion toCompanion(bool nullToAbsent) {
    return HabitsCompanion(
      id: Value(id),
      uuid: uuid == null && nullToAbsent ? const Value.absent() : Value(uuid),
      habitTitle: habitTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(habitTitle),
      habitDescription: habitDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(habitDescription),
      habitIcon: habitIcon == null && nullToAbsent
          ? const Value.absent()
          : Value(habitIcon),
      habitColor: habitColor == null && nullToAbsent
          ? const Value.absent()
          : Value(habitColor),
      overviews: overviews == null && nullToAbsent
          ? const Value.absent()
          : Value(overviews),
    );
  }

  factory Habit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Habit(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String?>(json['uuid']),
      habitTitle: serializer.fromJson<String?>(json['habitTitle']),
      habitDescription: serializer.fromJson<String?>(json['habitDescription']),
      habitIcon: serializer.fromJson<String?>(json['habitIcon']),
      habitColor: serializer.fromJson<int?>(json['habitColor']),
      overviews: serializer.fromJson<List<String>?>(json['overviews']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String?>(uuid),
      'habitTitle': serializer.toJson<String?>(habitTitle),
      'habitDescription': serializer.toJson<String?>(habitDescription),
      'habitIcon': serializer.toJson<String?>(habitIcon),
      'habitColor': serializer.toJson<int?>(habitColor),
      'overviews': serializer.toJson<List<String>?>(overviews),
    };
  }

  Habit copyWith(
          {int? id,
          Value<String?> uuid = const Value.absent(),
          Value<String?> habitTitle = const Value.absent(),
          Value<String?> habitDescription = const Value.absent(),
          Value<String?> habitIcon = const Value.absent(),
          Value<int?> habitColor = const Value.absent(),
          Value<List<String>?> overviews = const Value.absent()}) =>
      Habit(
        id: id ?? this.id,
        uuid: uuid.present ? uuid.value : this.uuid,
        habitTitle: habitTitle.present ? habitTitle.value : this.habitTitle,
        habitDescription: habitDescription.present
            ? habitDescription.value
            : this.habitDescription,
        habitIcon: habitIcon.present ? habitIcon.value : this.habitIcon,
        habitColor: habitColor.present ? habitColor.value : this.habitColor,
        overviews: overviews.present ? overviews.value : this.overviews,
      );
  Habit copyWithCompanion(HabitsCompanion data) {
    return Habit(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      habitTitle:
          data.habitTitle.present ? data.habitTitle.value : this.habitTitle,
      habitDescription: data.habitDescription.present
          ? data.habitDescription.value
          : this.habitDescription,
      habitIcon: data.habitIcon.present ? data.habitIcon.value : this.habitIcon,
      habitColor:
          data.habitColor.present ? data.habitColor.value : this.habitColor,
      overviews: data.overviews.present ? data.overviews.value : this.overviews,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Habit(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('habitTitle: $habitTitle, ')
          ..write('habitDescription: $habitDescription, ')
          ..write('habitIcon: $habitIcon, ')
          ..write('habitColor: $habitColor, ')
          ..write('overviews: $overviews')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, uuid, habitTitle, habitDescription, habitIcon, habitColor, overviews);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Habit &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.habitTitle == this.habitTitle &&
          other.habitDescription == this.habitDescription &&
          other.habitIcon == this.habitIcon &&
          other.habitColor == this.habitColor &&
          other.overviews == this.overviews);
}

class HabitsCompanion extends UpdateCompanion<Habit> {
  final Value<int> id;
  final Value<String?> uuid;
  final Value<String?> habitTitle;
  final Value<String?> habitDescription;
  final Value<String?> habitIcon;
  final Value<int?> habitColor;
  final Value<List<String>?> overviews;
  const HabitsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.habitTitle = const Value.absent(),
    this.habitDescription = const Value.absent(),
    this.habitIcon = const Value.absent(),
    this.habitColor = const Value.absent(),
    this.overviews = const Value.absent(),
  });
  HabitsCompanion.insert({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.habitTitle = const Value.absent(),
    this.habitDescription = const Value.absent(),
    this.habitIcon = const Value.absent(),
    this.habitColor = const Value.absent(),
    this.overviews = const Value.absent(),
  });
  static Insertable<Habit> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? habitTitle,
    Expression<String>? habitDescription,
    Expression<String>? habitIcon,
    Expression<int>? habitColor,
    Expression<String>? overviews,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (habitTitle != null) 'habit_title': habitTitle,
      if (habitDescription != null) 'habit_description': habitDescription,
      if (habitIcon != null) 'habit_icon': habitIcon,
      if (habitColor != null) 'habit_color': habitColor,
      if (overviews != null) 'overviews': overviews,
    });
  }

  HabitsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? uuid,
      Value<String?>? habitTitle,
      Value<String?>? habitDescription,
      Value<String?>? habitIcon,
      Value<int?>? habitColor,
      Value<List<String>?>? overviews}) {
    return HabitsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      habitTitle: habitTitle ?? this.habitTitle,
      habitDescription: habitDescription ?? this.habitDescription,
      habitIcon: habitIcon ?? this.habitIcon,
      habitColor: habitColor ?? this.habitColor,
      overviews: overviews ?? this.overviews,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (habitTitle.present) {
      map['habit_title'] = Variable<String>(habitTitle.value);
    }
    if (habitDescription.present) {
      map['habit_description'] = Variable<String>(habitDescription.value);
    }
    if (habitIcon.present) {
      map['habit_icon'] = Variable<String>(habitIcon.value);
    }
    if (habitColor.present) {
      map['habit_color'] = Variable<int>(habitColor.value);
    }
    if (overviews.present) {
      map['overviews'] = Variable<String>(
          $HabitsTable.$converteroverviewsn.toSql(overviews.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('habitTitle: $habitTitle, ')
          ..write('habitDescription: $habitDescription, ')
          ..write('habitIcon: $habitIcon, ')
          ..write('habitColor: $habitColor, ')
          ..write('overviews: $overviews')
          ..write(')'))
        .toString();
  }
}

class $HabitTrackersTable extends HabitTrackers
    with TableInfo<$HabitTrackersTable, HabitTracker> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitTrackersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _habitIdMeta =
      const VerificationMeta('habitId');
  @override
  late final GeneratedColumn<String> habitId = GeneratedColumn<String>(
      'habit_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _creationDateTimeMeta =
      const VerificationMeta('creationDateTime');
  @override
  late final GeneratedColumn<String> creationDateTime = GeneratedColumn<String>(
      'creation_date_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, habitId, creationDateTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_trackers';
  @override
  VerificationContext validateIntegrity(Insertable<HabitTracker> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('habit_id')) {
      context.handle(_habitIdMeta,
          habitId.isAcceptableOrUnknown(data['habit_id']!, _habitIdMeta));
    }
    if (data.containsKey('creation_date_time')) {
      context.handle(
          _creationDateTimeMeta,
          creationDateTime.isAcceptableOrUnknown(
              data['creation_date_time']!, _creationDateTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitTracker map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitTracker(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      habitId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}habit_id']),
      creationDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}creation_date_time']),
    );
  }

  @override
  $HabitTrackersTable createAlias(String alias) {
    return $HabitTrackersTable(attachedDatabase, alias);
  }
}

class HabitTracker extends DataClass implements Insertable<HabitTracker> {
  final int id;
  final String? habitId;
  final String? creationDateTime;
  const HabitTracker({required this.id, this.habitId, this.creationDateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || habitId != null) {
      map['habit_id'] = Variable<String>(habitId);
    }
    if (!nullToAbsent || creationDateTime != null) {
      map['creation_date_time'] = Variable<String>(creationDateTime);
    }
    return map;
  }

  HabitTrackersCompanion toCompanion(bool nullToAbsent) {
    return HabitTrackersCompanion(
      id: Value(id),
      habitId: habitId == null && nullToAbsent
          ? const Value.absent()
          : Value(habitId),
      creationDateTime: creationDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(creationDateTime),
    );
  }

  factory HabitTracker.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitTracker(
      id: serializer.fromJson<int>(json['id']),
      habitId: serializer.fromJson<String?>(json['habitId']),
      creationDateTime: serializer.fromJson<String?>(json['creationDateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'habitId': serializer.toJson<String?>(habitId),
      'creationDateTime': serializer.toJson<String?>(creationDateTime),
    };
  }

  HabitTracker copyWith(
          {int? id,
          Value<String?> habitId = const Value.absent(),
          Value<String?> creationDateTime = const Value.absent()}) =>
      HabitTracker(
        id: id ?? this.id,
        habitId: habitId.present ? habitId.value : this.habitId,
        creationDateTime: creationDateTime.present
            ? creationDateTime.value
            : this.creationDateTime,
      );
  HabitTracker copyWithCompanion(HabitTrackersCompanion data) {
    return HabitTracker(
      id: data.id.present ? data.id.value : this.id,
      habitId: data.habitId.present ? data.habitId.value : this.habitId,
      creationDateTime: data.creationDateTime.present
          ? data.creationDateTime.value
          : this.creationDateTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitTracker(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('creationDateTime: $creationDateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, habitId, creationDateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitTracker &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.creationDateTime == this.creationDateTime);
}

class HabitTrackersCompanion extends UpdateCompanion<HabitTracker> {
  final Value<int> id;
  final Value<String?> habitId;
  final Value<String?> creationDateTime;
  const HabitTrackersCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.creationDateTime = const Value.absent(),
  });
  HabitTrackersCompanion.insert({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.creationDateTime = const Value.absent(),
  });
  static Insertable<HabitTracker> custom({
    Expression<int>? id,
    Expression<String>? habitId,
    Expression<String>? creationDateTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (creationDateTime != null) 'creation_date_time': creationDateTime,
    });
  }

  HabitTrackersCompanion copyWith(
      {Value<int>? id,
      Value<String?>? habitId,
      Value<String?>? creationDateTime}) {
    return HabitTrackersCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      creationDateTime: creationDateTime ?? this.creationDateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<String>(habitId.value);
    }
    if (creationDateTime.present) {
      map['creation_date_time'] = Variable<String>(creationDateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitTrackersCompanion(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('creationDateTime: $creationDateTime')
          ..write(')'))
        .toString();
  }
}

class $PomodorosTable extends Pomodoros
    with TableInfo<$PomodorosTable, Pomodoro> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PomodorosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskUidMeta =
      const VerificationMeta('taskUid');
  @override
  late final GeneratedColumn<String> taskUid = GeneratedColumn<String>(
      'task_uid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _creationDateTimeMeta =
      const VerificationMeta('creationDateTime');
  @override
  late final GeneratedColumn<String> creationDateTime = GeneratedColumn<String>(
      'creation_date_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, taskUid, duration, creationDateTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pomodoros';
  @override
  VerificationContext validateIntegrity(Insertable<Pomodoro> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task_uid')) {
      context.handle(_taskUidMeta,
          taskUid.isAcceptableOrUnknown(data['task_uid']!, _taskUidMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    }
    if (data.containsKey('creation_date_time')) {
      context.handle(
          _creationDateTimeMeta,
          creationDateTime.isAcceptableOrUnknown(
              data['creation_date_time']!, _creationDateTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pomodoro map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pomodoro(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      taskUid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_uid']),
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration']),
      creationDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}creation_date_time']),
    );
  }

  @override
  $PomodorosTable createAlias(String alias) {
    return $PomodorosTable(attachedDatabase, alias);
  }
}

class Pomodoro extends DataClass implements Insertable<Pomodoro> {
  final int id;
  final String? taskUid;
  final int? duration;
  final String? creationDateTime;
  const Pomodoro(
      {required this.id, this.taskUid, this.duration, this.creationDateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || taskUid != null) {
      map['task_uid'] = Variable<String>(taskUid);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || creationDateTime != null) {
      map['creation_date_time'] = Variable<String>(creationDateTime);
    }
    return map;
  }

  PomodorosCompanion toCompanion(bool nullToAbsent) {
    return PomodorosCompanion(
      id: Value(id),
      taskUid: taskUid == null && nullToAbsent
          ? const Value.absent()
          : Value(taskUid),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      creationDateTime: creationDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(creationDateTime),
    );
  }

  factory Pomodoro.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pomodoro(
      id: serializer.fromJson<int>(json['id']),
      taskUid: serializer.fromJson<String?>(json['taskUid']),
      duration: serializer.fromJson<int?>(json['duration']),
      creationDateTime: serializer.fromJson<String?>(json['creationDateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskUid': serializer.toJson<String?>(taskUid),
      'duration': serializer.toJson<int?>(duration),
      'creationDateTime': serializer.toJson<String?>(creationDateTime),
    };
  }

  Pomodoro copyWith(
          {int? id,
          Value<String?> taskUid = const Value.absent(),
          Value<int?> duration = const Value.absent(),
          Value<String?> creationDateTime = const Value.absent()}) =>
      Pomodoro(
        id: id ?? this.id,
        taskUid: taskUid.present ? taskUid.value : this.taskUid,
        duration: duration.present ? duration.value : this.duration,
        creationDateTime: creationDateTime.present
            ? creationDateTime.value
            : this.creationDateTime,
      );
  Pomodoro copyWithCompanion(PomodorosCompanion data) {
    return Pomodoro(
      id: data.id.present ? data.id.value : this.id,
      taskUid: data.taskUid.present ? data.taskUid.value : this.taskUid,
      duration: data.duration.present ? data.duration.value : this.duration,
      creationDateTime: data.creationDateTime.present
          ? data.creationDateTime.value
          : this.creationDateTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pomodoro(')
          ..write('id: $id, ')
          ..write('taskUid: $taskUid, ')
          ..write('duration: $duration, ')
          ..write('creationDateTime: $creationDateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, taskUid, duration, creationDateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pomodoro &&
          other.id == this.id &&
          other.taskUid == this.taskUid &&
          other.duration == this.duration &&
          other.creationDateTime == this.creationDateTime);
}

class PomodorosCompanion extends UpdateCompanion<Pomodoro> {
  final Value<int> id;
  final Value<String?> taskUid;
  final Value<int?> duration;
  final Value<String?> creationDateTime;
  const PomodorosCompanion({
    this.id = const Value.absent(),
    this.taskUid = const Value.absent(),
    this.duration = const Value.absent(),
    this.creationDateTime = const Value.absent(),
  });
  PomodorosCompanion.insert({
    this.id = const Value.absent(),
    this.taskUid = const Value.absent(),
    this.duration = const Value.absent(),
    this.creationDateTime = const Value.absent(),
  });
  static Insertable<Pomodoro> custom({
    Expression<int>? id,
    Expression<String>? taskUid,
    Expression<int>? duration,
    Expression<String>? creationDateTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskUid != null) 'task_uid': taskUid,
      if (duration != null) 'duration': duration,
      if (creationDateTime != null) 'creation_date_time': creationDateTime,
    });
  }

  PomodorosCompanion copyWith(
      {Value<int>? id,
      Value<String?>? taskUid,
      Value<int?>? duration,
      Value<String?>? creationDateTime}) {
    return PomodorosCompanion(
      id: id ?? this.id,
      taskUid: taskUid ?? this.taskUid,
      duration: duration ?? this.duration,
      creationDateTime: creationDateTime ?? this.creationDateTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskUid.present) {
      map['task_uid'] = Variable<String>(taskUid.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (creationDateTime.present) {
      map['creation_date_time'] = Variable<String>(creationDateTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PomodorosCompanion(')
          ..write('id: $id, ')
          ..write('taskUid: $taskUid, ')
          ..write('duration: $duration, ')
          ..write('creationDateTime: $creationDateTime')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deadLineTimeMeta =
      const VerificationMeta('deadLineTime');
  @override
  late final GeneratedColumn<String> deadLineTime = GeneratedColumn<String>(
      'dead_line_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _doneTimeMeta =
      const VerificationMeta('doneTime');
  @override
  late final GeneratedColumn<String> doneTime = GeneratedColumn<String>(
      'done_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
      'done', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("done" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, uid, title, description, deadLineTime, category, doneTime, done];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('dead_line_time')) {
      context.handle(
          _deadLineTimeMeta,
          deadLineTime.isAcceptableOrUnknown(
              data['dead_line_time']!, _deadLineTimeMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('done_time')) {
      context.handle(_doneTimeMeta,
          doneTime.isAcceptableOrUnknown(data['done_time']!, _doneTimeMeta));
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      deadLineTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dead_line_time']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      doneTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}done_time']),
      done: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}done']),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String? uid;
  final String? title;
  final String? description;
  final String? deadLineTime;
  final String? category;
  final String? doneTime;
  final bool? done;
  const Task(
      {required this.id,
      this.uid,
      this.title,
      this.description,
      this.deadLineTime,
      this.category,
      this.doneTime,
      this.done});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || uid != null) {
      map['uid'] = Variable<String>(uid);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || deadLineTime != null) {
      map['dead_line_time'] = Variable<String>(deadLineTime);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || doneTime != null) {
      map['done_time'] = Variable<String>(doneTime);
    }
    if (!nullToAbsent || done != null) {
      map['done'] = Variable<bool>(done);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      uid: uid == null && nullToAbsent ? const Value.absent() : Value(uid),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      deadLineTime: deadLineTime == null && nullToAbsent
          ? const Value.absent()
          : Value(deadLineTime),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      doneTime: doneTime == null && nullToAbsent
          ? const Value.absent()
          : Value(doneTime),
      done: done == null && nullToAbsent ? const Value.absent() : Value(done),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      uid: serializer.fromJson<String?>(json['uid']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      deadLineTime: serializer.fromJson<String?>(json['deadLineTime']),
      category: serializer.fromJson<String?>(json['category']),
      doneTime: serializer.fromJson<String?>(json['doneTime']),
      done: serializer.fromJson<bool?>(json['done']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uid': serializer.toJson<String?>(uid),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'deadLineTime': serializer.toJson<String?>(deadLineTime),
      'category': serializer.toJson<String?>(category),
      'doneTime': serializer.toJson<String?>(doneTime),
      'done': serializer.toJson<bool?>(done),
    };
  }

  Task copyWith(
          {int? id,
          Value<String?> uid = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> deadLineTime = const Value.absent(),
          Value<String?> category = const Value.absent(),
          Value<String?> doneTime = const Value.absent(),
          Value<bool?> done = const Value.absent()}) =>
      Task(
        id: id ?? this.id,
        uid: uid.present ? uid.value : this.uid,
        title: title.present ? title.value : this.title,
        description: description.present ? description.value : this.description,
        deadLineTime:
            deadLineTime.present ? deadLineTime.value : this.deadLineTime,
        category: category.present ? category.value : this.category,
        doneTime: doneTime.present ? doneTime.value : this.doneTime,
        done: done.present ? done.value : this.done,
      );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      uid: data.uid.present ? data.uid.value : this.uid,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      deadLineTime: data.deadLineTime.present
          ? data.deadLineTime.value
          : this.deadLineTime,
      category: data.category.present ? data.category.value : this.category,
      doneTime: data.doneTime.present ? data.doneTime.value : this.doneTime,
      done: data.done.present ? data.done.value : this.done,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('deadLineTime: $deadLineTime, ')
          ..write('category: $category, ')
          ..write('doneTime: $doneTime, ')
          ..write('done: $done')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, uid, title, description, deadLineTime, category, doneTime, done);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.uid == this.uid &&
          other.title == this.title &&
          other.description == this.description &&
          other.deadLineTime == this.deadLineTime &&
          other.category == this.category &&
          other.doneTime == this.doneTime &&
          other.done == this.done);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String?> uid;
  final Value<String?> title;
  final Value<String?> description;
  final Value<String?> deadLineTime;
  final Value<String?> category;
  final Value<String?> doneTime;
  final Value<bool?> done;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.uid = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.deadLineTime = const Value.absent(),
    this.category = const Value.absent(),
    this.doneTime = const Value.absent(),
    this.done = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    this.uid = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.deadLineTime = const Value.absent(),
    this.category = const Value.absent(),
    this.doneTime = const Value.absent(),
    this.done = const Value.absent(),
  });
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? uid,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? deadLineTime,
    Expression<String>? category,
    Expression<String>? doneTime,
    Expression<bool>? done,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uid != null) 'uid': uid,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (deadLineTime != null) 'dead_line_time': deadLineTime,
      if (category != null) 'category': category,
      if (doneTime != null) 'done_time': doneTime,
      if (done != null) 'done': done,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? id,
      Value<String?>? uid,
      Value<String?>? title,
      Value<String?>? description,
      Value<String?>? deadLineTime,
      Value<String?>? category,
      Value<String?>? doneTime,
      Value<bool?>? done}) {
    return TasksCompanion(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      description: description ?? this.description,
      deadLineTime: deadLineTime ?? this.deadLineTime,
      category: category ?? this.category,
      doneTime: doneTime ?? this.doneTime,
      done: done ?? this.done,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (deadLineTime.present) {
      map['dead_line_time'] = Variable<String>(deadLineTime.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (doneTime.present) {
      map['done_time'] = Variable<String>(doneTime.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('uid: $uid, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('deadLineTime: $deadLineTime, ')
          ..write('category: $category, ')
          ..write('doneTime: $doneTime, ')
          ..write('done: $done')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $DailyGoalsTable dailyGoals = $DailyGoalsTable(this);
  late final $HabitsTable habits = $HabitsTable(this);
  late final $HabitTrackersTable habitTrackers = $HabitTrackersTable(this);
  late final $PomodorosTable pomodoros = $PomodorosTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categories, dailyGoals, habits, habitTrackers, pomodoros, tasks];
}

typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String?> title,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String?> title,
});

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> title = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            title: title,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> title = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            title: title,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()>;
typedef $$DailyGoalsTableCreateCompanionBuilder = DailyGoalsCompanion Function({
  Value<int> id,
  Value<int?> count,
  Value<String?> goalDateTime,
});
typedef $$DailyGoalsTableUpdateCompanionBuilder = DailyGoalsCompanion Function({
  Value<int> id,
  Value<int?> count,
  Value<String?> goalDateTime,
});

class $$DailyGoalsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyGoalsTable> {
  $$DailyGoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get goalDateTime => $composableBuilder(
      column: $table.goalDateTime, builder: (column) => ColumnFilters(column));
}

class $$DailyGoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyGoalsTable> {
  $$DailyGoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get goalDateTime => $composableBuilder(
      column: $table.goalDateTime,
      builder: (column) => ColumnOrderings(column));
}

class $$DailyGoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyGoalsTable> {
  $$DailyGoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  GeneratedColumn<String> get goalDateTime => $composableBuilder(
      column: $table.goalDateTime, builder: (column) => column);
}

class $$DailyGoalsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DailyGoalsTable,
    DailyGoal,
    $$DailyGoalsTableFilterComposer,
    $$DailyGoalsTableOrderingComposer,
    $$DailyGoalsTableAnnotationComposer,
    $$DailyGoalsTableCreateCompanionBuilder,
    $$DailyGoalsTableUpdateCompanionBuilder,
    (DailyGoal, BaseReferences<_$AppDatabase, $DailyGoalsTable, DailyGoal>),
    DailyGoal,
    PrefetchHooks Function()> {
  $$DailyGoalsTableTableManager(_$AppDatabase db, $DailyGoalsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyGoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyGoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyGoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> count = const Value.absent(),
            Value<String?> goalDateTime = const Value.absent(),
          }) =>
              DailyGoalsCompanion(
            id: id,
            count: count,
            goalDateTime: goalDateTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> count = const Value.absent(),
            Value<String?> goalDateTime = const Value.absent(),
          }) =>
              DailyGoalsCompanion.insert(
            id: id,
            count: count,
            goalDateTime: goalDateTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DailyGoalsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DailyGoalsTable,
    DailyGoal,
    $$DailyGoalsTableFilterComposer,
    $$DailyGoalsTableOrderingComposer,
    $$DailyGoalsTableAnnotationComposer,
    $$DailyGoalsTableCreateCompanionBuilder,
    $$DailyGoalsTableUpdateCompanionBuilder,
    (DailyGoal, BaseReferences<_$AppDatabase, $DailyGoalsTable, DailyGoal>),
    DailyGoal,
    PrefetchHooks Function()>;
typedef $$HabitsTableCreateCompanionBuilder = HabitsCompanion Function({
  Value<int> id,
  Value<String?> uuid,
  Value<String?> habitTitle,
  Value<String?> habitDescription,
  Value<String?> habitIcon,
  Value<int?> habitColor,
  Value<List<String>?> overviews,
});
typedef $$HabitsTableUpdateCompanionBuilder = HabitsCompanion Function({
  Value<int> id,
  Value<String?> uuid,
  Value<String?> habitTitle,
  Value<String?> habitDescription,
  Value<String?> habitIcon,
  Value<int?> habitColor,
  Value<List<String>?> overviews,
});

class $$HabitsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get habitTitle => $composableBuilder(
      column: $table.habitTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get habitDescription => $composableBuilder(
      column: $table.habitDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get habitIcon => $composableBuilder(
      column: $table.habitIcon, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get habitColor => $composableBuilder(
      column: $table.habitColor, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
      get overviews => $composableBuilder(
          column: $table.overviews,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$HabitsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get habitTitle => $composableBuilder(
      column: $table.habitTitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get habitDescription => $composableBuilder(
      column: $table.habitDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get habitIcon => $composableBuilder(
      column: $table.habitIcon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get habitColor => $composableBuilder(
      column: $table.habitColor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get overviews => $composableBuilder(
      column: $table.overviews, builder: (column) => ColumnOrderings(column));
}

class $$HabitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get habitTitle => $composableBuilder(
      column: $table.habitTitle, builder: (column) => column);

  GeneratedColumn<String> get habitDescription => $composableBuilder(
      column: $table.habitDescription, builder: (column) => column);

  GeneratedColumn<String> get habitIcon =>
      $composableBuilder(column: $table.habitIcon, builder: (column) => column);

  GeneratedColumn<int> get habitColor => $composableBuilder(
      column: $table.habitColor, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>?, String> get overviews =>
      $composableBuilder(column: $table.overviews, builder: (column) => column);
}

class $$HabitsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HabitsTable,
    Habit,
    $$HabitsTableFilterComposer,
    $$HabitsTableOrderingComposer,
    $$HabitsTableAnnotationComposer,
    $$HabitsTableCreateCompanionBuilder,
    $$HabitsTableUpdateCompanionBuilder,
    (Habit, BaseReferences<_$AppDatabase, $HabitsTable, Habit>),
    Habit,
    PrefetchHooks Function()> {
  $$HabitsTableTableManager(_$AppDatabase db, $HabitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> uuid = const Value.absent(),
            Value<String?> habitTitle = const Value.absent(),
            Value<String?> habitDescription = const Value.absent(),
            Value<String?> habitIcon = const Value.absent(),
            Value<int?> habitColor = const Value.absent(),
            Value<List<String>?> overviews = const Value.absent(),
          }) =>
              HabitsCompanion(
            id: id,
            uuid: uuid,
            habitTitle: habitTitle,
            habitDescription: habitDescription,
            habitIcon: habitIcon,
            habitColor: habitColor,
            overviews: overviews,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> uuid = const Value.absent(),
            Value<String?> habitTitle = const Value.absent(),
            Value<String?> habitDescription = const Value.absent(),
            Value<String?> habitIcon = const Value.absent(),
            Value<int?> habitColor = const Value.absent(),
            Value<List<String>?> overviews = const Value.absent(),
          }) =>
              HabitsCompanion.insert(
            id: id,
            uuid: uuid,
            habitTitle: habitTitle,
            habitDescription: habitDescription,
            habitIcon: habitIcon,
            habitColor: habitColor,
            overviews: overviews,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HabitsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HabitsTable,
    Habit,
    $$HabitsTableFilterComposer,
    $$HabitsTableOrderingComposer,
    $$HabitsTableAnnotationComposer,
    $$HabitsTableCreateCompanionBuilder,
    $$HabitsTableUpdateCompanionBuilder,
    (Habit, BaseReferences<_$AppDatabase, $HabitsTable, Habit>),
    Habit,
    PrefetchHooks Function()>;
typedef $$HabitTrackersTableCreateCompanionBuilder = HabitTrackersCompanion
    Function({
  Value<int> id,
  Value<String?> habitId,
  Value<String?> creationDateTime,
});
typedef $$HabitTrackersTableUpdateCompanionBuilder = HabitTrackersCompanion
    Function({
  Value<int> id,
  Value<String?> habitId,
  Value<String?> creationDateTime,
});

class $$HabitTrackersTableFilterComposer
    extends Composer<_$AppDatabase, $HabitTrackersTable> {
  $$HabitTrackersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get habitId => $composableBuilder(
      column: $table.habitId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get creationDateTime => $composableBuilder(
      column: $table.creationDateTime,
      builder: (column) => ColumnFilters(column));
}

class $$HabitTrackersTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitTrackersTable> {
  $$HabitTrackersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get habitId => $composableBuilder(
      column: $table.habitId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get creationDateTime => $composableBuilder(
      column: $table.creationDateTime,
      builder: (column) => ColumnOrderings(column));
}

class $$HabitTrackersTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitTrackersTable> {
  $$HabitTrackersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get habitId =>
      $composableBuilder(column: $table.habitId, builder: (column) => column);

  GeneratedColumn<String> get creationDateTime => $composableBuilder(
      column: $table.creationDateTime, builder: (column) => column);
}

class $$HabitTrackersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HabitTrackersTable,
    HabitTracker,
    $$HabitTrackersTableFilterComposer,
    $$HabitTrackersTableOrderingComposer,
    $$HabitTrackersTableAnnotationComposer,
    $$HabitTrackersTableCreateCompanionBuilder,
    $$HabitTrackersTableUpdateCompanionBuilder,
    (
      HabitTracker,
      BaseReferences<_$AppDatabase, $HabitTrackersTable, HabitTracker>
    ),
    HabitTracker,
    PrefetchHooks Function()> {
  $$HabitTrackersTableTableManager(_$AppDatabase db, $HabitTrackersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitTrackersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitTrackersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitTrackersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> habitId = const Value.absent(),
            Value<String?> creationDateTime = const Value.absent(),
          }) =>
              HabitTrackersCompanion(
            id: id,
            habitId: habitId,
            creationDateTime: creationDateTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> habitId = const Value.absent(),
            Value<String?> creationDateTime = const Value.absent(),
          }) =>
              HabitTrackersCompanion.insert(
            id: id,
            habitId: habitId,
            creationDateTime: creationDateTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HabitTrackersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HabitTrackersTable,
    HabitTracker,
    $$HabitTrackersTableFilterComposer,
    $$HabitTrackersTableOrderingComposer,
    $$HabitTrackersTableAnnotationComposer,
    $$HabitTrackersTableCreateCompanionBuilder,
    $$HabitTrackersTableUpdateCompanionBuilder,
    (
      HabitTracker,
      BaseReferences<_$AppDatabase, $HabitTrackersTable, HabitTracker>
    ),
    HabitTracker,
    PrefetchHooks Function()>;
typedef $$PomodorosTableCreateCompanionBuilder = PomodorosCompanion Function({
  Value<int> id,
  Value<String?> taskUid,
  Value<int?> duration,
  Value<String?> creationDateTime,
});
typedef $$PomodorosTableUpdateCompanionBuilder = PomodorosCompanion Function({
  Value<int> id,
  Value<String?> taskUid,
  Value<int?> duration,
  Value<String?> creationDateTime,
});

class $$PomodorosTableFilterComposer
    extends Composer<_$AppDatabase, $PomodorosTable> {
  $$PomodorosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taskUid => $composableBuilder(
      column: $table.taskUid, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get creationDateTime => $composableBuilder(
      column: $table.creationDateTime,
      builder: (column) => ColumnFilters(column));
}

class $$PomodorosTableOrderingComposer
    extends Composer<_$AppDatabase, $PomodorosTable> {
  $$PomodorosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taskUid => $composableBuilder(
      column: $table.taskUid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get creationDateTime => $composableBuilder(
      column: $table.creationDateTime,
      builder: (column) => ColumnOrderings(column));
}

class $$PomodorosTableAnnotationComposer
    extends Composer<_$AppDatabase, $PomodorosTable> {
  $$PomodorosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get taskUid =>
      $composableBuilder(column: $table.taskUid, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get creationDateTime => $composableBuilder(
      column: $table.creationDateTime, builder: (column) => column);
}

class $$PomodorosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PomodorosTable,
    Pomodoro,
    $$PomodorosTableFilterComposer,
    $$PomodorosTableOrderingComposer,
    $$PomodorosTableAnnotationComposer,
    $$PomodorosTableCreateCompanionBuilder,
    $$PomodorosTableUpdateCompanionBuilder,
    (Pomodoro, BaseReferences<_$AppDatabase, $PomodorosTable, Pomodoro>),
    Pomodoro,
    PrefetchHooks Function()> {
  $$PomodorosTableTableManager(_$AppDatabase db, $PomodorosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PomodorosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PomodorosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PomodorosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> taskUid = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<String?> creationDateTime = const Value.absent(),
          }) =>
              PomodorosCompanion(
            id: id,
            taskUid: taskUid,
            duration: duration,
            creationDateTime: creationDateTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> taskUid = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<String?> creationDateTime = const Value.absent(),
          }) =>
              PomodorosCompanion.insert(
            id: id,
            taskUid: taskUid,
            duration: duration,
            creationDateTime: creationDateTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PomodorosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PomodorosTable,
    Pomodoro,
    $$PomodorosTableFilterComposer,
    $$PomodorosTableOrderingComposer,
    $$PomodorosTableAnnotationComposer,
    $$PomodorosTableCreateCompanionBuilder,
    $$PomodorosTableUpdateCompanionBuilder,
    (Pomodoro, BaseReferences<_$AppDatabase, $PomodorosTable, Pomodoro>),
    Pomodoro,
    PrefetchHooks Function()>;
typedef $$TasksTableCreateCompanionBuilder = TasksCompanion Function({
  Value<int> id,
  Value<String?> uid,
  Value<String?> title,
  Value<String?> description,
  Value<String?> deadLineTime,
  Value<String?> category,
  Value<String?> doneTime,
  Value<bool?> done,
});
typedef $$TasksTableUpdateCompanionBuilder = TasksCompanion Function({
  Value<int> id,
  Value<String?> uid,
  Value<String?> title,
  Value<String?> description,
  Value<String?> deadLineTime,
  Value<String?> category,
  Value<String?> doneTime,
  Value<bool?> done,
});

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deadLineTime => $composableBuilder(
      column: $table.deadLineTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get doneTime => $composableBuilder(
      column: $table.doneTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get done => $composableBuilder(
      column: $table.done, builder: (column) => ColumnFilters(column));
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deadLineTime => $composableBuilder(
      column: $table.deadLineTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get doneTime => $composableBuilder(
      column: $table.doneTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get done => $composableBuilder(
      column: $table.done, builder: (column) => ColumnOrderings(column));
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get deadLineTime => $composableBuilder(
      column: $table.deadLineTime, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get doneTime =>
      $composableBuilder(column: $table.doneTime, builder: (column) => column);

  GeneratedColumn<bool> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);
}

class $$TasksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TasksTable,
    Task,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableAnnotationComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
    Task,
    PrefetchHooks Function()> {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> uid = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> deadLineTime = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> doneTime = const Value.absent(),
            Value<bool?> done = const Value.absent(),
          }) =>
              TasksCompanion(
            id: id,
            uid: uid,
            title: title,
            description: description,
            deadLineTime: deadLineTime,
            category: category,
            doneTime: doneTime,
            done: done,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> uid = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> deadLineTime = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> doneTime = const Value.absent(),
            Value<bool?> done = const Value.absent(),
          }) =>
              TasksCompanion.insert(
            id: id,
            uid: uid,
            title: title,
            description: description,
            deadLineTime: deadLineTime,
            category: category,
            doneTime: doneTime,
            done: done,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TasksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TasksTable,
    Task,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableAnnotationComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
    Task,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$DailyGoalsTableTableManager get dailyGoals =>
      $$DailyGoalsTableTableManager(_db, _db.dailyGoals);
  $$HabitsTableTableManager get habits =>
      $$HabitsTableTableManager(_db, _db.habits);
  $$HabitTrackersTableTableManager get habitTrackers =>
      $$HabitTrackersTableTableManager(_db, _db.habitTrackers);
  $$PomodorosTableTableManager get pomodoros =>
      $$PomodorosTableTableManager(_db, _db.pomodoros);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
}
