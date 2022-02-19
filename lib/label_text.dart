import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFF000000),
        fontSize: 14,
      ),
      textAlign: TextAlign.left,
    );
  }
}
