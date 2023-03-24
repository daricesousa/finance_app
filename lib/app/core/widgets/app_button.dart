import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const AppButton({Key? key, this.label = "Salvar", required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)))),
      child: Text(label),
    );
  }
}
