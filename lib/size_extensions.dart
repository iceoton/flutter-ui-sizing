import 'package:flutter/material.dart';
import 'package:flutter_ui_sizing/size_config.dart';

/// Example of Generic Extensions
extension NumGenericExtensions<T extends num> on T {
  T testIncrease() => this + 1;
}

extension DoubleExtensions on double {
  /// Get the proportionate width as per screen size
  double get proportionateWidth {
    // 375 is the layout width that designer use (iPhone 11 Pro)
    // 414 is the layout height that designer use (iPhone 11)
    const double designWidth = 414.0;
    if (SizeConfig.orientation == Orientation.portrait)
      return ((SizeConfig.screenWidth ?? designWidth) / designWidth) * this;
    else
      return ((SizeConfig.screenHeight ?? designWidth) / designWidth) * this;
  }

  /// Get the proportionate height as per screen size
  double get proportionateHeight {
    // 812 is the layout height that designer use (iPhone 11 Pro)
    // 896 is the layout height that designer use (iPhone 11)
    const double designHeight = 896.0;
    if (SizeConfig.orientation == Orientation.portrait)
      return ((SizeConfig.screenHeight ?? designHeight) / designHeight) * this;
    else
      return ((SizeConfig.screenWidth ?? designHeight) / designHeight) * this;
  }
}
