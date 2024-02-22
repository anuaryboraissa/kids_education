import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mathgame/src/core/color_scheme.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.parentContext});
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.of(parentContext).pop();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.infoDialogBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12.0),
        child: RepaintBoundary(
          child: Icon(Icons.arrow_back_ios_new_outlined)
              .animate(
                onPlay: (controller) => controller.repeat(reverse: true),
              )
              .scaleXY(begin: 1.1, end: 0.8),
        ),
      ),
    );
  }
}
