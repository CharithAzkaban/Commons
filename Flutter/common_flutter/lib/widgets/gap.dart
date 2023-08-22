import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double? hGap;
  final double? vGap;
  const Gap({
    super.key,
    this.hGap,
    this.vGap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: hGap ?? 0.0,
      height: vGap ?? 0.0,
    );
  }
}
