// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  static String fromCode(String? colorCode) {
    final subString = colorCode!.replaceAll('Color(0xff', '');
    final colorResult = subString.replaceAll(')', '');
    return colorResult;
  }

  static int daysBetween(DateTime from, DateTime to) {
    // from = DateTime(from.year, from.month, from.day);
    // to = DateTime(to.year, to.month, to.day);
    to = DateTime.now();
    final difference = to.difference(from).inHours.round();
    return difference;
  }
}

// block of convert text have capitalize
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  static final numberFormat = NumberFormat("#,###.##", "en_US");

  ///Format 1,200.00 and 1,200.50
  String toCurrencyAmount() {
    var numb = double.tryParse(replaceAll(',', ''));
    if (numb != null) {
      return numberFormat.format(numb);
    } else {
      debugPrint('here');
      return this;
    }
  }

  String toConvertNewLine() {
    debugPrint('Converting');
    var content = this;
    return content.replaceAll(r'\n', '\n');
  }

  bool isValidEmail() {
    String p =
        "[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    bool emailValid = RegExp(p).hasMatch(this);
    return emailValid;
  }

  String removeZeroFront() {
    String zero = '';
    final RegExp regexp = RegExp(r'^0+(?=.)');
    zero.replaceAll(regexp, '');
    return this;
  }
}

extension R on BuildContext {
  goto(a) => Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => a,
      ));
}

extension GetHeaderUrl on String {
  // static String imageHeader = dotenv.get('imageHeader');
  // static String videoHeader = dotenv.get('videoHeader');
}
