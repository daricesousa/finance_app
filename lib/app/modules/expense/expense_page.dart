import 'package:finance_app/app/core/ui/app_color.dart';
import 'package:finance_app/app/core/utils/formatters.dart';
import 'package:finance_app/app/models/expense_model.dart';
import 'package:finance_app/app/modules/expense/widgets/bottom_sheet_expense.dart';
import 'package:finance_app/app/modules/expense/widgets/dialog_add_expense.dart';
import 'package:finance_app/app/modules/expense/widgets/dialog_delete_expense.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './expense_controller.dart';

class ExpensePage extends GetView<ExpenseController> {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          controller.group.title != '' ? controller.group.title : 'Despesas',
          style: const TextStyle(
              color: AppColor.dark, fontWeight: FontWeight.w300),
        ),
      ),
      body: _Body(controller: controller),
      floatingActionButton: _FloatingButton(controller: controller),
    );
  }
}

class _Body extends StatelessWidget {
  final ExpenseController controller;

  const _Body({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final lengthList = controller.expenses.length;
      return ListView.builder(
          itemCount: lengthList + 1,
          itemBuilder: (context, index) {
            if (index == lengthList) {
              return Container(height: 50);
            }
            final expense = controller.expenses[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Card(
                child: ListTile(
                  title: Text(expense.title),
                  subtitle:
                      Text("Custo: ${Formatters.moneyDisplay(expense.cost)}"),
                  onLongPress: () => openBottomSheet(
                    context: context,
                    controller: controller,
                    expense: expense,
                  ),
                  onTap: () => openBottomSheet(
                      controller: controller,
                      expense: expense,
                      context: context),
                ),
              ),
            );
          });
    });
  }
}

void openBottomSheet(
    {required ExpenseController controller,
    required ExpenseModel expense,
    required BuildContext context}) {
  Get.bottomSheet(
    BottomSheetExpense(
      callback: (e) async {
        Get.back();
        if (e == 1) {
          final res = await showDialog<ExpenseModel?>(
              context: context,
              builder: (context) {
                return DialogAddExpense(expense: expense);
              });
          if (res != null) controller.editExpense(expense: res);
        } else if (e == 3) {
          final res = await showDialog<bool?>(
              context: context,
              builder: (context) {
                return DialogDeleteExpense(expense: expense);
              });
          if (res == true) controller.deleteExpense(expense: expense);
        }
      },
    ),
    persistent: false,
    backgroundColor: Colors.white,
    elevation: 2,
  );
}

class _FloatingButton extends StatelessWidget {
  final ExpenseController controller;
  const _FloatingButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.primary,
      onPressed: () async {
        final res = await showDialog<ExpenseModel?>(
            context: context,
            builder: (context) {
              return const DialogAddExpense();
            });
        if (res != null) controller.addExpense(expense: res);
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
