import 'package:flutter/services.dart';

class CopyToClipboard {
  void copytoClipboard({required String text}) {
    final value = ClipboardData(text: text);
    Clipboard.setData(value);
  }
}
