import 'package:flutter/material.dart';

class DefaultRow extends StatelessWidget {
  final String label;
  final String value;

  const DefaultRow(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(width: 10),
        Text(":", style: TextStyle(fontSize: 16)),
        SizedBox(width: 10),
        Text(value, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}