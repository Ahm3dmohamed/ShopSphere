import 'package:e_comerce_app/core/config/size_config.dart';
import 'package:e_comerce_app/core/config/value_config.dart';
import 'package:e_comerce_app/widgets/assets_manager.dart';
import 'package:flutter/material.dart';

class OnBoardOne extends StatelessWidget {
  const OnBoardOne({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            AssetsImages.onBoardThree,
            width: double.infinity,
            height: SizeConfig.screenHeight * .68,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Center(
                    child: Text(
                  "Easy Transaction \n    And Payment",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )),
                SizedBox(
                  height: AppSize.s12(context),
                ),
                const Center(
                    child: Text(
                  "Your package will come right to \n     \t\t\t\t\t your door ASAP",
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
        ],
      ),
    );
  }
}
