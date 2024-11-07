import 'package:car_go_pfe_lp_j2ee_web_panel/methods/firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DataItem extends StatelessWidget {
  const DataItem({
    super.key,
    required this.flexValue,
    required this.data,
    this.isImage = false,
    this.isBlockButton = false,
    this.isShowMoreButton = false,
    this.driverId,
    this.passengerId,
    this.pickUpLocationLat,
    this.pickUpLocationLng,
    this.dropOffLocationLat,
    this.dropOffLocationLng,
  });

  final int flexValue;
  final String data;
  final bool isImage;
  final bool isBlockButton;
  final bool isShowMoreButton;
  final String? driverId;
  final String? passengerId;
  final String? pickUpLocationLat;
  final String? pickUpLocationLng;
  final double? dropOffLocationLat;
  final double? dropOffLocationLng;

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
        : isBlockButton
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: data == 'true'
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.error,
                      ),
                      onPressed: () async {
                        // block or unblock driver
                        if (data == 'true') {
                          if (passengerId != null) {
                            // unblock passenger
                            await FirestoreMethods()
                                .unblockPassenger(passengerId!);
                          }
                          // unblock driver
                          if (driverId != null) {
                            await FirestoreMethods().unblockDriver(driverId!);
                          }
                        } else {
                          // block driver
                          if (passengerId != null) {
                            // block passenger
                            await FirestoreMethods()
                                .blockPassenger(passengerId!);
                          }
                          if (driverId != null) {
                            await FirestoreMethods().blockDriver(driverId!);
                          }
                        }
                      },
                      child: Text(
                        data == 'true' ? 'Unblock' : 'Block',
                        style: TextStyle(
                            color: data == 'true'
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.onError),
                      ),
                    ),
                  ),
                ),
              )
            : isShowMoreButton
                ? Expanded(
                    flex: flexValue,
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).dividerColor),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Column(
                          children: [
                            Text(data),
                            const SizedBox(height: 5),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () {
                                String;

                                // navigate to google maps
                                launchGoogleMapFromSrourceToDestination(
                                    pickUpLocationLat!,
                                    pickUpLocationLng!,
                                    dropOffLocationLat!,
                                    dropOffLocationLng!);
                              },
                              child: Icon(
                                Icons.more_horiz,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    flex: flexValue,
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).dividerColor),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SelectableText(data),
                      ),
                    ),
                  );
  }

  void launchGoogleMapFromSrourceToDestination(
      String pickUpLocationLatitude,
      String pickUpLocationLongitude,
      double dropOffLocationLatitude,
      double dropOffLocationLongitude) async {
    String directionAPIUrl =
        'https://www.google.com/maps/dir/?api=1&origin=$pickUpLocationLatitude,$pickUpLocationLongitude&destination=$dropOffLocationLatitude,$dropOffLocationLongitude&travelmode=driving&dir_action=navigate';

    if (await canLaunchUrl(Uri.parse(directionAPIUrl))) {
      launchUrl(Uri.parse(directionAPIUrl));
    } else {
      throw 'Could not launch $directionAPIUrl';
    }
  }
}
