import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_demo/data/dto/sparkuser.dart';
import 'package:firebase_auth_demo/data/repository/authenticator.dart';
import 'package:firebase_auth_demo/data/repository/database.dart';
import 'package:firebase_auth_demo/presentation/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final Authenticator _authenticator = const Authenticator();
  final Database _database = Database();

  AuthenticationCubit() : super(const AuthenticationState.unknown()) {
    if (FirebaseAuth.instance.currentUser == null) {
      emit(const AuthenticationState.unauthenticated());
    } else {
      fetchUser(FirebaseAuth.instance.currentUser!.uid);
    }
  }

  Future<bool> forgotPassword(String email) async {
    return await _authenticator.forgotPassword(email);
  }

  void logout() async {
    await _authenticator.logOut();
    emit(const AuthenticationState.unauthenticated());
  }

  void fetchUser(String uid) async {
    SparkUser? user = await _database.fetchUser(uid);
    if (user != null) {
      emit(AuthenticationState.loggedIn(user));
    } else {
      emit(const AuthenticationState.unauthenticated());
    }
  }

  Future<void> login(String email, String password) async {
    logger.e('Loggin in user----------------------------------------');
    Either<UserCredential, CustomException?> userCred =
        await _authenticator.login(email, password);

    userCred.fold((cred) async {
      final SparkUser? loggedInUser = await _database.fetchUser(cred.user!.uid);

      logger.e(loggedInUser);
      if (loggedInUser != null) {
        emit(AuthenticationState.loggedIn(loggedInUser));
      }
    }, (r) {
      logger.e(r);
      if (r == null) {
        emit(AuthenticationState.error(
          CustomException(
              code: '201',
              error: Exception('Error Signing up User'),
              stack: StackTrace.fromString('')),
        ));
      }
      emit(AuthenticationState.error(r!));
    });
  }

  Future<void> signup(String name, String email, String gender, String password,
      int yearOfBirth) async {
    emit(const AuthenticationState.loading());
    Either<UserCredential, CustomException?> userCred =
        await _authenticator.signUp(email, password);

    userCred.fold((l) async {
      SparkUser? user = await _database.register(
        SparkUser(
            name: name,
            yearOfBirth: yearOfBirth,
            gender: gender,
            email: email,
            uid: l.user!.uid),
      );
      if (user != null) {
        emit(AuthenticationState.loggedIn(user));
      }
    }, (r) {
      if (r == null) {
        emit(AuthenticationState.error(
          CustomException(
              code: '201',
              error: Exception('Error Signing up User'),
              stack: StackTrace.fromString('')),
        ));
      }
      emit(AuthenticationState.error(r!));
    });
  }
}
