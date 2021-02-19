// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class PurchaseData extends DataClass implements Insertable<PurchaseData> {
  final int amount;
  final String item;
  final String date;
  final int num;
  PurchaseData(
      {@required this.amount,
      @required this.item,
      @required this.date,
      @required this.num});
  factory PurchaseData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return PurchaseData(
      amount: intType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      item: stringType.mapFromDatabaseResponse(data['${effectivePrefix}item']),
      date: stringType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      num: intType.mapFromDatabaseResponse(data['${effectivePrefix}num']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<int>(amount);
    }
    if (!nullToAbsent || item != null) {
      map['item'] = Variable<String>(item);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    if (!nullToAbsent || num != null) {
      map['num'] = Variable<int>(num);
    }
    return map;
  }

  PurchaseCompanion toCompanion(bool nullToAbsent) {
    return PurchaseCompanion(
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      item: item == null && nullToAbsent ? const Value.absent() : Value(item),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      num: num == null && nullToAbsent ? const Value.absent() : Value(num),
    );
  }

  factory PurchaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PurchaseData(
      amount: serializer.fromJson<int>(json['amount']),
      item: serializer.fromJson<String>(json['item']),
      date: serializer.fromJson<String>(json['date']),
      num: serializer.fromJson<int>(json['num']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'amount': serializer.toJson<int>(amount),
      'item': serializer.toJson<String>(item),
      'date': serializer.toJson<String>(date),
      'num': serializer.toJson<int>(num),
    };
  }

  PurchaseData copyWith({int amount, String item, String date, int num}) =>
      PurchaseData(
        amount: amount ?? this.amount,
        item: item ?? this.item,
        date: date ?? this.date,
        num: num ?? this.num,
      );
  @override
  String toString() {
    return (StringBuffer('PurchaseData(')
          ..write('amount: $amount, ')
          ..write('item: $item, ')
          ..write('date: $date, ')
          ..write('num: $num')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(amount.hashCode,
      $mrjc(item.hashCode, $mrjc(date.hashCode, num.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PurchaseData &&
          other.amount == this.amount &&
          other.item == this.item &&
          other.date == this.date &&
          other.num == this.num);
}

class PurchaseCompanion extends UpdateCompanion<PurchaseData> {
  final Value<int> amount;
  final Value<String> item;
  final Value<String> date;
  final Value<int> num;
  const PurchaseCompanion({
    this.amount = const Value.absent(),
    this.item = const Value.absent(),
    this.date = const Value.absent(),
    this.num = const Value.absent(),
  });
  PurchaseCompanion.insert({
    @required int amount,
    @required String item,
    @required String date,
    this.num = const Value.absent(),
  })  : amount = Value(amount),
        item = Value(item),
        date = Value(date);
  static Insertable<PurchaseData> custom({
    Expression<int> amount,
    Expression<String> item,
    Expression<String> date,
    Expression<int> num,
  }) {
    return RawValuesInsertable({
      if (amount != null) 'amount': amount,
      if (item != null) 'item': item,
      if (date != null) 'date': date,
      if (num != null) 'num': num,
    });
  }

  PurchaseCompanion copyWith(
      {Value<int> amount,
      Value<String> item,
      Value<String> date,
      Value<int> num}) {
    return PurchaseCompanion(
      amount: amount ?? this.amount,
      item: item ?? this.item,
      date: date ?? this.date,
      num: num ?? this.num,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (item.present) {
      map['item'] = Variable<String>(item.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (num.present) {
      map['num'] = Variable<int>(num.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseCompanion(')
          ..write('amount: $amount, ')
          ..write('item: $item, ')
          ..write('date: $date, ')
          ..write('num: $num')
          ..write(')'))
        .toString();
  }
}

class $PurchaseTable extends Purchase
    with TableInfo<$PurchaseTable, PurchaseData> {
  final GeneratedDatabase _db;
  final String _alias;
  $PurchaseTable(this._db, [this._alias]);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedIntColumn _amount;
  @override
  GeneratedIntColumn get amount => _amount ??= _constructAmount();
  GeneratedIntColumn _constructAmount() {
    return GeneratedIntColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _itemMeta = const VerificationMeta('item');
  GeneratedTextColumn _item;
  @override
  GeneratedTextColumn get item => _item ??= _constructItem();
  GeneratedTextColumn _constructItem() {
    return GeneratedTextColumn(
      'item',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedTextColumn _date;
  @override
  GeneratedTextColumn get date => _date ??= _constructDate();
  GeneratedTextColumn _constructDate() {
    return GeneratedTextColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numMeta = const VerificationMeta('num');
  GeneratedIntColumn _num;
  @override
  GeneratedIntColumn get num => _num ??= _constructNum();
  GeneratedIntColumn _constructNum() {
    return GeneratedIntColumn('num', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  @override
  List<GeneratedColumn> get $columns => [amount, item, date, num];
  @override
  $PurchaseTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'purchase';
  @override
  final String actualTableName = 'purchase';
  @override
  VerificationContext validateIntegrity(Insertable<PurchaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('item')) {
      context.handle(
          _itemMeta, item.isAcceptableOrUnknown(data['item'], _itemMeta));
    } else if (isInserting) {
      context.missing(_itemMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('num')) {
      context.handle(
          _numMeta, num.isAcceptableOrUnknown(data['num'], _numMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {num};
  @override
  PurchaseData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PurchaseData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PurchaseTable createAlias(String alias) {
    return $PurchaseTable(_db, alias);
  }
}

abstract class _$PurchaseDataBase extends GeneratedDatabase {
  _$PurchaseDataBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $PurchaseTable _purchase;
  $PurchaseTable get purchase => _purchase ??= $PurchaseTable(this);
  PurchaseDao _purchaseDao;
  PurchaseDao get purchaseDao =>
      _purchaseDao ??= PurchaseDao(this as PurchaseDataBase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [purchase];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$PurchaseDaoMixin on DatabaseAccessor<PurchaseDataBase> {
  $PurchaseTable get purchase => attachedDatabase.purchase;
}
