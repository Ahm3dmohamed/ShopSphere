import 'package:dio/dio.dart';
import 'package:e_comerce_app/core/config/size_config.dart';
import 'package:e_comerce_app/core/utils/features/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:e_comerce_app/core/utils/features/auth/presentation/login_page.dart';
import 'package:e_comerce_app/core/utils/features/auth/presentation/sign_up_page.dart';
import 'package:e_comerce_app/core/utils/features/on_board/widgets/on_board_one.dart';
import 'package:e_comerce_app/core/utils/features/on_board/widgets/on_board_three.dart';
import 'package:e_comerce_app/core/utils/features/on_board/widgets/on_board_two.dart';
import 'package:e_comerce_app/core/utils/features/tabs/home/presentation/main_layout_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoard extends StatefulWidget {
  OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final PageController _controller = PageController();
  List<Widget> onBoardWidgets = [
    const OnBoardOne(),
    const OnBoardTwo(),
    const OnBoardThree(),
  ];
  bool _onLastPage = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
              onPageChanged: (index) {
                setState(() {
                  _onLastPage = (index == 2);
                });
              },
              controller: _controller,
              children: onBoardWidgets),
          Positioned(
            bottom: 75.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                // Dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),
                //Next or Done
                _onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (outerContext) {
                                return BlocProvider(
                                  create: (_) => SignupCubit(dio: Dio()),
                                  child: const SignupPage(),
                                );
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Done",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
