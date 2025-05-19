import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toda_app/Features/Auth/Register/models/user_model.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/generated/l10n.dart';

class IndexView extends StatefulWidget {
  const IndexView({super.key});

  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  File? _profileImage;
  UserModel? currentUser;
  @override
  void initState() {
    super.initState();

    _loadProfileImage();
    fetchCurrentUserData();
  }

  Future<void> fetchCurrentUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    final doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (doc.exists && mounted) {
      setState(() {
        currentUser = UserModel.fromJson(doc.data()!);
      });
    }
  }

  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image_path');
    if (imagePath != null && mounted) {
      setState(() {
        _profileImage = File(imagePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            '${S.of(context).Hi} ${currentUser?.firstName ?? ''}',
            style: Styles.textStyle18.copyWith(
              color: textTheme.bodyLarge!.color,
            ),
          ),
          actions: [
            CircleAvatar(
              radius: 24.r,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(21.r),
                child: _profileImage != null
                    ? Image.file(
                        _profileImage!,
                        fit: BoxFit.cover,
                        width: 48.w,
                        height: 48.h,
                      )
                    : Image.asset(
                        'assets/images/profile.jpg',
                        fit: BoxFit.cover,
                        width: 48.w,
                        height: 48.h,
                      ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/home_image.png'),
              SizedBox(height: 10.h),
              Text(
                S.of(context).Whatdoyouwanttodotoday,
                style: Styles.textStyle20.copyWith(
                  color: textTheme.bodyLarge!.color,
                ),
              ),
              Text(
                S.of(context).Taptoaddyourtasks,
                style: Styles.textStyle16.copyWith(
                  color: textTheme.bodyMedium?.color?.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
