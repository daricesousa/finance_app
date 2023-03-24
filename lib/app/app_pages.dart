import 'package:finance_app/app/modules/finance/finance_bindings.dart';
import 'package:finance_app/app/modules/finance/finance_page.dart';
import 'package:get/route_manager.dart';

class AppPages {
  AppPages._();

  static final pages = <GetPage>[
    GetPage(name: '/', page: () => const FinancePage(), binding: FinanceBindings()),
  ];
}