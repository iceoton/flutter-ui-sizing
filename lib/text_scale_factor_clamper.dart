import 'package:flutter/material.dart';

class TextScaleFactorClamper extends StatelessWidget {
  const TextScaleFactorClamper({@required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final constrainedTextScaleFactor =
    mediaQueryData.textScaleFactor.clamp(1.0, 1.5);

    return MediaQuery(
      data: mediaQueryData.copyWith(
        textScaleFactor: constrainedTextScaleFactor,
      ),
      child: child,
    );
  }
}