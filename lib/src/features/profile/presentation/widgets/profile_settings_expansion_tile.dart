import 'package:edu_vista/src/features/auth/presentation/pages/login_page.dart';
import 'package:edu_vista/src/features/profile/logic/user_cubit/user_cubit.dart';
import 'package:edu_vista/src/shared/widgets/my_dialog.dart';
import 'package:edu_vista/src/shared/utils/color_utility.dart';
import 'package:edu_vista/src/shared/utils/text_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/widgets/buttons/my_text_button.dart';
import '../pages/about_page.dart';

class ProfileSettingsExpansionTile extends StatefulWidget {
  const ProfileSettingsExpansionTile({super.key});

  @override
  State<ProfileSettingsExpansionTile> createState() =>
      _ProfileSettingsExpansionTileState();
}

class _ProfileSettingsExpansionTileState
    extends State<ProfileSettingsExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _buildAbout(),
      _buildDeleteAccount(),
    ]);
  }

  Widget _buildAbout() {
    return ListTile(
      title: Text('About', style: TextUtility.body2Text()),
      trailing: const Icon(
        Icons.arrow_right_outlined,
        color: ColorUtility.grey,
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AboutPage()));
      },
    );
  }

  Widget _buildDeleteAccount() {
    return Padding(
      padding: EdgeInsets.only(left: 3.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyTextButton(
              text: 'Delete Account',
              textStyle: TextUtility.hintText(),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return MyDialog(
                        title: 'Are you sure you want to delete your account?',
                        child: Column(
                          children: [
                            Text(
                              'Deleting your account will permanently remove all your data, including your progress, courses, and personal information. This action cannot be undone.',
                              style: TextUtility.hintText(),
                            ),
                            SizedBox(height: 15.h),
                            Divider(
                              color: ColorUtility.softGrey,
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              "If you're sure, please confirm below",
                              style: TextUtility.body2Text(
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        onConfirm: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                          await context.read<UserCubit>().deleteUser(context);
                        },
                      );
                    });
              }),
        ],
      ),
    );
  }
}
