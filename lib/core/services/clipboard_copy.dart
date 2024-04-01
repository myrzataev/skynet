import 'package:flutter/services.dart';

abstract class CopyToClipboard {
  static copy({required String text}) {
    final value = ClipboardData(text: text);
    Clipboard.setData(value);
  }
}
