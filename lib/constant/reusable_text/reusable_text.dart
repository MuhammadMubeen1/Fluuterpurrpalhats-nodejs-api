import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String title;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? alignment;
  const ReusableText({key, required this.title, this.size, this.weight, this.color, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alignment,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
