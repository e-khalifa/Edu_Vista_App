import 'package:edu_vista/src/shared/utils/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edu_vista/src/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:edu_vista/src/features/auth/logic/auth_cubit/auth_state.dart';
import 'package:edu_vista/src/shared/widgets/buttons/my_elevated_button.dart';
import 'package:edu_vista/src/shared/widgets/text_filed/my_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/utils/color_utility.dart';
import '../../../home/presentation/pages/root_page.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  late PageController pageController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    pageController = PageController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  Future<void> sendResetEmail() async {
    final email = emailController.text;
    if (email.isNotEmpty) {
      await context.read<AuthCubit>().sendPasswordResetEmail(email: email);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an email')),
      );
    }
  }

  Future<void> resetPassword() async {
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (password.isNotEmpty) {
      await context.read<AuthCubit>().updatePassword(
            newPassword: password,
            confirmNewPassword: confirmPassword,
            currentPassword: '',
          );
    } 
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordEmailSent) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password reset email sent')),
          );
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        } else if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Password has been changed successfully')),
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RootPage()));
        } else if (state is ResetPasswordFailed ||
            state is ResetPasswordFailed) {
          String message = getErrorMessage(state.error);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Reset Password',
            style: TextUtility.titleText(),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 37.w, right: 37.w, top: 180.h),
          child: PageView(
            controller: pageController,
            children: [
              buildSendEmailPage(),
              buildResetPasswordPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSendEmailPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyTextField(
          controller: emailController,
          hint: 'Ahmedramy52@gmail.com',
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 129.h),
        MyElevatedButton(
          onPressed: sendResetEmail,
          color: ColorUtility.secondary,
          child: const Text('Submit'),
        ),
      ],
    );
  }

  Widget buildResetPasswordPage() {
    return Column(
      children: [
        MyTextField(
          controller: passwordController,
          hint: '***********',
          label: 'Password',
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        SizedBox(height: 10.h),
        MyTextField(
          controller: confirmPasswordController,
          hint: '***********',
          label: 'Confirm Password',
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        SizedBox(height: 45.h),
        MyElevatedButton(
          onPressed: resetPassword,
          child: const Text('Change Password'),
        ),
      ],
    );
  }

  String getErrorMessage(String error) {
    switch (error) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'invalid-email':
        return 'Invalid email address.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'unknown-error':
        return 'Something went wrong.';
      default:
        return 'An unknown error occurred.';
    }
  }
}
