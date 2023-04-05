import 'package:finance_app/app/core/utils/formatters.dart';
import 'package:finance_app/app/core/widgets/app_button.dart';
import 'package:finance_app/app/core/widgets/app_form_field.dart';
import 'package:finance_app/app/models/groups_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask/mask.dart';

class DialogAddGroup extends StatefulWidget {
  final GroupModel? group;
  final String? titleDialog;
  const DialogAddGroup({Key? key, this.group, this.titleDialog})
      : super(key: key);

  @override
  State<DialogAddGroup> createState() => _DialogAddGroupState();
}

class _DialogAddGroupState extends State<DialogAddGroup> {
  final editTitle = TextEditingController();
  final editPrice = TextEditingController();

  @override
  void initState() {
    if (widget.group != null) {
      loadFinance();
    }
    super.initState();
  }

  @override
  void dispose() {
    editTitle.dispose();
    editPrice.dispose();
    super.dispose();
  }

  loadFinance() {
    final GroupModel group = widget.group!;
    editTitle.text = group.title;
    editPrice.text = Formatters.moneyDisplay(group.spendingLimit);
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
              Text(widget.titleDialog ?? "Novo grupo",
                  style: context.textTheme.headlineSmall,
                  textAlign: TextAlign.center),
              const SizedBox(height: 20),
              AppFormField(
                label: "Título",
                maxLength: 20,
                controller: editTitle,
              ),
              AppFormField(
                label: "Limite de gastos",
                textInputType: TextInputType.number,
                inputFormatters: [Mask.money()],
                controller: editPrice,
              ),
              const SizedBox(height: 20),
              AppButton(onPressed: () {
                final newGroup = GroupModel(
                  id: widget.group?.id,
                  spendingLimit: Formatters.moneyToDouble(editPrice.text),
                  title: editTitle.text,
                  expenses: widget.group?.expenses ?? [],
                );
                Get.back(result: newGroup);
              })
            ],
          ),
        ),
      ),
    );
  }
}
