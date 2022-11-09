part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.unknown() = _Unknown;

  const factory AuthenticationState.loading() = _Loading;
  const factory AuthenticationState.loggedIn(SparkUser currentUser) = _LoggedIn;

  const factory AuthenticationState.unauthenticated() = _Unauthenticated;
  const factory AuthenticationState.error(Exception error) = _Error;
}
