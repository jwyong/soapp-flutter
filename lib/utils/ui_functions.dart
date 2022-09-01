import 'package:flutter/services.dart';

Future<String> pasteFromClipboard() async {
  final ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
  return cdata?.text?? "";
}