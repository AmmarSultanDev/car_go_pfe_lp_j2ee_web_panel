import 'package:car_go_pfe_lp_j2ee_web_panel/models/driver.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // get all drivers data
  Future<List<Driver>> getDrivers() async {
    List<Driver> drivers = [];
    // get drivers data from Firestore
    try {
      // get drivers data
      QuerySnapshot driversData = await _firestore.collection('drivers').get();
      // create a list of drivers

      // loop through drivers data
      driversData.docs.forEach((driver) {
        // create a driver object
        Driver driverObj = Driver(
          id: driver['uid'],
          displayName: driver['displayName'],
          email: driver['email'],
          phoneNumber: driver['phoneNumber'],
          isBlocked: driver['isBlocked'],
          vehiculeNumber: driver['vehiculeNumber'],
          vehiculeModel: driver['vehiculeModel'],
          vehiculeColor: driver['vehiculeColor'],
          photoUrl: driver['photoUrl'],
          totalEarnings: driver['totalEarnings'],
        );
        // add driver object to drivers list
        drivers.add(driverObj);
      });
    } catch (e) {
      // handle error
    }
    // return drivers data
    print(drivers);
    return drivers;
  }
}
