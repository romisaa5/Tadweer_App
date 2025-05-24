import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toda_app/Features/home/logic/provider/task_provider.dart';
import 'package:toda_app/Features/home/presentation/widgets/profile_list_tile.dart';
import 'package:toda_app/core/helper/profile_image_picker.dart';
import 'package:toda_app/generated/l10n.dart';

class ChangeAcountImage extends StatefulWidget {
  const ChangeAcountImage({super.key});

  @override
  State<ChangeAcountImage> createState() => _ChangeAcountImageState();
}

class _ChangeAcountImageState extends State<ChangeAcountImage> {
  File? imageFile;

  @override
  void initState() {
    super.initState();
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    taskProvider.getAllTasks();
    taskProvider.loadAccountImage();
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return ProfileListTile(
      title: S.of(context).ChangeaccountImage,
      onPressed: () async {
        await pickAndSaveImage(
          context: context,
          onImagePicked: (image) {
            taskProvider.setAccountImagePath(image.path);
          },
        );
      },
      icon: Icons.camera_alt_outlined,
    );
  }
}
