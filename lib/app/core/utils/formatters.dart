import 'package:flutter/widgets.dart';
import 'package:mask/mask.dart';

class Formatters {
  Formatters._();

  static double moneyToDouble(String money) {
    final result =
        money.replaceAll('.', '').replaceAll('R\$', '').replaceAll(',', '.');
    return double.tryParse(result) ?? 0.0;
  }

  static String moneyDisplay(double money) {
    final value = TextEditingValue(text: money.toStringAsFixed(2));
    final res = Mask.money().formatEditUpdate(value, value);
    return res.text;
  }
}
