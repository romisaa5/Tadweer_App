import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toda_app/core/themes/colors.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'dart:io';

import 'package:toda_app/core/utils/app_router.dart';

class UploadImageView extends StatefulWidget {
  @override
  _UploadImageViewState createState() => _UploadImageViewState();
}

class _UploadImageViewState extends State<UploadImageView> {
  File? _selectedImage;

  
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });

      // Optional: show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile picture selected successfully")),
      );
    }
  }
 
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
              SizedBox(height: 30.h,),
              Text("Upload Profile Picture",style: Styles.textStyle24,),
              SizedBox(height: 120.h,),
              _selectedImage != null
                  ? CircleAvatar(
                      radius: 60,
                      backgroundImage: FileImage(_selectedImage!),
                    )
                  : CircleAvatar(
                      backgroundColor: ColorsManger.kPrimaryColor,
                      radius: 60,
                      child: Icon(Icons.person, size: 60,),
                    ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: _pickImage,
                icon: Icon(Icons.photo),
                label: Text("Pick from Gallery"),
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
                      child: Text("Skip"),
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
                      child: Text("Next",style: TextStyle(color: ColorsManger.bgcolorLight),),
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
