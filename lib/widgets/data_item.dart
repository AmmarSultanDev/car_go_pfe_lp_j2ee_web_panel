import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  const DataItem({
    super.key,
    required this.flexValue,
    required this.data,
    this.isImage = false,
    this.isButton = false,
  });

  final int flexValue;
  final String data;
  final bool isImage;
  final bool isButton;

  @override
  Widget build(BuildContext context) {
    return isImage
        ? Expanded(
            flex: flexValue,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: CircleAvatar(
                radius: 30,
                child: Image.network(
                  data,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: $error');
                    return const Text('Error loading image');
                  },
                ),
              ),
            ),
          )
        : isButton
            ? Expanded(
                flex: flexValue,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).dividerColor),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(data == 'true' ? 'Unblock' : 'Block'),
                    ),
                  ),
                ),
              )
            : Expanded(
                flex: flexValue,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).dividerColor),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SelectableText(data),
                  ),
                ),
              );
  }
}
