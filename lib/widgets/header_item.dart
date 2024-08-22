import 'package:flutter/material.dart';

class HeaderItem extends StatelessWidget {
  const HeaderItem(
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
          border: Border.all(color: Theme.of(context).dividerColor),
          color: Theme.of(context).scaffoldBackgroundColor,
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
