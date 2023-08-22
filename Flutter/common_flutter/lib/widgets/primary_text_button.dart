import 'package:common_flutter/commons/consts.dart';
import 'package:flutter/material.dart';

import 'primary_text.dart';

class PrimaryTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Widget? icon;
  final Color? color;
  const PrimaryTextButton({
    super.key,
    this.onPressed,
    this.icon,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? TextButton.icon(
            onPressed: onPressed,
            icon: icon!,
            label: PrimaryText(
              label,
              color: color ?? primary,
            ),
          )
        : TextButton(
            onPressed: onPressed,
            child: PrimaryText(
              label,
              color: color ?? primary,
            ),
          );
  }
}
