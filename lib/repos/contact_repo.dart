import 'package:soapp/db/soapp_db.dart';
import 'package:soapp/db/table/contact.dart';

class ContactRepo {
  final db = SoappDB();

  void insertContact(ContactData contact) async =>
      await db.into(db.contact).insert(contact);
}
