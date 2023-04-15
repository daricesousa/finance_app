import 'package:finance_app/app/core/ui/app_color.dart';
import 'package:finance_app/app/core/widgets/app_button.dart';
import 'package:finance_app/app/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogDeleteExpense extends StatelessWidget {
  final ExpenseModel expense;
  const DialogDeleteExpense({Key? key, required this.expense})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Deletar despesa",
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Text.rich(
              TextSpan(
                text: "Deseja deletar a despesa ",
                children: [
                  TextSpan(
                    text: expense.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: AppColor.dark),
                  ),
                  const TextSpan(text: "?"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                  onPressed: () => Get.back(result: false),
                  label: "Cancelar",
                  colorLabel: AppColor.dark,
                  color: AppColor.primary,
                ),
                Container(width: 10),
                AppButton(
                  onPressed: () => Get.back(result: true),
                  label: "Confirmar",
                  colorLabel: Colors.white,
                  color: AppColor.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
