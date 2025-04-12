import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toda_app/constans.dart';
import 'package:toda_app/core/widgets/custom_button.dart';

class AddTasksBottomSheet extends StatelessWidget {
  const AddTasksBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          spacing: 20.h,
          mainAxisSize: MainAxisSize.min, children: [
          Text(
            'Add New Task',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Task Title',
              border: OutlineInputBorder(),
            ),
          ),

          TextField(
            decoration: InputDecoration(
              labelText: 'Descreiption',
              border: OutlineInputBorder(),
              
            ),
          ),

          CustomButton(
            onTap: (){
              Navigator.pop(context);
            },
              text: 'Add Task',
              color: kPrimaryColor,
              width: MediaQuery.of(context).size.width)
        ]));
  }
}
