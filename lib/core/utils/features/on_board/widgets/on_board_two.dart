import 'package:e_comerce_app/core/config/size_config.dart';
import 'package:e_comerce_app/core/config/value_config.dart';
import 'package:e_comerce_app/widgets/assets_manager.dart';
import 'package:flutter/material.dart';

class OnBoardTwo extends StatelessWidget {
  const OnBoardTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            AssetsImages.onBoardTwo,
            width: double.infinity,
            height: SizeConfig.screenHeight * .68,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.only(top: AppSize.s65(context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Updated Products \n         Everyday",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s12(context),
                  ),
                  const Center(
                      child: Text(
                    "Don't worry, you won't be \n     \t\t\t\t\t outdated",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  )),
                  SizedBox(
                    height: AppSize.s100(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
