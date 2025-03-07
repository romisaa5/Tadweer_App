import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIndecetor extends StatelessWidget {
  const CustomIndecetor({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isActive ? Colors.white : Colors.grey,
      ),
      width: isActive ? 30.w : 10.w,
      height: 7.w,
    );
  }
}
