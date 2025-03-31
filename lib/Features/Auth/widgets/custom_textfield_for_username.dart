import 'package:flutter/material.dart';

class CustomTextfieldForEmail extends StatefulWidget {
  final TextEditingController emailController;
  final FocusNode ?passwordFocusNode;
 const CustomTextfieldForEmail({super.key, required this.emailController, this.passwordFocusNode});
  @override
  State<CustomTextfieldForEmail> createState() =>
      _CustomTextfieldForEmailState();
}

class _CustomTextfieldForEmailState extends State<CustomTextfieldForEmail> {
    final FocusNode _emailFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The field is required';
        }
        if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(value)) {
          return 'Enter a valid email';
        }
        return null;
      },
      onEditingComplete: () {
        
        FocusScope.of(context).requestFocus(widget.passwordFocusNode);
      },
      textInputAction: TextInputAction.next,
      focusNode: _emailFocusNode,
      controller: widget.emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        prefixIcon: const Icon(
          Icons.email,
          color: Color(0xff8875FF),
        ),
      ),
    );
  }
}
