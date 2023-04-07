import "package:flutter/material.dart";

extension SpaceXY on num {
  Widget spaceH() => SizedBox(height: toDouble());
  Widget spaceW() => SizedBox(width: toDouble());
}
