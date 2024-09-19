import 'package:car_go_pfe_lp_j2ee_web_panel/methods/firestore_methods.dart';
import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  const DataItem({
    super.key,
    required this.flexValue,
    required this.data,
    this.isImage = false,
    this.isButton = false,
    this.driverId,
    this.passengerId,
  });

  final int flexValue;
  final String data;
  final bool isImage;
  final bool isButton;
  final String? driverId;
  final String? passengerId;

  @override
  Widget build(BuildContext context) {
    return isImage
        ? Expanded(
            flex: flexValue,
            child: Container(
              height: 80,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: CircleAvatar(
                radius: 30,
                // ignore: unnecessary_null_comparison
                backgroundImage: data == null || data.isEmpty
                    ? const AssetImage('assets/images/avatar_man.png')
                    : NetworkImage(data, scale: 1),
              ),
            ),
          )
        : isButton
            ? Expanded(
                flex: flexValue,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).dividerColor),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        // block or unblock driver
                        if (data == 'true') {
                          // unblock driver
                          await FirestoreMethods().unblockDriver(driverId!);
                        } else {
                          // block driver
                          await FirestoreMethods().blockDriver(driverId!);
                        }
                      },
                      child: Text(data == 'true' ? 'Unblock' : 'Block'),
                    ),
                  ),
                ),
              )
            : Expanded(
                flex: flexValue,
                child: Container(
                  height: 80,
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
