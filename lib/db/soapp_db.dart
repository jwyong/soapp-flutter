import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'table/contact.dart';

///
/// how to generate new tables:
/// -disable web3dart package in pubspec.yaml (this interferes with moor's generator)
/// -command: flutter pub run build_runner build
///

part 'soapp_db.g.dart';

@DriftDatabase(tables: [Contact])
class SoappDB extends _$SoappDB {
  SoappDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'soapp_db.sqlite'));
    return NativeDatabase(file);
  });
}
