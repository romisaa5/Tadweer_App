import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toda_app/Features/home/logic/provider/task_provider.dart';
import 'package:toda_app/Features/home/presentation/widgets/profile_list_tile.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/generated/l10n.dart';

class ChangeAcountName extends StatefulWidget {
  const ChangeAcountName({super.key});

  @override
  State<ChangeAcountName> createState() => _ChangeAcountNameState();
}

class _ChangeAcountNameState extends State<ChangeAcountName> {
  String firstName = '';
  String lastName = '';

  @override
  void initState() {
    super.initState();
    Provider.of<TaskProvider>(context, listen: false).getAllTasks();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        setState(() {
          firstName = doc.data()?['firstName'] ?? '';
          lastName = doc.data()?['lastName'] ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProfileListTile(
      title: S.of(context).Changeaccountname,
      onPressed: showChangeNameDialog,
      icon: Icons.person_outlined,
    );
  }

  void showChangeNameDialog() {
    final firstNameController = TextEditingController(text: firstName);
    final lastNameController = TextEditingController(text: lastName);

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        title: Text(S.of(context).Changeaccountname,
            style: Styles.textStyle16.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            )),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: S.of(context).FirstName,
              ),
            ),
            SizedBox(height: 8.h),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: S.of(context).LastName,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: Text(S.of(context).Cancel),
          ),
          TextButton(
            onPressed: () async {
              final newFirstName = firstNameController.text.trim();
              final newLastName = lastNameController.text.trim();

              if (newFirstName.isNotEmpty && newLastName.isNotEmpty) {
                if (!mounted) return;
                setState(() {
                  firstName = newFirstName;
                  lastName = newLastName;
                });
                Provider.of<TaskProvider>(context, listen: false)
                    .setAccountName(newFirstName, newLastName);
                Navigator.of(dialogContext).pop();
                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(user.uid)
                      .update({
                    'firstName': newFirstName,
                    'lastName': newLastName,
                  });
                }
              }
            },
            child: Text(S.of(context).Save),
          ),
        ],
      ),
    );
  }
}
