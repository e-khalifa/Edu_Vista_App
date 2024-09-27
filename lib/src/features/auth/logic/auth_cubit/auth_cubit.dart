import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../profile/logic/user_cubit/user_cubit.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // Login
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      var credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credentials.user != null) {
        emit(LoginSuccess());
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginFailed(e.code));
    } catch (e) {
      emit(LoginFailed('unknown-error'));
    }
  }

  // Sign Up
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignupLoading());
    try {
      var credentials =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credentials.user != null) {
        credentials.user!.updateDisplayName(name);

        await UserCubit().createUser(
          name: name,
          email: email,
        );
        emit(SignupSuccess());
      }
    } on FirebaseAuthException catch (e) {
      emit(SignupFailed(e.code));
    } catch (e) {
      emit(SignupFailed('unknown-error'));
    }
  }

  // Reset Password
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    emit(ResetPasswordLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ResetPasswordEmailSent());
    } on FirebaseAuthException catch (e) {
      emit(ResetPasswordFailed(e.code));
    } catch (e) {
      emit(ResetPasswordFailed('unknown-error'));
    }
  }

  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    emit(ResetPasswordLoading());
    try {
      final user = FirebaseAuth.instance.currentUser;
      final credentials = EmailAuthProvider.credential(
        email: user!.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credentials);

      if (newPassword == confirmNewPassword) {
        await user.updatePassword(newPassword);

        emit(ResetPasswordSuccess());
      }
    } on FirebaseAuthException catch (e) {
      emit(ResetPasswordFailed(e.code));
    } catch (e) {
      emit(ResetPasswordFailed('unknown-error'));
    }
  }

  Future<void> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      emit(AuthLoggedOut());
    } catch (e) {
      emit(LogOutFailed('Error logging out: $e'));
    }
  }
}
