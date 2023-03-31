import 'package:get/get.dart';
import './expense_controller.dart';

class ExpenseBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ExpenseController());
    }
}