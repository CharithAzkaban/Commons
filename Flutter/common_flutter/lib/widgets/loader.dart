import 'package:flutter/cupertino.dart';

class Loader extends StatelessWidget {
  final double? radius;
  const Loader({
    super.key,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: CupertinoActivityIndicator(radius: radius ?? 10.0));
  }
}
