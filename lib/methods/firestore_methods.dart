import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> getDriverTotalEarnings(String driverId) async {
    DocumentSnapshot earningsDoc = await FirebaseFirestore.instance
        .collection('earnings')
        .doc(driverId)
        .get();
    return earningsDoc['totalEarnings'].toString();
  }

  Future<double> getPassengerTotalExpenses(String passengerId) async {
    QuerySnapshot tripRequests = await FirebaseFirestore.instance
        .collection('tripRequests')
        .where('passengerInfo.uid', isEqualTo: passengerId)
        .where('status', isEqualTo: 'ended')
        .get();

    double totalExpenses = 0.0;
    for (var doc in tripRequests.docs) {
      totalExpenses += double.parse(doc['fareAmount']);
    }

    return totalExpenses;
  }

  Future<int> getPassengerNumberOfTrips(String passengerId) async {
    QuerySnapshot tripRequests = await FirebaseFirestore.instance
        .collection('tripRequests')
        .where('passengerInfo.uid', isEqualTo: passengerId)
        .where('status', isEqualTo: 'ended')
        .get();

    return tripRequests.docs.length;
  }

  blockDriver(String driverId) async {
    try {
      await _firestore.collection('drivers').doc(driverId).update({
        'isBlocked': true,
      });
    } catch (e) {
      // handle error
    }
  }

  unblockDriver(String driverId) async {
    try {
      await _firestore.collection('drivers').doc(driverId).update({
        'isBlocked': false,
      });
    } catch (e) {
      // handle error
    }
  }

  blockPassenger(String passengerId) async {
    try {
      await _firestore.collection('users').doc(passengerId).update({
        'isBlocked': true,
      });
    } catch (e) {
      // handle error
    }
  }

  unblockPassenger(String passengerId) async {
    try {
      await _firestore.collection('users').doc(passengerId).update({
        'isBlocked': false,
      });
    } catch (e) {
      // handle error
    }
  }
}
