import 'package:edu_vista/src/features/profile/presentation/pages/profie_page.dart';
import 'package:edu_vista/src/shared/utils/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/widgets/buttons/my_text_button.dart';
import '../../../auth/logic/auth_cubit/auth_cubit.dart';
import '../../../auth/presentation/pages/password_reset_page.dart';
import '../../data/model/user_model.dart';
import '../../logic/user_cubit/user_cubit.dart';
import '../../../../shared/widgets/my_dialog.dart';
import 'profile_edit_list_tile.dart';
import '../../../../shared/widgets/text_filed/my_text_field.dart';
import '../../../../shared/utils/color_utility.dart';
import '../../../../shared/widgets/buttons/my_elevated_button.dart';

class ProfileEditExpansionTile extends StatefulWidget {
  final AppUser user;

  const ProfileEditExpansionTile({
    required this.user,
    super.key,
  });

  @override
  State<ProfileEditExpansionTile> createState() =>
      _ProfileEditExpansionTileState();
}

class _ProfileEditExpansionTileState extends State<ProfileEditExpansionTile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();

  final genderController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    phoneController.dispose();
    ageController.dispose();

    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding:
            EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w, bottom: 10.h),
        child: Column(
          children: [
            ProfileListTile(
              title: 'Name',
              subtitle: widget.user.name,
              onPressed: () => _showNameDialog(context),
            ),
            ProfileListTile(
              title: 'Email',
              subtitle: widget.user.email,
              onPressed: () => _showEmailDialog(context),
            ),
            ProfileListTile(
              title: 'Password',
              onPressed: () => _showPasswordChangeDialog(context),
            ),
            ProfileListTile(
              title: 'Phone Number',
              subtitle: widget.user.phoneNumber,
              onPressed: () => _showPhoneNumberDialog(context),
            ),
            ProfileListTile(
              title: 'Age',
              subtitle: widget.user.age,
              onPressed: () => _showAgeDialog(context),
            ),
            ProfileListTile(
              title: 'Gender',
              subtitle: widget.user.gender,
              onPressed: () => _showGenderSelectionDialog(context),
            ),
            SizedBox(height: 15.h),
            Row(children: [
              SizedBox(width: 150.w),
              Expanded(
                child: MyElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: ColorUtility.main,
                        content: Text(
                          'Changes have been saved!',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Save Changes",
                    style: TextUtility.fringeText(color: Colors.white),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  void _showEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialog(
          title: 'Change Email',
          icon: Icons.email,
          child: MyTextField(
            label: 'Email',
            hint: widget.user.email ?? '',
            controller: emailController,
          ),
          onConfirm: () {
            context.read<UserCubit>().updateUserData(
                  email: emailController.text,
                );
          },
        );
      },
    );
  }

  void _showNameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialog(
          title: 'Change Name',
          icon: Icons.person,
          child: MyTextField(
            label: 'Name',
            hint: widget.user.name ?? '',
            controller: nameController,
          ),
          onConfirm: () {
            context.read<UserCubit>().updateUserData(
                  name: nameController.text,
                );
          },
        );
      },
    );
  }

  void _showPasswordChangeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialog(
          title: 'Change Password',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyTextField(
                label: 'Current Password',
                hint: 'Enter your current Password',
                controller: currentPasswordController,
                obscureText: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: MyTextButton(
                  text: 'Forgot Your Password?',
                  textStyle:
                      TextUtility.fringeText(color: ColorUtility.secondary),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PasswordResetPage()));
                  },
                ),
              ),
              SizedBox(height: 10.h),
              Divider(color: ColorUtility.softGrey),
              MyTextField(
                label: 'New Password',
                hint: 'Enter your New Password',
                controller: newPasswordController,
                obscureText: true,
              ),
              SizedBox(height: 5.h),
              MyTextField(
                label: 'Confirm New Password',
                hint: 'Confirm your New Password',
                controller: confirmNewPasswordController,
                obscureText: true,
              ),
            ],
          ),
          onConfirm: () {
            final currentPassword = currentPasswordController.text;
            final newPassword = newPasswordController.text;
            final confirmNewPassword = confirmNewPasswordController.text;

            context.read<AuthCubit>().updatePassword(
                  currentPassword: currentPassword,
                  newPassword: newPassword,
                  confirmNewPassword: confirmNewPassword,
                );
          },
        );
      },
    );
  }

  void _showPhoneNumberDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialog(
            title: 'Add Phone Number',
            icon: Icons.phone,
            child: MyTextField(
              controller: phoneController,
              label: 'Phone Number',
              hint: widget.user.phoneNumber!,
            ),
            onConfirm: () {
              context.read<UserCubit>().updateUserData(
                    phoneNumber: phoneController.text,
                  );
            });
      },
    );
  }

  void _showAgeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialog(
            title: 'Add Age',
            child: MyTextField(
              controller: ageController,
              label: 'Age',
              hint: widget.user.age!,
            ),
            onConfirm: () {
              context.read<UserCubit>().updateUserData(
                    age: ageController.text,
                  );
            });
      },
    );
  }

  void _showGenderSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialog(
            title: 'Select Gender',
            icon: Icons.wc,
            child: DropdownButtonFormField<String>(
              borderRadius: BorderRadius.circular(15.r),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.h),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      width: 2,
                      color: ColorUtility.softGrey,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      width: 2,
                      color: ColorUtility.softGrey,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: ColorUtility.softGrey),
                ),
              ),
              hint: Text(widget.user.gender!, style: TextUtility.hintText()),
              value: genderController.text.isNotEmpty
                  ? genderController.text
                  : null,
              items: ['Male', 'Female'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  genderController.text = value;
                }
              },
            ),
            onConfirm: () {
              context.read<UserCubit>().updateUserData(
                    gender: genderController.text,
                  );
            });
      },
    );
  }
}
