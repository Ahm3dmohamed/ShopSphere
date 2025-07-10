import 'package:e_comerce_app/core/utils/features/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupController {
  final BuildContext context;
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isPasswordVisible = false;

  SignupController({required this.context});

  void validateAndSubmit() {
    if (signupFormKey.currentState!.validate()) {
      context.read<SignupCubit>().signup(
            username: usernameController.text.trim(),
            password: passwordController.text.trim(),
            email: emailController.text.trim(),
          );
    }
  }
}
