import 'package:drift/drift.dart';

class ChatRoom extends Table {
  // chat rooms jid (same as contact jid if individual, more than 12 letters if grp)
  TextColumn get jid => text().withLength(min: 12, max: 24)();

  // is group or individual
  BoolColumn get isGroup => boolean()();

  // profile img
  // TODO
}