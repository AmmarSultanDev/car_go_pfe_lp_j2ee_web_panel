import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(
      {super.key,
      required this.flexValue,
      required this.headerTitle,
      this.textStyle});

  final int flexValue;
  final String headerTitle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexValue,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: textStyle == null
              ? Text(headerTitle)
              : Text(headerTitle, style: textStyle),
        ),
      ),
    );
  }
}
