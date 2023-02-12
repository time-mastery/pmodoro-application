import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constant/constant.dart';

class GlobalIndicator extends StatelessWidget {
  const GlobalIndicator({Key? key, this.color, this.size, this.width})
      : super(key: key);
  final Color? color;
  final double? size, width;

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      color: color ?? Theme.of(context).primaryColor,
      size: size ?? 35,
      lineWidth: width ?? 1.7,
    );
  }
}
