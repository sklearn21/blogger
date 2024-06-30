import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObsecure;

  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintText is missing';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText: isObsecure,
    );
  }
}
