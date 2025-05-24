import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toda_app/Features/home/presentation/widgets/profile_list_tile.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/generated/l10n.dart' show S;

class ChangeAcountPassword extends StatefulWidget {
  const ChangeAcountPassword({super.key});

  @override
  State<ChangeAcountPassword> createState() => _ChangeAcountPasswordState();
}

class _ChangeAcountPasswordState extends State<ChangeAcountPassword> {
  @override
  Widget build(BuildContext context) {
    return ProfileListTile(
        title: S.of(context).Changeaccountpassword,
        onPressed: showChangePasswordDialog,
        icon: Icons.lock_outline);
  }

  void showChangePasswordDialog() {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Change Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: oldPasswordController,
              decoration: InputDecoration(
                  labelText: 'Current Password',
                  labelStyle: Styles.textStyle12.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  )),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: newPasswordController,
              decoration: InputDecoration(
                  labelText: 'New Password',
                  labelStyle: Styles.textStyle12.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  )),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(S.of(context).Cancel)),
          TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              final email = user?.email;
              final oldPassword = oldPasswordController.text.trim();
              final newPassword = newPasswordController.text.trim();

              if (email != null &&
                  oldPassword.isNotEmpty &&
                  newPassword.length >= 8) {
                try {
                  final cred = EmailAuthProvider.credential(
                    email: email,
                    password: oldPassword,
                  );

                  await user!.reauthenticateWithCredential(cred);

                  await user.updatePassword(newPassword);

                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Password changed successfully')),
                  );
                } on FirebaseAuthException catch (e) {
                  String message = 'Failed to change password';
                  if (e.code == 'wrong-password') {
                    message = 'Current password is incorrect';
                  }
                  else if (e.code == 'weak-password') {
                    message = 'New password is too weak';
                  }
                  else if (e.code == 'requires-recent-login') {
                    message = 'Please log in again to change your password';
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Unexpected error occurred')),
                  );
                }
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
