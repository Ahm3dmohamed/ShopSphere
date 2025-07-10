import 'package:e_comerce_app/core/utils/features/auth/presentation/cubit/sign_up_controller.dart';
import 'package:e_comerce_app/core/utils/features/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:e_comerce_app/core/utils/features/auth/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late SignupController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SignupController(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(dio: Dio()),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Signup successful!")),
            );
            Navigator.pop(context);
          } else if (state is SignupFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("Signup")),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _controller.signupFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controller.usernameController,
                      validator: (val) =>
                          val == null || val.isEmpty ? 'Enter username' : null,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _controller.emailController,
                      validator: (val) => val == null || !val.contains('@')
                          ? 'Enter valid email'
                          : null,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _controller.passwordController,
                      obscureText: !_controller.isPasswordVisible,
                      validator: (val) => val == null || val.length < 6
                          ? 'Password too short'
                          : null,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_controller.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _controller.isPasswordVisible =
                                  !_controller.isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: state is SignupLoading
                          ? null
                          : _controller.validateAndSubmit,
                      child: state is SignupLoading
                          ? const CircularProgressIndicator()
                          : const Text("Sign Up"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
