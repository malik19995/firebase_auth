import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_demo/data/dto/sparkuser.dart';
import 'package:firebase_auth_demo/presentation/utils/utils.dart';

class Database {
  Database();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ///
  ///
  /// Fetch Spark User from Cloud Firestore
  Future<SparkUser?> fetchUser(String uid) async {
    try {
      DocumentSnapshot userSnap =
          await _firestore.collection('users').doc(uid).get();

      return SparkUser.fromJson(userSnap.data() as Map<String, dynamic>);
    } catch (err, s) {
      logger.e(err);
      logger.e(s);
      return null;
    }
  }

  ///
  ///
  /// Register Spark User with Cloud Firestore
  Future<SparkUser?> register(SparkUser user) async {
    var result = _firestore.collection('users').doc(user.uid);

    try {
      await result.set(
        user.toJson(),
        SetOptions(merge: true),
      );
      return user;
    } catch (err, s) {
      logger.e(err);
      logger.e(s);
      return null;
    }
  }
}
