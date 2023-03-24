
class Formatters {
  Formatters._();

  static double moneyToDouble(String money){
    final result = money.replaceAll('.', '').replaceAll('R\$', '').replaceAll(',', '.');
    return double.parse(result);
  }
}