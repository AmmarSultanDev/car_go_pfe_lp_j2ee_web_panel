import 'package:car_go_pfe_lp_j2ee_web_panel/methods/firestore_methods.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/widgets/data_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DriversDataList extends StatefulWidget {
  const DriversDataList({super.key});

  @override
  State<DriversDataList> createState() => _DriversDataListState();
}

class _DriversDataListState extends State<DriversDataList> {
  String splitPlateNumber(String plateNumber) {
    var splittedPlateNumber = [];
    plateNumber = plateNumber.replaceAll(' ', ''); // Remove all spaces
    splittedPlateNumber = plateNumber.split('-');

    var plateNumberDigits = '';
    var plateNumberLetter = '';
    var plateNumberCityCode = '';

    for (String part in splittedPlateNumber) {
      if (part.length > 2 && part.length <= 5 && part.contains(RegExp(r'\d'))) {
        plateNumberDigits = part;
      } else if (part.contains(RegExp(r'[ء-ي]'))) {
        plateNumberLetter = part;
      } else if (part.length <= 2 && part.contains(RegExp(r'\d'))) {
        plateNumberCityCode = part;
      }
    }

    return '$plateNumberDigits | \u200F$plateNumberLetter\u200E | $plateNumberCityCode';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('drivers').snapshots(),
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
            DocumentSnapshot driver = snapshot.data!.docs[index];
            return FutureBuilder<String>(
              future: FirestoreMethods().getDriverTotalEarnings(driver['uid']),
              builder: (BuildContext context,
                  AsyncSnapshot<String> earningsSnapshot) {
                if (earningsSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (earningsSnapshot.hasError) {
                  return Text('Error: ${earningsSnapshot.error}');
                } else {
                  return Expanded(
                    child: Row(
                      children: [
                        DataItem(flexValue: 1, data: driver['uid']),
                        DataItem(
                          flexValue: 1,
                          data: driver['photoUrl'],
                          isImage: true,
                        ),
                        DataItem(flexValue: 1, data: driver['displayName']),
                        DataItem(flexValue: 1, data: driver['email']),
                        DataItem(flexValue: 1, data: driver['phoneNumber']),
                        DataItem(
                            flexValue: 1,
                            data: splitPlateNumber(
                                    driver['vehiculePlateNumber']) +
                                '\n' +
                                driver['vehiculeModel'] +
                                '\n' +
                                driver['vehiculeColor']),
                        DataItem(
                            flexValue: 1, data: '\$ ${earningsSnapshot.data!}'),
                        DataItem(
                            flexValue: 1,
                            data: driver['isBlocked'].toString(),
                            driverId: driver['uid'],
                            isButton: true),
                      ],
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
