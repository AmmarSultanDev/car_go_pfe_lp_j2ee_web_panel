import 'package:car_go_pfe_lp_j2ee_web_panel/widgets/data_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TirpsDataList extends StatefulWidget {
  const TirpsDataList({super.key});

  @override
  State<TirpsDataList> createState() => _TirpsDataListState();
}

class _TirpsDataListState extends State<TirpsDataList> {
  // Add this helper function to format the timestamp
  String _formatTimestamp(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
  }

  // Add this helper function to calculate the trip duration
  String _calculateTripDuration(Timestamp createdAt, Timestamp endedAt) {
    // Convert timestamps to DateTime objects
    DateTime createdDate = createdAt.toDate();
    DateTime endedDate = endedAt.toDate();

    // Calculate the duration between the two dates
    Duration duration = endedDate.difference(createdDate);

    // Format the duration as needed, e.g., in hours and minutes
    String formattedDuration =
        '${duration.inHours}h ${duration.inMinutes % 60}m';
    return formattedDuration;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('tripRequests')
            .where('status', isEqualTo: 'ended')
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error occured'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot trip = snapshot.data!.docs[index];
              return Expanded(
                child: Row(
                  children: [
                    DataItem(flexValue: 1, data: trip.id),
                    DataItem(flexValue: 1, data: trip['driverInfo']['uid']),
                    DataItem(
                        flexValue: 1, data: trip['driverInfo']['displayName']),
                    DataItem(flexValue: 1, data: trip['passengerInfo']['uid']),
                    DataItem(
                        flexValue: 1,
                        data: trip['passengerInfo']['displayName']),
                    DataItem(
                        flexValue: 1, data: trip['driverInfo']['phoneNumber']),
                    DataItem(
                        flexValue: 1,
                        data: trip['driverInfo']['vehiculePlateNumber'] +
                            '\n' +
                            trip['driverInfo']['vehiculeModel'] +
                            '\n' +
                            trip['driverInfo']['vehiculeColor']),
                    DataItem(flexValue: 1, data: trip['fareAmount']),
                    DataItem(
                        flexValue: 1,
                        data: _formatTimestamp(trip['createdAt'])),
                    // caculate trip duration from createdAt and endedAt

                    DataItem(
                      flexValue: 1,
                      isShowMoreButton: true,
                      data: _calculateTripDuration(
                          trip['createdAt'], trip['endedAt']),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
