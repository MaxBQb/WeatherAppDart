import 'package:flutter/material.dart';
import 'package:weather_app/core/presentation/text/text.dart';

class IconText extends StatelessWidget {
  final String label;
  final String? value;
  final IconData icon;
  const IconText(
      {Key? key, required this.label, required this.value, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 6),
        MyRichText(label: label, value: value ?? "???"),
      ],
    );
  }
}
