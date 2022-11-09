import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth_demo/presentation/utils/utils.dart';

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

// Future<AuthResult> loginWithFacebook() async {
//     final loginResult = await FacebookAuth.instance.login();
//     final token = loginResult.accessToken?.token;
//     if (token == null) {
//       return AuthResult.aborted;
//     }
//     final oauthCredentials = FacebookAuthProvider.credential(token);

//     try {
//       await FirebaseAuth.instance.signInWithCredential(
//         oauthCredentials,
//       );
//       return AuthResult.success;
//     } on FirebaseAuthException catch (e) {
//       final email = e.email;
//       final credential = e.credential;
//       if (e.code == Constants.accountExistsWithDifferentCredentialsError &&
//           email != null &&
//           credential != null) {
//         final providers =
//             await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//         if (providers.contains(Constants.googleCom)) {
//           // await loginWithGoogle();
//           FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
//         }
//         return AuthResult.success;
//       }
//       return AuthResult.failure;
//     }
//   }
//   Future<AuthResult> loginWithGoogle() async {
//     final GoogleSignIn googleSignIn = GoogleSignIn(
//       scopes: ['email'],
//     );
//     final signInAccount = await googleSignIn.signIn();
//     if (signInAccount == null) {
//       return AuthResult.aborted;
//     }

//     final googleAuth = await signInAccount.authentication;
//     final oauthCredentials = GoogleAuthProvider.credential(
//       idToken: googleAuth.idToken,
//       accessToken: googleAuth.accessToken,
//     );
//     try {
//       await FirebaseAuth.instance.signInWithCredential(
//         oauthCredentials,
//       );
//       return AuthResult.success;
//     } catch (e) {
//       return AuthResult.failure;
//     }
//   }
// }

enum AuthResult {
  success,
  failure,
  aborted,
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
