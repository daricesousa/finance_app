import 'package:flutter/widgets.dart';
import 'package:mask/mask.dart';

class Formatters {
  Formatters._();

  static double moneyToDouble(String money) {
    final result =
        money.replaceAll('.', '').replaceAll('R\$', '').replaceAll(',', '.');
    return double.parse(result);
  }

  static String moneyDisplay(double money) {
    money = money * 10;
    final value = TextEditingValue(text: money.toString());
    final res = Mask.money().formatEditUpdate(value, value);
    return res.text;
  }
}
