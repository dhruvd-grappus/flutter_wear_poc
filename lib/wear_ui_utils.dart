import 'package:flutter/material.dart';

double boxInsetLength(double radius) => radius * 1.4142;

extension WearScreenUtils on BuildContext {


  Size get circularSize {
    final screenSize = MediaQuery.of(this).size;
    var size2 = Size(boxInsetLength(screenSize.width / 2),
        boxInsetLength(screenSize.height / 2));
    return size2;
  }
}
