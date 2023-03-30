import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? colorLabel;
  final Function() onPressed;

  const AppButton(
      {Key? key,
      this.label = "Salvar",
      required this.onPressed,
      this.color,
      this.colorLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)))),
      child: Text(
        label,
        style: TextStyle(color: colorLabel),
      ),
    );
  }
}
