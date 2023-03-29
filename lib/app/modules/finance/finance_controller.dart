import 'package:finance_app/app/models/finance_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FinanceController extends GetxController {
  final finances = <FinanceModel>[].obs;
  final _storage = GetStorage();

  @override
  void onInit() {
    _loadFinances();
    ever<List<FinanceModel>>(finances, (f) {
      _saveFinances();
    });
    super.onInit();
  }

  void addFinance(FinanceModel finance) {
    finances.add(finance);
  }

  void _saveFinances() {
    final data = finances.map((e) => e.toMap()).toList();
    _storage.write("finances", data);
  }

  void _loadFinances() {
    final data = _storage.read("finances") ?? [];
    final elements = data.map<FinanceModel>((e) => FinanceModel.fromMap(e));
    finances.assignAll(elements);
  }

  void editFinance({required FinanceModel finance}) {
    final index = finances.indexWhere((e) => e.id == finance.id);
    if (index > -1) {
      finances[index] = finance;
    }
  }
}
