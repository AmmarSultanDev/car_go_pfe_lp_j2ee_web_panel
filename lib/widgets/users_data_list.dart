import 'package:car_go_pfe_lp_j2ee_web_panel/methods/firestore_methods.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/widgets/data_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UsersDataList extends StatefulWidget {
  const UsersDataList({super.key});

  @override
  State<UsersDataList> createState() => _UsersDataListState();
}

class _UsersDataListState extends State<UsersDataList> {
  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
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
            DocumentSnapshot passenger = snapshot.data!.docs[index];
            return FutureBuilder<List<dynamic>>(
              future: Future.wait([
                _firestoreMethods.getPassengerTotalExpenses(passenger['uid']),
                _firestoreMethods.getPassengerNumberOfTrips(passenger['uid']),
              ]),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Expanded(
                    child: Row(
                      children: [
                        DataItem(flexValue: 1, data: passenger['uid']),
                        DataItem(flexValue: 1, data: passenger['displayName']),
                        DataItem(flexValue: 1, data: passenger['email']),
                        DataItem(flexValue: 1, data: passenger['phoneNumber']),
                        DataItem(
                          flexValue: 1,
                          data: snapshot.data![0].toStringAsFixed(2),
                        ),
                        DataItem(
                          flexValue: 1,
                          data: snapshot.data![1].toString(),
                        ),
                        DataItem(
                          flexValue: 1,
                          data: passenger['isBlocked'].toString(),
                          isBlockButton: true,
                          passengerId: passenger['uid'],
                        ),
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
