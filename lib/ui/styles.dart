import 'package:flutter/material.dart';

class FontSizes {
  static double scale = 1;
  static double get standard => 18 * scale;
}

class TextStyles {
  static TextStyle standard = TextStyle(fontSize: FontSizes.standard);
}

extension TextStyleHelpers on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get white => copyWith(color: Colors.white);
}
