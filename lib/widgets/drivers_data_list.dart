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
    print('User ID: ${userCredential.user!.uid}');
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
                  DataItem(flexValue: 1, data: driver['vehiculeNumber']),
                  DataItem(flexValue: 1, data: '0.00\$'),
                  DataItem(flexValue: 1, data: 'actions'),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
