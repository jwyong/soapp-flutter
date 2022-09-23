// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soapp_db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ContactData extends DataClass implements Insertable<ContactData> {
  final String jid;
  final String displayName;
  final String contactName;
  final String phoneNumber;
  const ContactData(
      {required this.jid,
      required this.displayName,
      required this.contactName,
      required this.phoneNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['jid'] = Variable<String>(jid);
    map['display_name'] = Variable<String>(displayName);
    map['contact_name'] = Variable<String>(contactName);
    map['phone_number'] = Variable<String>(phoneNumber);
    return map;
  }

  ContactCompanion toCompanion(bool nullToAbsent) {
    return ContactCompanion(
      jid: Value(jid),
      displayName: Value(displayName),
      contactName: Value(contactName),
      phoneNumber: Value(phoneNumber),
    );
  }

  factory ContactData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContactData(
      jid: serializer.fromJson<String>(json['jid']),
      displayName: serializer.fromJson<String>(json['displayName']),
      contactName: serializer.fromJson<String>(json['contactName']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'jid': serializer.toJson<String>(jid),
      'displayName': serializer.toJson<String>(displayName),
      'contactName': serializer.toJson<String>(contactName),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
    };
  }

  ContactData copyWith(
          {String? jid,
          String? displayName,
          String? contactName,
          String? phoneNumber}) =>
      ContactData(
        jid: jid ?? this.jid,
        displayName: displayName ?? this.displayName,
        contactName: contactName ?? this.contactName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
  @override
  String toString() {
    return (StringBuffer('ContactData(')
          ..write('jid: $jid, ')
          ..write('displayName: $displayName, ')
          ..write('contactName: $contactName, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(jid, displayName, contactName, phoneNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContactData &&
          other.jid == this.jid &&
          other.displayName == this.displayName &&
          other.contactName == this.contactName &&
          other.phoneNumber == this.phoneNumber);
}

class ContactCompanion extends UpdateCompanion<ContactData> {
  final Value<String> jid;
  final Value<String> displayName;
  final Value<String> contactName;
  final Value<String> phoneNumber;
  const ContactCompanion({
    this.jid = const Value.absent(),
    this.displayName = const Value.absent(),
    this.contactName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
  });
  ContactCompanion.insert({
    required String jid,
    required String displayName,
    required String contactName,
    required String phoneNumber,
  })  : jid = Value(jid),
        displayName = Value(displayName),
        contactName = Value(contactName),
        phoneNumber = Value(phoneNumber);
  static Insertable<ContactData> custom({
    Expression<String>? jid,
    Expression<String>? displayName,
    Expression<String>? contactName,
    Expression<String>? phoneNumber,
  }) {
    return RawValuesInsertable({
      if (jid != null) 'jid': jid,
      if (displayName != null) 'display_name': displayName,
      if (contactName != null) 'contact_name': contactName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
    });
  }

  ContactCompanion copyWith(
      {Value<String>? jid,
      Value<String>? displayName,
      Value<String>? contactName,
      Value<String>? phoneNumber}) {
    return ContactCompanion(
      jid: jid ?? this.jid,
      displayName: displayName ?? this.displayName,
      contactName: contactName ?? this.contactName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (jid.present) {
      map['jid'] = Variable<String>(jid.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (contactName.present) {
      map['contact_name'] = Variable<String>(contactName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactCompanion(')
          ..write('jid: $jid, ')
          ..write('displayName: $displayName, ')
          ..write('contactName: $contactName, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }
}

class $ContactTable extends Contact with TableInfo<$ContactTable, ContactData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContactTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _jidMeta = const VerificationMeta('jid');
  @override
  late final GeneratedColumn<String> jid = GeneratedColumn<String>(
      'jid', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 12, maxTextLength: 24),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 25),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _contactNameMeta =
      const VerificationMeta('contactName');
  @override
  late final GeneratedColumn<String> contactName = GeneratedColumn<String>(
      'contact_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [jid, displayName, contactName, phoneNumber];
  @override
  String get aliasedName => _alias ?? 'contact';
  @override
  String get actualTableName => 'contact';
  @override
  VerificationContext validateIntegrity(Insertable<ContactData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('jid')) {
      context.handle(
          _jidMeta, jid.isAcceptableOrUnknown(data['jid']!, _jidMeta));
    } else if (isInserting) {
      context.missing(_jidMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('contact_name')) {
      context.handle(
          _contactNameMeta,
          contactName.isAcceptableOrUnknown(
              data['contact_name']!, _contactNameMeta));
    } else if (isInserting) {
      context.missing(_contactNameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ContactData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContactData(
      jid: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}jid'])!,
      displayName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      contactName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}contact_name'])!,
      phoneNumber: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
    );
  }

  @override
  $ContactTable createAlias(String alias) {
    return $ContactTable(attachedDatabase, alias);
  }
}

abstract class _$SoappDB extends GeneratedDatabase {
  _$SoappDB(QueryExecutor e) : super(e);
  late final $ContactTable contact = $ContactTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [contact];
}
