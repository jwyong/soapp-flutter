import 'package:flutter/services.dart';

// paste items from clipboard
Future<String> pasteFromClipboard() async {
  final ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
  return cdata?.text?? "";
}

// extensions for string capitalisation
extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}