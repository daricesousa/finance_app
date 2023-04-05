import 'package:finance_app/app/core/ui/app_color.dart';
import 'package:finance_app/app/core/utils/formatters.dart';
import 'package:finance_app/app/models/expense_model.dart';
import 'package:finance_app/app/modules/expense/widgets/dialog_add_expense.dart';
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
        title: Visibility(
          visible: controller.group.title != '',
          replacement: const Text(
            "Despesas",
            style: TextStyle(color: AppColor.dark, fontWeight: FontWeight.w300),
          ),
          child: Text(
            controller.group.title,
            style: const TextStyle(
                color: AppColor.dark, fontWeight: FontWeight.w300),
          ),
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
            return Card(
              child: ListTile(
                  title: Text(expense.title),
                  subtitle:
                      Text("Custo: ${Formatters.moneyDisplay(expense.cost)}")),
            );
          });
    });
  }
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