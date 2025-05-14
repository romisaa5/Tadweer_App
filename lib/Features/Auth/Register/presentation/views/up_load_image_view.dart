import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toda_app/core/helper/profile_image_picker.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'dart:io';

import 'package:toda_app/core/utils/app_router.dart';
import 'package:toda_app/generated/l10n.dart';

class UploadImageView extends StatefulWidget {
  const UploadImageView({super.key});
  @override
  UploadImageViewState createState() => UploadImageViewState();
}

class UploadImageViewState extends State<UploadImageView> {
  File? _selectedImage;

  void _goToNextPage() {
    GoRouter.of(context).push(AppRouter.homeview);
  }

  void _skipUpload() {
    GoRouter.of(context).push(AppRouter.homeview);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Text(
                S.of(context).UploadProfilePicture,
                style: Styles.textStyle24,
              ),
              SizedBox(
                height: 120.h,
              ),
              _selectedImage != null
                  ? CircleAvatar(
                      radius: 60,
                      backgroundImage: FileImage(_selectedImage!),
                    )
                  : CircleAvatar(
                      backgroundColor: ColorsManger.kPrimaryColor,
                      radius: 60,
                      child: Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () async {
                  await pickAndSaveImage(
                    onImagePicked: (File image) {
                      setState(() {
                        _selectedImage = image;
                      });
                    },
                    context: context,
                  );
                },
                icon: Icon(Icons.photo),
                label: Text(S.of(context).PickfromGallery),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 110.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorsManger.kPrimaryColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextButton(
                      onPressed: _skipUpload,
                      child: Text(S.of(context).skip),
                    ),
                  ),
                  Container(
                    width: 110.w,
                    decoration: BoxDecoration(
                      color: ColorsManger.kPrimaryColor,
                      border: Border.all(color: ColorsManger.kPrimaryColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextButton(
                      onPressed: _selectedImage != null ? _goToNextPage : null,
                      child: Text(
                        S.of(context).next,
                        style: TextStyle(color: ColorsManger.bgcolorLight),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
