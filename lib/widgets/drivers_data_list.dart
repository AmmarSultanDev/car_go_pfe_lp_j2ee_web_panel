import 'package:car_go_pfe_lp_j2ee_web_panel/widgets/data_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DriversDataList extends StatefulWidget {
  const DriversDataList({super.key});

  @override
  State<DriversDataList> createState() => _DriversDataListState();
}

class _DriversDataListState extends State<DriversDataList> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signInAnonymously();
  }

  void signInAnonymously() async {
    UserCredential userCredential = await auth.signInAnonymously();
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

        Future<String> getTotalEarnings(String driverId) async {
          DocumentSnapshot earningsDoc = await FirebaseFirestore.instance
              .collection('earnings')
              .doc(driverId)
              .get();
          return earningsDoc['totalEarnings'].toString();
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot driver = snapshot.data!.docs[index];
            return FutureBuilder<String>(
              future: getTotalEarnings(driver['uid']),
              builder: (BuildContext context,
                  AsyncSnapshot<String> earningsSnapshot) {
                if (earningsSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
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
                            data: driver['vehiculePlateNumber'] +
                                '\n' +
                                driver['vehiculeModel'] +
                                '\n' +
                                driver['vehiculeColor']),
                        DataItem(
                            flexValue: 1, data: '\$ ' + earningsSnapshot.data!),
                        DataItem(
                            flexValue: 1,
                            data: driver['isBlocked'].toString(),
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
