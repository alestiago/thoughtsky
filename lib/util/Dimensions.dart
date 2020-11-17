import 'package:flutter/cupertino.dart';

class Dimensions {
  Dimensions({this.context}) {
    final screen = MediaQuery.of(context);
    this._height = screen.size.height;
    this._width = screen.size.height;
  }

  final BuildContext context;
  double _height;
  double _width;

  double get width {
    return _width;
  }

  double get height {
    return _height;
  }
}
