import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import '../cubit/login_cubit.dart';
import '../enimation_enum.dart';

class LoginController {
  final BuildContext context;
  final Artboard? riveArtboard;
  final FocusNode passwordFocusNode;

  bool isLookingLeft = false;
  bool isLookingRight = false;
  bool isPasswordVisible = false;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerSuccess;
  late RiveAnimationController controllerFail;
  late RiveAnimationController controllerLookDownRight;
  late RiveAnimationController controllerLookDownLeft;
  late RiveAnimationController controllerHandsUp;
  late RiveAnimationController controllerHandsDown;

  LoginController({
    required this.context,
    required this.riveArtboard,
    required this.passwordFocusNode,
  }) {
    _initControllers();
    _listenToFocus();
  }

  void _initControllers() {
    controllerIdle = SimpleAnimation(AnimationEnum.look_idle.name);
    controllerSuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerFail = SimpleAnimation(AnimationEnum.fail.name);
    controllerLookDownRight =
        SimpleAnimation(AnimationEnum.Look_down_right.name);
    controllerLookDownLeft = SimpleAnimation(AnimationEnum.Look_down_left.name);
    controllerHandsUp = SimpleAnimation(AnimationEnum.Hands_up.name);
    controllerHandsDown = SimpleAnimation(AnimationEnum.hands_down.name);
  }

  void _listenToFocus() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        addHandsUpController();
      } else {
        addHandsDownController();
      }
    });
  }

  void removeAllController() {
    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.removeController(controllerFail);
    riveArtboard?.artboard.removeController(controllerSuccess);
    riveArtboard?.artboard.removeController(controllerHandsDown);
    riveArtboard?.artboard.removeController(controllerHandsUp);
    riveArtboard?.artboard.removeController(controllerLookDownLeft);
    riveArtboard?.artboard.removeController(controllerLookDownRight);
    isLookingLeft = false;
    isLookingRight = false;
  }

  void addIdleController() {
    removeAllController();
    riveArtboard?.artboard.addController(controllerIdle);
  }

  void addLookDownLeftController() {
    if (!isLookingLeft) {
      removeAllController();
      isLookingLeft = true;
      riveArtboard?.artboard.addController(controllerLookDownLeft);
    }
  }

  void addLookDownRightController() {
    if (!isLookingRight) {
      removeAllController();
      isLookingRight = true;
      riveArtboard?.artboard.addController(controllerLookDownRight);
    }
  }

  void addFailController() {
    removeAllController();
    riveArtboard?.artboard.addController(controllerFail);
  }

  void addSuccessController() {
    removeAllController();
    riveArtboard?.artboard.addController(controllerSuccess);
  }

  void addHandsDownController() {
    removeAllController();
    riveArtboard?.artboard.addController(controllerHandsDown);
  }

  void addHandsUpController() {
    removeAllController();
    riveArtboard?.artboard.addController(controllerHandsUp);
  }

  void validateAndLogin() {
    passwordFocusNode.unfocus();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (loginFormKey.currentState!.validate()) {
        addSuccessController();
        context.read<LoginCubit>().login(
              usernameController.text.trim(),
              passwordController.text.trim(),
            );
      } else {
        addFailController();
      }
    });
  }
}
