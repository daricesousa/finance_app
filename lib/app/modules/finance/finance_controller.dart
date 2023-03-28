import 'package:finance_app/app/models/finance_model.dart';
import 'package:get/get.dart';

class FinanceController extends GetxController {
  final finances = <FinanceModel>[].obs;

  void addFinance(FinanceModel finance) {
    finances.add(finance);
  }
  
}
