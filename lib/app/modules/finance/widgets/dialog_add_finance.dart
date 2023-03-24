import 'package:finance_app/app/core/widgets/app_button.dart';
import 'package:finance_app/app/core/widgets/app_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask/mask.dart';

class DialogAddFinance extends StatelessWidget {
  const DialogAddFinance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Nova finança",
              style: context.textTheme.headline5,
              textAlign: TextAlign.center
            ),
            const SizedBox(height: 20),
            AppFormField(label: "Título", maxLength: 20,),
            AppFormField(label: "Valor", textInputType: TextInputType.number,inputFormatters: [Mask.money()],),
            const SizedBox(height: 20),
            AppButton(onPressed: () {})
          ],
        ),
      ),
    );
  }
}
