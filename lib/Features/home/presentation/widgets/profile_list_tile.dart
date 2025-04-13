import 'package:flutter/material.dart';
import 'package:toda_app/core/themes/text_styles.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile(
      {super.key, required this.title, required this.onPressed, required this.icon});
  final String title;
  final IconData icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(
        title,
        style: Styles.textStyle14,
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
