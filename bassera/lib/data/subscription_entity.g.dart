// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSubscriptionEntityCollection on Isar {
  IsarCollection<SubscriptionEntity> get subscriptionEntitys =>
      this.collection();
}

const SubscriptionEntitySchema = CollectionSchema(
  name: r'SubscriptionEntity',
  id: 7454646760815216241,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'billingCycleIndex': PropertySchema(
      id: 1,
      name: r'billingCycleIndex',
      type: IsarType.long,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.string,
    ),
    r'isFreeTrial': PropertySchema(
      id: 3,
      name: r'isFreeTrial',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'nextRenewal': PropertySchema(
      id: 5,
      name: r'nextRenewal',
      type: IsarType.dateTime,
    ),
    r'sharingNote': PropertySchema(
      id: 6,
      name: r'sharingNote',
      type: IsarType.string,
    ),
    r'subscriptionId': PropertySchema(
      id: 7,
      name: r'subscriptionId',
      type: IsarType.string,
    ),
    r'trialEndsAt': PropertySchema(
      id: 8,
      name: r'trialEndsAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _subscriptionEntityEstimateSize,
  serialize: _subscriptionEntitySerialize,
  deserialize: _subscriptionEntityDeserialize,
  deserializeProp: _subscriptionEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'subscriptionId': IndexSchema(
      id: -2440251475652077983,
      name: r'subscriptionId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'subscriptionId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _subscriptionEntityGetId,
  getLinks: _subscriptionEntityGetLinks,
  attach: _subscriptionEntityAttach,
  version: '3.1.0+1',
);

int _subscriptionEntityEstimateSize(
  SubscriptionEntity object,
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
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.sharingNote;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.subscriptionId.length * 3;
  return bytesCount;
}

void _subscriptionEntitySerialize(
  SubscriptionEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeLong(offsets[1], object.billingCycleIndex);
  writer.writeString(offsets[2], object.category);
  writer.writeBool(offsets[3], object.isFreeTrial);
  writer.writeString(offsets[4], object.name);
  writer.writeDateTime(offsets[5], object.nextRenewal);
  writer.writeString(offsets[6], object.sharingNote);
  writer.writeString(offsets[7], object.subscriptionId);
  writer.writeDateTime(offsets[8], object.trialEndsAt);
}

SubscriptionEntity _subscriptionEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SubscriptionEntity();
  object.amount = reader.readDouble(offsets[0]);
  object.billingCycleIndex = reader.readLong(offsets[1]);
  object.category = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.isFreeTrial = reader.readBool(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.nextRenewal = reader.readDateTime(offsets[5]);
  object.sharingNote = reader.readStringOrNull(offsets[6]);
  object.subscriptionId = reader.readString(offsets[7]);
  object.trialEndsAt = reader.readDateTimeOrNull(offsets[8]);
  return object;
}

P _subscriptionEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _subscriptionEntityGetId(SubscriptionEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _subscriptionEntityGetLinks(
    SubscriptionEntity object) {
  return [];
}

void _subscriptionEntityAttach(
    IsarCollection<dynamic> col, Id id, SubscriptionEntity object) {
  object.id = id;
}

extension SubscriptionEntityByIndex on IsarCollection<SubscriptionEntity> {
  Future<SubscriptionEntity?> getBySubscriptionId(String subscriptionId) {
    return getByIndex(r'subscriptionId', [subscriptionId]);
  }

  SubscriptionEntity? getBySubscriptionIdSync(String subscriptionId) {
    return getByIndexSync(r'subscriptionId', [subscriptionId]);
  }

  Future<bool> deleteBySubscriptionId(String subscriptionId) {
    return deleteByIndex(r'subscriptionId', [subscriptionId]);
  }

  bool deleteBySubscriptionIdSync(String subscriptionId) {
    return deleteByIndexSync(r'subscriptionId', [subscriptionId]);
  }

  Future<List<SubscriptionEntity?>> getAllBySubscriptionId(
      List<String> subscriptionIdValues) {
    final values = subscriptionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'subscriptionId', values);
  }

  List<SubscriptionEntity?> getAllBySubscriptionIdSync(
      List<String> subscriptionIdValues) {
    final values = subscriptionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'subscriptionId', values);
  }

  Future<int> deleteAllBySubscriptionId(List<String> subscriptionIdValues) {
    final values = subscriptionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'subscriptionId', values);
  }

  int deleteAllBySubscriptionIdSync(List<String> subscriptionIdValues) {
    final values = subscriptionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'subscriptionId', values);
  }

  Future<Id> putBySubscriptionId(SubscriptionEntity object) {
    return putByIndex(r'subscriptionId', object);
  }

  Id putBySubscriptionIdSync(SubscriptionEntity object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'subscriptionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySubscriptionId(List<SubscriptionEntity> objects) {
    return putAllByIndex(r'subscriptionId', objects);
  }

  List<Id> putAllBySubscriptionIdSync(List<SubscriptionEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'subscriptionId', objects, saveLinks: saveLinks);
  }
}

extension SubscriptionEntityQueryWhereSort
    on QueryBuilder<SubscriptionEntity, SubscriptionEntity, QWhere> {
  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SubscriptionEntityQueryWhere
    on QueryBuilder<SubscriptionEntity, SubscriptionEntity, QWhereClause> {
  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterWhereClause>
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

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterWhereClause>
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

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterWhereClause>
      subscriptionIdEqualTo(String subscriptionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'subscriptionId',
        value: [subscriptionId],
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterWhereClause>
      subscriptionIdNotEqualTo(String subscriptionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subscriptionId',
              lower: [],
              upper: [subscriptionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subscriptionId',
              lower: [subscriptionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subscriptionId',
              lower: [subscriptionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subscriptionId',
              lower: [],
              upper: [subscriptionId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SubscriptionEntityQueryFilter
    on QueryBuilder<SubscriptionEntity, SubscriptionEntity, QFilterCondition> {
  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      billingCycleIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'billingCycleIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      billingCycleIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'billingCycleIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      billingCycleIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'billingCycleIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      billingCycleIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'billingCycleIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      categoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      categoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      categoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      categoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      isFreeTrialEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFreeTrial',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nextRenewalEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextRenewal',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nextRenewalGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextRenewal',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nextRenewalLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextRenewal',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      nextRenewalBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextRenewal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      sharingNoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sharingNote',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      sharingNoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sharingNote',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      sharingNoteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sharingNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      sharingNoteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sharingNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      sharingNoteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sharingNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      sharingNoteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sharingNote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      sharingNoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sharingNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      sharingNoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sharingNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      sharingNoteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sharingNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      sharingNoteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sharingNote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      sharingNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sharingNote',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      sharingNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sharingNote',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      subscriptionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      subscriptionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      subscriptionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      subscriptionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subscriptionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      subscriptionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      subscriptionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      subscriptionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      subscriptionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subscriptionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      subscriptionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subscriptionId',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      subscriptionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subscriptionId',
        value: '',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      trialEndsAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trialEndsAt',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      trialEndsAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trialEndsAt',
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      trialEndsAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trialEndsAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      trialEndsAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trialEndsAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      trialEndsAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trialEndsAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterFilterCondition>
      trialEndsAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trialEndsAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SubscriptionEntityQueryObject
    on QueryBuilder<SubscriptionEntity, SubscriptionEntity, QFilterCondition> {}

extension SubscriptionEntityQueryLinks
    on QueryBuilder<SubscriptionEntity, SubscriptionEntity, QFilterCondition> {}

extension SubscriptionEntityQuerySortBy
    on QueryBuilder<SubscriptionEntity, SubscriptionEntity, QSortBy> {
  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByBillingCycleIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billingCycleIndex', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByBillingCycleIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billingCycleIndex', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByIsFreeTrial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFreeTrial', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByIsFreeTrialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFreeTrial', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByNextRenewal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextRenewal', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByNextRenewalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextRenewal', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortBySharingNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharingNote', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortBySharingNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharingNote', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortBySubscriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscriptionId', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortBySubscriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscriptionId', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByTrialEndsAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEndsAt', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      sortByTrialEndsAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEndsAt', Sort.desc);
    });
  }
}

extension SubscriptionEntityQuerySortThenBy
    on QueryBuilder<SubscriptionEntity, SubscriptionEntity, QSortThenBy> {
  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByBillingCycleIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billingCycleIndex', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByBillingCycleIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billingCycleIndex', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByIsFreeTrial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFreeTrial', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByIsFreeTrialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFreeTrial', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByNextRenewal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextRenewal', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByNextRenewalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextRenewal', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenBySharingNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharingNote', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenBySharingNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sharingNote', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenBySubscriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscriptionId', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenBySubscriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscriptionId', Sort.desc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByTrialEndsAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEndsAt', Sort.asc);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QAfterSortBy>
      thenByTrialEndsAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEndsAt', Sort.desc);
    });
  }
}

extension SubscriptionEntityQueryWhereDistinct
    on QueryBuilder<SubscriptionEntity, SubscriptionEntity, QDistinct> {
  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QDistinct>
      distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QDistinct>
      distinctByBillingCycleIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'billingCycleIndex');
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QDistinct>
      distinctByIsFreeTrial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFreeTrial');
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QDistinct>
      distinctByNextRenewal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextRenewal');
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QDistinct>
      distinctBySharingNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sharingNote', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QDistinct>
      distinctBySubscriptionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subscriptionId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SubscriptionEntity, SubscriptionEntity, QDistinct>
      distinctByTrialEndsAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trialEndsAt');
    });
  }
}

extension SubscriptionEntityQueryProperty
    on QueryBuilder<SubscriptionEntity, SubscriptionEntity, QQueryProperty> {
  QueryBuilder<SubscriptionEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SubscriptionEntity, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<SubscriptionEntity, int, QQueryOperations>
      billingCycleIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'billingCycleIndex');
    });
  }

  QueryBuilder<SubscriptionEntity, String?, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<SubscriptionEntity, bool, QQueryOperations>
      isFreeTrialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFreeTrial');
    });
  }

  QueryBuilder<SubscriptionEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SubscriptionEntity, DateTime, QQueryOperations>
      nextRenewalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextRenewal');
    });
  }

  QueryBuilder<SubscriptionEntity, String?, QQueryOperations>
      sharingNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sharingNote');
    });
  }

  QueryBuilder<SubscriptionEntity, String, QQueryOperations>
      subscriptionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subscriptionId');
    });
  }

  QueryBuilder<SubscriptionEntity, DateTime?, QQueryOperations>
      trialEndsAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trialEndsAt');
    });
  }
}
