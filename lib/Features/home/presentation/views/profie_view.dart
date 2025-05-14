import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toda_app/Features/home/presentation/widgets/number_of_task_done_or_left.dart';
import 'package:toda_app/Features/home/presentation/widgets/profile_list_tile.dart';
import 'package:toda_app/core/helper/profile_image_picker.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/generated/l10n.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String accountName = 'Romisaa Fadel';
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _loadImagePath();
  }

  Future<void> _loadImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('profile_image_path');
    if (path != null && File(path).existsSync()) {
      setState(() {
        _imageFile = File(path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.0.w, right: 16.w, top: 16.h),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Text(
                S.of(context).Profile,
                style:
                    Styles.textStyle24.copyWith(color: colorScheme.secondary),
              ),
              CircleAvatar(
                radius: 45.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(42.r),
                  child: _imageFile != null
                      ? Image.file(_imageFile!,
                          fit: BoxFit.fill, width: 90.w, height: 90.h)
                      : Image.asset('assets/images/profile.jpg',
                          fit: BoxFit.fill, width: 90.w, height: 90.h),
                ),
              ),
              Text(
                accountName,
                style: Styles.textStyle16.copyWith(
                  color: colorScheme.secondary,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberOfTaskDoneOrLeft(text: '10 ${S.of(context).TasksLeft}'),
                  NumberOfTaskDoneOrLeft(text: '15 ${S.of(context).TasksDone}')
                ],
              ),
              Divider(
                  color: Colors.grey,
                  thickness: .5,
                  endIndent: 15.h,
                  indent: 15.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).Settings,
                    style: Styles.textStyle16.copyWith(
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ProfileListTile(
                      title: S.of(context).AppSettings,
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.appSetting);
                      },
                      icon: Icons.settings),
                  Divider(
                      color: Colors.grey,
                      thickness: .5,
                      endIndent: 15.h,
                      indent: 15.h),
                  Text(
                    S.of(context).Account,
                    style: Styles.textStyle16.copyWith(
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ProfileListTile(
                    title: S.of(context).Changeaccountname,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(S.of(context).Changeaccountname,
                              style: Styles.textStyle16.copyWith(
                                color: colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              )),
                          content: TextField(
                            onChanged: (value) {
                              setState(() {
                                accountName = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: S.of(context).NewName,
                              hintStyle: Styles.textStyle14.copyWith(
                                color: colorScheme.secondary,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(
                                  color: colorScheme.primary,
                                  width: 1.5,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(
                                  color: colorScheme.secondary
                                      .withValues(alpha: .7),
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(S.of(context).Save),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(S.of(context).Cancel),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Icons.person_outlined,
                  ),
                  ProfileListTile(
                      title: S.of(context).Changeaccountpassword,
                      onPressed: () {},
                      icon: Icons.lock_outline),
                  ProfileListTile(
                    title: S.of(context).ChangeaccountImage,
                    onPressed: () async {
                      await pickAndSaveImage(
                        context: context,
                        onImagePicked: (image) {
                          setState(() {
                            _imageFile = image;
                          });
                        },
                      );
                    },
                    icon: Icons.camera_alt_outlined,
                  ),
                  Divider(
                      color: Colors.grey,
                      thickness: .5,
                      endIndent: 15.h,
                      indent: 15.h),
                  ProfileListTile(
                    title: S.of(context).LogOut,
                    onPressed: () async {
                      final shouldLogout = await showDialog<bool>(
                        barrierColor: colorScheme.background,
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            S.of(context).LogOut,
                            style: Styles.textStyle16.copyWith(
                              color: ColorsManger.redColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text(
                            S.of(context).Areyousureyouwanttologout,
                            style: Styles.textStyle14
                                .copyWith(color: colorScheme.secondary),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text(S.of(context).Cancel),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: Text(S.of(context).LogOut),
                            ),
                          ],
                        ),
                      );

                      if (shouldLogout == true) {
                        try {
                          final user = FirebaseAuth.instance.currentUser;
                          final providerId =
                              user?.providerData.first.providerId;

                          await FirebaseAuth.instance.signOut();

                          if (providerId == 'google.com') {
                            GoogleSignIn googleSignIn = GoogleSignIn();
                            await googleSignIn.signOut();
                          }

                          if (providerId == 'facebook.com') {
                            FacebookAuth facebookAuth = FacebookAuth.instance;
                            await facebookAuth.logOut();
                          }

                          GoRouter.of(context)
                              .pushReplacement(AppRouter.loginView);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'You have been logged out successfully.'),
                            ),
                          );
                        } catch (e) {
                          print('Logout error: $e');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Error during logout, please try again later.')),
                          );
                        }
                      }
                    },
                    icon: Icons.logout,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
