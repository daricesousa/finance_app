import 'package:finance_app/app/core/ui/app_color.dart';
import 'package:finance_app/app/core/utils/formatters.dart';
import 'package:finance_app/app/models/groups_model.dart';
import 'package:finance_app/app/modules/group/widgets/bottom_sheet_group.dart';
import 'package:finance_app/app/modules/group/widgets/dialog_add_group.dart';
import 'package:finance_app/app/modules/group/widgets/dialog_delete_group.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'group_controller.dart';

class GroupPage extends GetView<GroupController> {
  const GroupPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Visibility(
          visible: controller.finance.title != '',
          replacement: const Text("Grupo",
              style: TextStyle(
                color: AppColor.dark,
                fontWeight: FontWeight.w300,
              )),
          child: Text(controller.finance.title,
              style: const TextStyle(
                color: AppColor.dark,
                fontWeight: FontWeight.w300,
              )),
        ),
        centerTitle: true,
      ),
      body: body(),
      floatingActionButton: addButton(context),
    );
  }

  Widget body() {
    return Obx(() {
      final listLength = controller.groups.length;
      return ListView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: listLength + 1,
          itemBuilder: (context, index) {
            if (index == listLength) return const SizedBox(height: 60);
            final group = controller.groups[index];
            return GestureDetector(
              child: Card(
                child: ListTile(
                    title: Text(
                      group.title,
                      style: const TextStyle(color: AppColor.dark),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Limite de gastos: ${Formatters.moneyDisplay(group.spendingLimit)}"),
                        Text("Saída: ${Formatters.moneyDisplay(0)}"),
                      ],
                    )),
              ),
              onLongPress: () =>
                  openBottomSheet(context: context, group: group),
            );
          });
    });
  }

  Future<GroupModel?> openDialog(
      {required BuildContext context,
      GroupModel? group,
      String? titleDialog}) async {
    return await showDialog<GroupModel?>(
        context: context,
        builder: (context) {
          return DialogAddGroup(
            group: group,
            titleDialog: titleDialog,
          );
        });
  }

  void openBottomSheet(
      {required BuildContext context, required GroupModel group}) {
    Get.bottomSheet<String?>(
      BottomSheetGroup(callback: (option) async {
        if (option == 1) {
          final res = await openDialog(context: context, group: group);
          if (res != null) controller.editGroup(group: res);
        } else if (option == 3) {
          final res = await showDialog<bool>(
              context: context,
              builder: (context) {
                return DialogDeleteGroup(
                  group: group,
                );
              });
          if (res == true) controller.deleteGroup(group: group);
        }
        Get.back();
      }),
      backgroundColor: Colors.white,
      persistent: false,
    );
  }

  Widget addButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.primary,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () async {
        final res = await openDialog(context: context);
        if (res != null) controller.addGroup(group: res);
      },
    );
  }
}