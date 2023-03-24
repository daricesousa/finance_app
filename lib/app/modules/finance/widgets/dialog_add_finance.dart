import 'package:finance_app/app/core/utils/formatters.dart';
import 'package:finance_app/app/core/widgets/app_button.dart';
import 'package:finance_app/app/core/widgets/app_form_field.dart';
import 'package:finance_app/app/models/finance_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask/mask.dart';

class DialogAddFinance extends StatefulWidget {
  const DialogAddFinance({Key? key}) : super(key: key);

  @override
  State<DialogAddFinance> createState() => _DialogAddFinanceState();
}

class _DialogAddFinanceState extends State<DialogAddFinance> {
  final editTitle = TextEditingController();
  final editPrice = TextEditingController();

  @override
  void dispose() {
    editTitle.dispose();
    editPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Nova finança",
                style: context.textTheme.headline5,
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            AppFormField(
              label: "Título",
              maxLength: 20,
              controller: editTitle,
            ),
            AppFormField(
              label: "Total de entrada",
              textInputType: TextInputType.number,
              inputFormatters: [Mask.money()],
              controller: editPrice,
            ),
            const SizedBox(height: 20),
            AppButton(onPressed: () {
              final finance = FinanceModel(
                entrada: Formatters.moneyToDouble(editPrice.text),
                title: editTitle.text,
                groups: [],
              );
              Get.back(result: finance);
            })
          ],
        ),
      ),
    );
  }
}
