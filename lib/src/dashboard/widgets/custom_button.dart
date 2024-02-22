import 'package:flutter/material.dart';
import 'package:mathgame/src/core/color_scheme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.callback});
  final String title;
  final Function() callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.infoDialogBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(title),
      ),
    );
  }
}
