import 'package:flutter/material.dart';

class StatRow extends StatelessWidget {
  final String label;
  final int value;

  const StatRow(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(width: 10),
        Expanded(
          child: LinearProgressIndicator(
            value: value / 100,
            color: Colors.blue,
            backgroundColor: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}