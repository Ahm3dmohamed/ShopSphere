import 'package:e_comerce_app/config/size_config.dart';
import 'package:e_comerce_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class OnBoardThree extends StatelessWidget {
  const OnBoardThree({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            AssetsImages.onBoardOne,
            width: double.infinity,
            height: SizeConfig.screenHeight * .75,
            fit: BoxFit.fitWidth,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            // appBar: AppBar(),
            body: Container(
              //I used this to make space bettween my img and the text i want to write
              padding: const EdgeInsets.only(top: 500),
              child: const Column(
                children: [
                  Center(
                      child: Text(
                    "Free-Shipping \n     vouchers",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                      child: Text(
                    "We care about your package as \n              \t\t\t\t\t you do",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
