import 'package:flutter/material.dart';

class CustomTextfieldforPassword extends StatefulWidget {
  CustomTextfieldforPassword({super.key});

  @override
  State<CustomTextfieldforPassword> createState() =>
      _CustomTextfieldforPasswordState();
}

class _CustomTextfieldforPasswordState
    extends State<CustomTextfieldforPassword> {
  final TextEditingController passwordController = TextEditingController();
  bool isshown = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'the field is required';
        }
        return null;
      },
      controller: passwordController,
      obscureText: isshown,
      decoration: InputDecoration(
        suffixIcon: isshown
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isshown = !isshown;
                  });
                },
                icon: Icon(Icons.visibility))
            : IconButton(
                onPressed: () {
                  setState(() {
                    isshown = !isshown;
                  });
                },
                icon: Icon(Icons.visibility_off)),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        prefixIcon: const Icon(
          Icons.lock,
          color: Color(0xff8875FF),
        ),
      ),
    );
  }
}
