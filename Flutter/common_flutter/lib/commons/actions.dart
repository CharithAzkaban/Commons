import 'package:common_flutter/widgets/popup_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'attributes.dart';
import 'consts.dart';

void pop(BuildContext context, {dynamic result}) => Navigator.pop(
      context,
      result,
    );

Future popup(
  BuildContext context, {
  Widget? title,
  Widget? content,
  bool outTapDismissible = true,
  List<PopupAction>? actions,
}) =>
    showDialog(
      context: context,
      barrierDismissible: outTapDismissible,
      builder: (context) => isIOS
          ? CupertinoAlertDialog(
              title: title,
              content: Card(
                elevation: 0.0,
                color: transparent,
                child: content,
              ),
            )
          : AlertDialog(
              title: title,
              content: content,
              contentPadding: const EdgeInsets.all(5.0),
              shape: rrBorder(10.0),
              actions: actions,
            ),
    );
