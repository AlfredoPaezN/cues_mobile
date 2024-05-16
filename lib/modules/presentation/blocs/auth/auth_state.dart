part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.autenticate() = _Authenticate;
  const factory AuthState.isLoading() = _IsLoading;
  const factory AuthState.isError() = _isError;
}
