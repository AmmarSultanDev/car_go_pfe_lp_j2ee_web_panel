import 'package:cloud_firestore/cloud_firestore.dart';

class Driver {
  final String id;
  final String displayName;
  final String email;
  final String phoneNumber;
  final bool isBlocked;
  final String vehiculeNumber;
  final String vehiculeModel;
  final String vehiculeColor;
  final String photoUrl;

  const Driver({
    required this.id,
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.isBlocked,
    required this.vehiculeNumber,
    required this.vehiculeModel,
    required this.vehiculeColor,
    required this.photoUrl,
  });

  static Driver fromSnap(DocumentSnapshot snap) {
    return Driver(
      id: snap['id'] as String,
      displayName: snap['displayName'] as String,
      email: snap['email'] as String,
      phoneNumber: snap['phoneNumber'] as String,
      isBlocked: snap['isBlocked'] as bool,
      vehiculeNumber: snap['vehiculeNumber'] as String,
      vehiculeModel: snap['vehiculeModel'] as String,
      vehiculeColor: snap['vehiculeColor'] as String,
      photoUrl: snap['photoUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      'email': email,
      'phoneNumber': phoneNumber,
      'isBlocked': isBlocked,
      'vehiculeNumber': vehiculeNumber,
      'vehiculeModel': vehiculeModel,
      'vehiculeColor': vehiculeColor,
      'photoUrl': photoUrl,
    };
  }
}
