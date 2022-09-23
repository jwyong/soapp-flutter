import 'package:drift/drift.dart';

class Contact extends Table {
  // contact's jid
  TextColumn get jid => text().withLength(min: 12, max: 24)();

  // display name set by user
  TextColumn get displayName => text().withLength(min: 1, max: 25)();

  // contact name from phone book
  TextColumn get contactName => text()();

  // phone number from phone book
  TextColumn get phoneNumber => text()();


// profile img
  // TODO
}