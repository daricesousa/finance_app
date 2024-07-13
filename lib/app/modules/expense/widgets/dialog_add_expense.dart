import 'package:finance_app/app/core/utils/formatters.dart';
import 'package:finance_app/app/core/widgets/app_button.dart';
import 'package:finance_app/app/core/widgets/app_form_field.dart';
import 'package:finance_app/app/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask/mask.dart';

class DialogAddExpense extends StatefulWidget {
  final ExpenseModel? expense;
  const DialogAddExpense({Key? key, this.expense}) : super(key: key);

  @override
  State<DialogAddExpense> createState() => _DialogAddExpenseState();
}

class _DialogAddExpenseState extends State<DialogAddExpense> {
  final editTitle = TextEditingController();
  final editPrice = TextEditingController();

  @override
  void initState() {
    if (widget.expense != null) {
      loadExpense();
    }
    super.initState();
  }

  @override
  void dispose() {
    editTitle.dispose();
    editPrice.dispose();
    super.dispose();
  }

  loadExpense() {
    final ExpenseModel expense = widget.expense!;
    editTitle.text = expense.title;
    editPrice.text = Formatters.moneyDisplay(expense.cost);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Visibility(
                visible: widget.expense == null,
                replacement: Text("Editar despesa",
                    style: context.textTheme.headlineSmall,
                    textAlign: TextAlign.center),
                child: Text("Nova despesa",
                    style: context.textTheme.headlineSmall,
                    textAlign: TextAlign.center),
              ),
              const SizedBox(height: 20),
              AppFormField(
                label: "Título",
                controller: editTitle,
              ),
              AppFormField(
                label: "Custo",
                textInputType: TextInputType.number,
                inputFormatters: [Mask.money()],
                controller: editPrice,
              ),
              const SizedBox(height: 20),
              AppButton(onPressed: () {
                final newExpense = ExpenseModel(
                  id: widget.expense?.id,
                  cost: Formatters.moneyToDouble(editPrice.text),
                  title: editTitle.text,
                );
                Get.back(result: newExpense);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
