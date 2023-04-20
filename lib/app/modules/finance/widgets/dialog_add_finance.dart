import 'package:finance_app/app/core/utils/formatters.dart';
import 'package:finance_app/app/core/utils/monthEnum.dart';
import 'package:finance_app/app/core/widgets/app_button.dart';
import 'package:finance_app/app/core/widgets/app_form_field.dart';
import 'package:finance_app/app/models/finance_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask/mask.dart';
import 'package:month_selector/month_selector.dart';

class DialogAddFinance extends StatefulWidget {
  final FinanceModel? finance;
  const DialogAddFinance({Key? key, this.finance}) : super(key: key);

  @override
  State<DialogAddFinance> createState() => _DialogAddFinanceState();
}

class _DialogAddFinanceState extends State<DialogAddFinance> {
  DateTime? editMonth;
  final editPrice = TextEditingController();

  @override
  void initState() {
    if (widget.finance != null) {
      loadFinance();
    }
    super.initState();
  }

  @override
  void dispose() {
    editPrice.dispose();
    super.dispose();
  }

  loadFinance() {
    final FinanceModel finance = widget.finance!;
    editMonth = finance.month;
    editPrice.text = Formatters.moneyDisplay(finance.inflow);
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
                visible: widget.finance == null,
                replacement: Text("Editar finança",
                    style: context.textTheme.headlineSmall,
                    textAlign: TextAlign.center),
                child: Text("Nova finança",
                    style: context.textTheme.headlineSmall,
                    textAlign: TextAlign.center),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: AppButton(
                  label: editMonth != null
                      ? Formatters.monthDisplay(editMonth!)
                      : "Mês da finança",
                  height: 50,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return MonthSelector(
                            months:
                                MonthEnum.values.map((e) => e.name).toList(),
                            labelCancel: "Cancelar",
                            selectedDate: editMonth != null ? [editMonth!] : [],
                            callback: (res) {
                              Navigator.pop(context);
                              if (res != null && res != []) {
                                setState(() {
                                  editMonth = res[0];
                                });
                              }
                            },
                          );
                        });
                  },
                ),
              ),
              const SizedBox(height: 20),
              AppFormField(
                label: "Total de entrada",
                textInputType: TextInputType.number,
                inputFormatters: [Mask.money()],
                controller: editPrice,
              ),
              const SizedBox(height: 20),
              AppButton(onPressed: () {
                final newFinance = FinanceModel(
                  id: widget.finance?.id,
                  inflow: Formatters.moneyToDouble(editPrice.text),
                  month: editMonth ?? DateTime.now(),
                  groups: widget.finance?.groups ?? [],
                );
                Get.back(result: newFinance);
              })
            ],
          ),
        ),
      ),
    );
  }
}
