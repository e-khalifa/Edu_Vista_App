import 'package:meta/meta.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

// Signup States
final class SignupState extends AuthState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {}

final class SignupFailed extends SignupState {
  final String error;

  SignupFailed(this.error);
}

// Login States
final class LoginState extends AuthState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailed extends LoginState {
  final String error;

  LoginFailed(this.error);
}

// Rsest Password States
final class ResetPasswordState extends AuthState {}

final class ResetPasswordEmailSent extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {}

final class ResetPasswordFailed extends ResetPasswordState {
  final String error;
  ResetPasswordFailed(this.error);
}

// Logout State
final class AuthLoggedOut extends AuthState {}

final class LogOutFailed extends AuthLoggedOut {
  final String error;
  LogOutFailed(this.error);
}
