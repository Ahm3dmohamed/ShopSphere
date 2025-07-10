import 'package:e_comerce_app/core/config/size_config.dart';
import 'package:e_comerce_app/widgets/assets_manager.dart';
import 'package:flutter/material.dart';

class ImageLeader extends StatelessWidget {
  const ImageLeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * .18,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: PageView(
          allowImplicitScrolling: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            Image.asset(
              AssetsImages.slider,
              fit: BoxFit.cover,
            ),
            Image.asset(
              AssetsImages.allItemBaner,
              fit: BoxFit.fill,
            ),
            Image.asset(
              AssetsImages.onBoardTwo,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
