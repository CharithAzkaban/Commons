import 'dart:async';

import 'package:common_flutter/commons/consts.dart';
import 'package:flutter/material.dart';

import 'primary_text.dart';

class PrimaryButton extends StatefulWidget {
  final FutureOr Function()? onPressed;
  final String label;
  final String? waitingLabel;
  final Color? backgroundColor;
  final double? width;
  final bool mini;
  final bool outlined;
  final Widget? icon;
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.waitingLabel,
    this.backgroundColor,
    this.width,
    this.mini = false,
    this.outlined = false,
    this.icon,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  final _waitListener = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _waitListener,
      builder: (context, isWaiting, _) => SizedBox(
        width: widget.width,
        child: widget.outlined
            ? widget.icon != null
                ? OutlinedButton.icon(
                    onPressed: isWaiting
                        ? null
                        : widget.onPressed is Future Function()
                            ? () async {
                                _waitListener.value = true;
                                await widget.onPressed!();
                                _waitListener.value = false;
                              }
                            : widget.onPressed,
                    style: OutlinedButton.styleFrom(
                      elevation: 0.0,
                      padding: EdgeInsets.all(widget.mini ? 10.0 : 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(widget.mini ? 5.0 : 8.0),
                      ),
                      side: BorderSide(color: primary),
                    ),
                    icon: widget.icon!,
                    label: PrimaryText(
                      isWaiting
                          ? widget.waitingLabel ?? 'Wait...'
                          : widget.label,
                      color: primary,
                    ),
                  )
                : OutlinedButton(
                    onPressed: isWaiting
                        ? null
                        : widget.onPressed is Future Function()
                            ? () async {
                                _waitListener.value = true;
                                await widget.onPressed!();
                                _waitListener.value = false;
                              }
                            : widget.onPressed,
                    style: OutlinedButton.styleFrom(
                      elevation: 0.0,
                      padding: EdgeInsets.all(widget.mini ? 10.0 : 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(widget.mini ? 5.0 : 8.0),
                      ),
                      side: BorderSide(color: primary),
                    ),
                    child: PrimaryText(
                      isWaiting
                          ? widget.waitingLabel ?? 'Wait...'
                          : widget.label,
                      color: primary,
                    ),
                  )
            : widget.icon != null
                ? ElevatedButton.icon(
                    onPressed: isWaiting
                        ? null
                        : widget.onPressed is Future Function()
                            ? () async {
                                _waitListener.value = true;
                                await widget.onPressed!();
                                _waitListener.value = false;
                              }
                            : widget.onPressed,
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: widget.backgroundColor ?? primary,
                      padding: EdgeInsets.all(widget.mini ? 10.0 : 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(widget.mini ? 5.0 : 8.0),
                      ),
                    ),
                    icon: widget.icon!,
                    label: PrimaryText(
                      isWaiting
                          ? widget.waitingLabel ?? 'Wait...'
                          : widget.label,
                      color: white,
                    ),
                  )
                : ElevatedButton(
                    onPressed: isWaiting
                        ? null
                        : widget.onPressed is Future Function()
                            ? () async {
                                _waitListener.value = true;
                                await widget.onPressed!();
                                _waitListener.value = false;
                              }
                            : widget.onPressed,
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: widget.backgroundColor ?? primary,
                      padding: EdgeInsets.all(widget.mini ? 10.0 : 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(widget.mini ? 5.0 : 8.0),
                      ),
                    ),
                    child: PrimaryText(
                      isWaiting
                          ? widget.waitingLabel ?? 'Wait...'
                          : widget.label,
                      color: white,
                    ),
                  ),
      ),
    );
  }
}
