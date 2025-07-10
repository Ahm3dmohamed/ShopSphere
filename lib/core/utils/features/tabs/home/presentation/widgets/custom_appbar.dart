import 'package:e_comerce_app/widgets/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../../../widgets/constant.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(18),
              backgroundColor: kPrimaryColor,
            ),
            icon: Image.asset(
              IconImage.iPhone,
              scale: 24,
            )),
        IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(12),
              backgroundColor: kPrimaryColor,
            ),
            icon: const Icon(
              Icons.notifications_outlined,
              size: 34,
            ))
      ],
    );
  }
}
