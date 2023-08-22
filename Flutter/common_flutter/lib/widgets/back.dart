import 'package:common_flutter/commons/actions.dart';
import 'package:common_flutter/commons/consts.dart';
import 'package:common_flutter/commons/enums.dart';
import 'package:flutter/material.dart';

class Back extends StatelessWidget {
  final dynamic result;
  final CloseEnum closeType;
  const Back({
    super.key,
    this.result,
    this.closeType = CloseEnum.back,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () {
        if (Navigator.canPop(context)) {
          pop(
            context,
            result: result,
          );
        }
      },
      backgroundColor: primaryText.withAlpha(50),
      elevation: 0.0,
      child: Icon(
        closeType == CloseEnum.close ? Icons.close : Icons.arrow_back_rounded,
        color: primaryText,
      ),
    );
  }
}
