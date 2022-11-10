import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth_demo/presentation/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authenticator {
  const Authenticator();

  // getters

  bool get isAlreadyLoggedIn => userId != null;
  String? get userId => FirebaseAuth.instance.currentUser?.uid;
  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';
  String? get email => FirebaseAuth.instance.currentUser?.email;

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<Either<UserCredential, CustomException?>> login(
      String email, String password) async {
    try {
      return Left(
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );
    } on FirebaseAuthException catch (err, s) {
      logger.e(err);
      logger.e(s);
      return Right(CustomException(error: err, stack: s, code: err.code));
    } catch (err, s) {
      logger.e(err);
      logger.e(s);
      return const Right(null);
    }
  }

  Future<bool> forgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } catch (err, s) {
      logger.e(err);
      logger.e(s);
      Fluttertoast.showToast(msg: handleException(err));
      return false;
    }
  }

  Future<Either<UserCredential, CustomException?>> signUp(
      String email, String password) async {
    try {
      return Left(await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password));
    } on FirebaseAuthException catch (err, s) {
      logger.e(err);
      logger.e(s);
      return Right(CustomException(error: err, stack: s, code: err.code));
    } catch (err, s) {
      logger.e(err);
      logger.e(s);
      return Right(null);
    }
  }
}

class CustomException implements Exception {
  final Exception error;
  final StackTrace stack;
  final String code;
  CustomException({
    required this.error,
    required this.stack,
    required this.code,
  });
}
