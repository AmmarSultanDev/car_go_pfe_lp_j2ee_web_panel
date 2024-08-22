import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  const DataItem({super.key, required this.flexValue, required this.data});

  final int flexValue;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexValue,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.grey.shade100,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(data),
        ),
      ),
    );
  }
}
