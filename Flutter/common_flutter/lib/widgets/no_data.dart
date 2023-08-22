import 'package:flutter/material.dart';

import 'primary_text.dart';

class NoData extends StatelessWidget {
  final String noDataString;
  const NoData(this.noDataString, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PrimaryText(
        noDataString,
        textAlign: TextAlign.center,
      ),
    );
  }
}
