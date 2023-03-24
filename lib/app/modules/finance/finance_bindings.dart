import 'package:finance_app/app/modules/finance/finance_controller.dart';
import 'package:get/get.dart';


class FinanceBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(FinanceController());
    }
}