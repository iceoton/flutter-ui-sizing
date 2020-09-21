import 'package:flutter/material.dart';

class TextOneLine extends StatelessWidget {
  final String data;
  final TextStyle style;

  const TextOneLine(this.data, {@required this.style});

  @override
  Widget build(BuildContext context) {
    return FittedBox(fit: BoxFit.contain, child: Text(data, style: style));
  }
}
