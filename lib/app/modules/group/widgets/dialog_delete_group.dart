import 'package:finance_app/app/core/ui/app_color.dart';
import 'package:finance_app/app/core/widgets/app_button.dart';
import 'package:finance_app/app/models/groups_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogDeleteGroup extends StatefulWidget {
  final GroupModel group;
  const DialogDeleteGroup({super.key, required this.group});

  @override
  State<DialogDeleteGroup> createState() => _DialogDeleteGroupState();
}

class _DialogDeleteGroupState extends State<DialogDeleteGroup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Deletar grupo",
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Text.rich(
              TextSpan(
                  text: "Tem certeza que deseja deletar o grupo ",
                  children: [
                    TextSpan(
                        text: widget.group.title,
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
