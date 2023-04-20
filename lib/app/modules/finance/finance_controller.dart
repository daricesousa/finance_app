import 'package:finance_app/app/models/finance_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FinanceController extends GetxController {
  final _finances = <FinanceModel>[].obs;
  final _storage = GetStorage();

  List<FinanceModel> get finances {
    List<FinanceModel> sortedFinances = List.from(_finances);
    sortedFinances.sort((a, b) {
      return b.month.compareTo(a.month);
    });
    return sortedFinances;
  }

  @override
  void onInit() {
    _loadFinances();
    ever<List<FinanceModel>>(_finances, (f) {
      _saveFinances();
    });
    super.onInit();
  }

  void addFinance(FinanceModel finance) {
    _finances.add(finance);
  }

  void _saveFinances() {
    final data = _finances.map((e) => e.toMap()).toList();
    _storage.write("finances", data);
  }

  void _loadFinances() {
    final data = _storage.read("finances") ?? [];
    final elements = data.map<FinanceModel>((e) => FinanceModel.fromMap(e));
    _finances.assignAll(elements);
  }

  void editFinance({required FinanceModel finance}) {
    final index = _finances.indexWhere((e) => e.id == finance.id);
    if (index > -1) {
      _finances[index] = finance;
    }
  }

  void delete({required FinanceModel finance}) {
    _finances.removeWhere((e) => e.id == finance.id);
  }
}
