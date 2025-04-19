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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon,
          color: colorScheme.secondary.withValues(alpha: 0.8),
          size: 24,
        ),
      title: Text(
        title,
        style: Styles.textStyle14.copyWith(
          color: colorScheme.secondary.withValues(alpha: 0.8),
        ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_forward_ios_outlined,
            color: colorScheme.secondary,
      ),
    ));
  }
}
