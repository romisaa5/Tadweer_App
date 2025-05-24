import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toda_app/core/themes/text_styles.dart';
import 'package:toda_app/generated/l10n.dart';

Future<File> _getDefaultImage() async {
  final byteData = await rootBundle.load('assets/images/profile.jpg');
  final tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/profile.jpg');
  await file.writeAsBytes(byteData.buffer.asUint8List());
  return file;
}

Future<void> pickAndSaveImage({
  required Function(File) onImagePicked,
  required BuildContext context,
}) async {
  showModalBottomSheet(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withValues(alpha: 0.8),
              ),
              title: Text(
                S.of(context).Takeaphoto,
                style: Styles.textStyle14.copyWith(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
              ),
              onTap: () async {
                Navigator.of(context).pop();
                final status = await Permission.camera.request();
                if (status.isGranted) {
                  final pickedFile =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  if (pickedFile != null && pickedFile.path.isNotEmpty) {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString(
                        'profile_image_path', pickedFile.path);
                    onImagePicked(File(pickedFile.path));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(S.of(context).Noimageselected)),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(S.of(context).Camerapermissiondenied)),
                  );
                }
              },
            ),
            ListTile(
              leading: Icon(
                Icons.photo_library,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
              ),
              title: Text(
                S.of(context).ChoosefromGallery,
                style: Styles.textStyle14.copyWith(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
              ),
              onTap: () async {
                Navigator.of(context).pop();

                PermissionStatus status;

                if (Platform.isAndroid) {
                  if (await Permission.photos.isGranted ||
                      await Permission.storage.isGranted) {
                    status = PermissionStatus.granted;
                  } else {
                    status = await Permission.storage.request();
                  }
                } else {
                  status = await Permission.photos.request();
                }

                if (status.isGranted) {
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedFile != null && pickedFile.path.isNotEmpty) {
                    final file = File(pickedFile.path);
                    if (await file.exists()) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString(
                          'profile_image_path', pickedFile.path);
                      onImagePicked(file);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(S.of(context).Imagenotfound)),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(S.of(context).Noimageselected)),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(S.of(context).Gallerypermissiondenied)),
                  );
                }
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
              ),
              title: Text(
                S.of(context).RemoveProfilePicture,
                style: Styles.textStyle14.copyWith(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
              ),
              onTap: () async {
                Navigator.of(context).pop();
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('profile_image_path');
                final defaultImageFile = await _getDefaultImage();
                onImagePicked(defaultImageFile);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile picture removed')),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
