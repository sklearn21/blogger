import 'package:blogger/core/theme/app_pallete.dart';
import 'package:blogger/features/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: AppPallete.whiteColor,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                AuthField(
                  hintText: 'Name',
                ),
                SizedBox(
                  height: 15,
                ),
                AuthField(
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 15,
                ),
                AuthField(
                  hintText: 'Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
