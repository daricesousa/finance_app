import 'package:finance_app/app/core/ui/app_color.dart';
import 'package:finance_app/app/core/utils/formatters.dart';
import 'package:finance_app/app/core/widgets/app_button.dart';
import 'package:finance_app/app/models/finance_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogDeleteFinance extends StatefulWidget {
  final FinanceModel finance;
  const DialogDeleteFinance({super.key, required this.finance});

  @override
  State<DialogDeleteFinance> createState() => _DialogDeleteFinanceState();
}

class _DialogDeleteFinanceState extends State<DialogDeleteFinance> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Deletar finança", style: context.textTheme.headlineSmall),
            const SizedBox(height: 20),
            Text.rich(
              TextSpan(
                  text: "Tem certeza que deseja deletar a finança ",
                  children: [
                    TextSpan(
                        text: Formatters.monthDisplay(widget.finance.month),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: AppColor.dark)),
                    const TextSpan(text: "?"),
                  ]),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                    label: "Cancelar",
                    color: AppColor.primary,
                    onPressed: () {
                      Get.back();
                    }),
                AppButton(
                    label: "Confirmar",
                    color: AppColor.red,
                    colorLabel: Colors.white,
                    onPressed: () {
                      Get.back(result: true);
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
