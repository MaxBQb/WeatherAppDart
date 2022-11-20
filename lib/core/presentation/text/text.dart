import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  final String label;
  final String value;
  const MyRichText({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
                text: '$label: ',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextSpan(text: value, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
