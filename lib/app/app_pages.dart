import 'package:finance_app/app/modules/expense/expense_bindings.dart';
import 'package:finance_app/app/modules/expense/expense_page.dart';
import 'package:finance_app/app/modules/finance/finance_bindings.dart';
import 'package:finance_app/app/modules/finance/finance_page.dart';
import 'package:finance_app/app/modules/group/group_bindings.dart';
import 'package:finance_app/app/modules/group/group_page.dart';
import 'package:get/route_manager.dart';

class AppPages {
  AppPages._();

  static final pages = <GetPage>[
    GetPage(
      name: '/',
      page: () => const FinancePage(),
      binding: FinanceBindings(),
    ),
    GetPage(
      name: '/group',
      page: () => const GroupPage(),
      binding: GroupBindings(),
    ),
    GetPage(
      name: '/expense',
      page: () => const ExpensePage(),
      binding: ExpenseBindings(),
    ),
  ];
}
