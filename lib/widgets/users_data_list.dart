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
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signInAnonymously();
  }

  void signInAnonymously() async {
    UserCredential userCredential = await _auth.signInAnonymously();
  }

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
            return Expanded(
              child: Row(
                children: [
                  DataItem(flexValue: 1, data: passenger['uid']),
                  DataItem(flexValue: 1, data: passenger['displayName']),
                  DataItem(flexValue: 1, data: passenger['email']),
                  DataItem(flexValue: 1, data: passenger['phoneNumber']),
                  DataItem(
                      flexValue: 1,
                      data: '\$ ${passenger['totalExpenses'].toString()}'),
                  DataItem(
                      flexValue: 1,
                      data: passenger['numberOfTrips'].toString()),
                  DataItem(
                      flexValue: 1,
                      data: passenger['isBlocked'].toString(),
                      isButton: true),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
