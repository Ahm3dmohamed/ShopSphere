import 'package:e_comerce_app/core/config/size_config.dart';
import 'package:e_comerce_app/core/utils/features/auth/presentation/cubit/login_cubit.dart';
import 'package:e_comerce_app/core/utils/features/auth/presentation/cubit/sign_up_controller.dart';
import 'package:e_comerce_app/core/utils/features/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:e_comerce_app/core/utils/features/auth/presentation/cubit/sign_up_state.dart';
import 'package:e_comerce_app/core/utils/features/auth/presentation/login_page.dart';
import 'package:e_comerce_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SignupController? _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= SignupController(context: context);
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      // Wait one frame until context is fully built
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (_) => LoginCubit(),
                child: const LoginPage(),
              ),
            ),
          );
        } else if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Sign up")),
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _controller!.signupFormKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.3,
                      child: const RiveAnimation.asset(
                        "assets/icon/animated_login_screen.riv",
                        fit: BoxFit.cover,
                        animations: ['idle'],
                      ),
                    ),
                    CustomTextFormField(
                      controller: _controller!.usernameController,
                      labelText: 'Username',
                      prefixIcon: Icons.person,
                      validator: (val) =>
                          val == null || val.isEmpty ? 'Enter username' : null,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: _controller!.emailController,
                      labelText: 'Email',
                      prefixIcon: Icons.email,
                      validator: (val) => val == null || !val.contains('@')
                          ? 'Enter valid email'
                          : null,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: _controller!.passwordController,
                      labelText: 'Password',
                      prefixIcon: Icons.lock,
                      obscureText: !_controller!.isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      suffixIcon: _controller!.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onSuffixTap: () {
                        setState(() {
                          _controller!.isPasswordVisible =
                              !_controller!.isPasswordVisible;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: state is SignupLoading
                          ? null
                          : _controller!.validateAndSubmit,
                      child: state is SignupLoading
                          ? const CircularProgressIndicator()
                          : const Text("Sign Up"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
