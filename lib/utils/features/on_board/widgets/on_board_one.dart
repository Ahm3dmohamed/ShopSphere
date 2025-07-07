import 'package:e_comerce_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class OnBoardOne extends StatelessWidget {
  const OnBoardOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            AssetsImages.onBoardThree,
            width: double.infinity,
            height: 480,
            fit: BoxFit.fitHeight,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              //I used this to make space bettween my img and the text i want to write
              padding: const EdgeInsets.only(top: 500),
              child: const Column(
                children: [
                  Center(
                      child: Text(
                    "Easy Transaction \n    And Payment",
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
                    "Your package will come right to \n     \t\t\t\t\t your door ASAP",
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
