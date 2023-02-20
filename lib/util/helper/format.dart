// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:intl/intl.dart' ;

class FormatConvert {
  //0,000.00
  static formatCurrency(double number) {
    final result = NumberFormat("#,##0.00", "en_US");
    return result.format(number);
  }

  static removeTrailingZero(double number) {
    final result = NumberFormat("#,##0.00", "en_US");
    var s = result.format(number);
    debugPrint('value=============$s');
    RegExp regex = RegExp(r"([.]*0+)(?!.*\d)");
    return result.format(number).toString().replaceAll(regex, '');
  }

  static checkPhoneNumber(String str) {
    if (str[0] == "0") {
      return str.substring(1);
    }
    return '0$str';
  }

  static hideMiddlePhoneNumber(String phonenumber, String countryCode) {
    String getPhonenumber = phonenumber.replaceAll(countryCode, '0');
    return "${getPhonenumber.substring(0, 3)}***${getPhonenumber.substring(getPhonenumber.length - 3, getPhonenumber.length)}";
  }

  static remove0first(String str) {
    if (str.isNotEmpty && str[0] == "0") {
      return str.replaceFirst('0', '');
    }
    return str;
  }

  static bigCharactorFirst(String? title) {
    title = title!.capitalize;
    return title;
  }

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  double onConvertToDouble(String value) {
    var values = value.replaceAll(",", ".");
    var doubleValue = double.parse(values);
    return doubleValue;
  }

  // Ex : 1000 -> 1K
  convertNumber(int currentBalance) {
    var formattedNumber = NumberFormat.compact().format(currentBalance);
    return formattedNumber;
  }

  formatDateTime(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formatDate = DateFormat('dd-MMM-yyyy', 'en_US').format(dateTime);
    return formatDate;
  }

  String? getFormatedDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('EEEE, dd MMM yyyy');
    return outputFormat.format(inputDate);
  }

  String? eventDateTime(date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('EEE, dd MMM yyyy');
    return outputFormat.format(inputDate);
  }
}
