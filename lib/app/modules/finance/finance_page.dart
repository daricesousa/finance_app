import 'package:finance_app/app/core/utils/formatters.dart';
import 'package:finance_app/app/models/finance_model.dart';
import 'package:finance_app/app/modules/finance/widgets/dialog_add_finance.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'finance_controller.dart';

class FinancePage extends GetView<FinanceController> {
  const FinancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finanças'),
        centerTitle: true,
      ),
      body: body(),
      floatingActionButton: addButton(context),
    );
  }

  Widget body() {
    return Obx(() {
      final listLength = controller.finances.length;
      return ListView.builder(
          itemCount: listLength + 1,
          itemBuilder: (context, index) {
            if (index == listLength) return const SizedBox(height: 60);
            final finance = controller.finances[index];
            return ListTile(
                title: Text(finance.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Entrada: ${Formatters.moneyDisplay(finance.inflow)}"),
                    Text(
                        "Saída: ${Formatters.moneyDisplay(finance.totalAmountGroups())}"),
                  ],
                ));
          });
    });
  }

  Widget addButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        final res = await showDialog<FinanceModel>(
          context: context,
          builder: (context) {
            return const DialogAddFinance();
          },
        );
        if (res != null) {
          controller.addFinance(res);
        }
      },
    );
  }
}
