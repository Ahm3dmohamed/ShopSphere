import 'package:e_comerce_app/utils/assets_manager.dart';
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
            height: 480,
            fit: BoxFit.fitHeight,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              //I used this to make space bettween my img and the text i want to write
              padding: const EdgeInsets.only(top: 500),
              child: const Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                      child: Text(
                    "Updated Products \n         Everyday",
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
                    "Don't worry, you won't be \n     \t\t\t\t\t outdated",
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
