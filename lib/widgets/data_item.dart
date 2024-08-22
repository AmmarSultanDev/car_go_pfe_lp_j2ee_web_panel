import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  const DataItem({
    super.key,
    required this.flexValue,
    required this.data,
    this.isImage = false,
  });

  final int flexValue;
  final String data;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return isImage
        ? Expanded(
            flex: flexValue,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
              ),
              child: Image.network(data),
            ),
          )
        : Expanded(
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
