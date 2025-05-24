import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toda_app/Features/home/presentation/widgets/profile_list_tile.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/generated/l10n.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return ProfileListTile(
      title: S.of(context).LogOut,
      onPressed: () async {
        final shouldLogout = await showDialog<bool>(
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
              style: Styles.textStyle14.copyWith(color: colorScheme.secondary),
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
            final providerId = user?.providerData.first.providerId;

            await FirebaseAuth.instance.signOut();

            if (providerId == 'google.com') {
              GoogleSignIn googleSignIn = GoogleSignIn();
              await googleSignIn.signOut();
            }

            if (providerId == 'facebook.com') {
              FacebookAuth facebookAuth = FacebookAuth.instance;
              await facebookAuth.logOut();
            }

            GoRouter.of(context).pushReplacement(AppRouter.loginView);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('You have been logged out successfully.'),
              ),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                      Text('Error during logout, please try again later.')),
            );
          }
        }
      },
      icon: Icons.logout,
    );
  }
}
