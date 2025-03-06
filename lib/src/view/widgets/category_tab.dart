import 'dart:ui';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  final String text;
  final double borderRadius;
  final double blurSigma;
  final Color borderColor;
  final Color textColor;

  const CategoryTab({
    super.key,
    required this.text,
    this.borderRadius = 15.0,
    this.blurSigma = 10.0,
    this.borderColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: Color.fromARGB(80, 255, 255, 255),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 12, color: textColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
