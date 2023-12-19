import 'package:flutter/material.dart';
import 'package:mind_sculptor/view/screens/authentication/functions/authentication_functions.dart';
import 'package:mind_sculptor/view/widgets/textfields.dart';

class TextFormFieldOfSignUpScreen extends StatelessWidget {
  const TextFormFieldOfSignUpScreen(
      {super.key,
      required this.usernameController,
      required this.emailController,
      required this.passwordController,
      required this.conformPasswordController});

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController conformPasswordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textInputFormField(
            fieldIcon: Icons.person,
            hintText: 'Username',
            obscure: false,
            txtcontroller: usernameController,
            validatorFunction: validateUsername),
        const SizedBox(
          height: 10,
        ),
        textInputFormField(
            fieldIcon: Icons.email,
            hintText: 'Email',
            obscure: false,
            txtcontroller: emailController,
            validatorFunction: validateEmail),
        const SizedBox(
          height: 10,
        ),
        textInputFormField(
            fieldIcon: Icons.lock,
            hintText: 'Password',
            obscure: true,
            txtcontroller: passwordController,
            validatorFunction: validatePassword),
        const SizedBox(
          height: 10,
        ),
        textInputFormField(
            fieldIcon: Icons.lock_person_sharp,
            hintText: 'Confirm Password',
            obscure: true,
            txtcontroller: conformPasswordController,
            validatorFunction: (String? value) {
              if (value != passwordController.text) {
                return 'Password does not match';
              } else if (value!.isEmpty) {
                return 'Re-enter your Password';
              } else if (value.length < 5) {
                return 'Password must be at least 5 character';
              } else {
                return null;
              }
            }),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
