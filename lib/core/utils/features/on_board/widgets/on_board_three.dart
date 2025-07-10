import 'package:e_comerce_app/core/config/size_config.dart';
import 'package:e_comerce_app/core/config/value_config.dart';
import 'package:e_comerce_app/widgets/assets_manager.dart';
import 'package:flutter/material.dart';

class OnBoardThree extends StatelessWidget {
  const OnBoardThree({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // ✅ Add this line first

    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            AssetsImages.onBoardOne,
            width: double.infinity,
            height: SizeConfig.screenHeight * .68,
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            // appBar: AppBar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Center(
                    child: Text(
                  "Free-Shipping \n     vouchers",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )),
                SizedBox(
                  height: AppSize.s16(context),
                ),
                const Center(
                    child: Text(
                  "We care about your package as \n              \t\t\t\t\t you do",
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
