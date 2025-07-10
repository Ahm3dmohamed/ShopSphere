import 'package:e_comerce_app/core/utils/features/auth/presentation/cubit/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:e_comerce_app/core/utils/features/auth/presentation/cubit/login_cubit.dart';
import 'package:e_comerce_app/core/utils/features/auth/presentation/cubit/login_state.dart';
import 'package:e_comerce_app/core/utils/features/tabs/home/presentation/main_layout_page.dart';
import 'package:e_comerce_app/core/config/size_config.dart';
import 'package:e_comerce_app/core/config/value_config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Artboard? _riveArtboard;
  late FocusNode _passwordFocusNode;
  late LoginController _loginController;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    rootBundle.load('assets/icon/animated_login_screen.riv').then((data) async {
      await RiveFile.initialize();
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      setState(() {
        _riveArtboard = artboard;
        _loginController = LoginController(
          context: context,
          riveArtboard: _riveArtboard,
          passwordFocusNode: _passwordFocusNode,
        );
        _riveArtboard?.addController(_loginController.controllerIdle);
      });
    });
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          } else if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MainLayoutPage()),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(title: const Text('Login')),
            body: Padding(
              padding: EdgeInsets.all(AppSize.s16(context)),
              child: Form(
                key: _loginController.loginFormKey,
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.3,
                        child: _riveArtboard == null
                            ? const SizedBox.shrink()
                            : Rive(artboard: _riveArtboard!),
                      ),
                      const SizedBox(height: 24.0),
                      TextFormField(
                        controller: _loginController.usernameController,
                        onChanged: (value) {
                          if (value.length < 10) {
                            _loginController.addLookDownLeftController();
                          } else {
                            _loginController.addLookDownRightController();
                          }
                        },
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please enter your username'
                            : null,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Username',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _loginController.passwordController,
                        focusNode: _passwordFocusNode,
                        obscureText: !_loginController.isPasswordVisible,
                        validator: (value) => value == null || value.isEmpty
                            ? 'Please enter your password'
                            : null,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_loginController.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _loginController.isPasswordVisible =
                                    !_loginController.isPasswordVisible;
                              });
                            },
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                      ),
                      SizedBox(height: AppSize.s16(context)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forget Password",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: _loginController.validateAndLogin,
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            backgroundColor: Colors.blue.shade600,
                            padding: EdgeInsets.symmetric(
                              vertical: AppSize.s12(context),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 21),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
