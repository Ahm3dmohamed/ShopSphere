import 'package:e_comerce_app/constant.dart';
import 'package:e_comerce_app/utils/features/home/presentation/widgets/custom_appbar.dart';
import 'package:e_comerce_app/utils/features/home/presentation/widgets/image_lader.dart';
import 'package:e_comerce_app/utils/features/home/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              CustomAppbar(),
              SizedBox(
                height: 12,
              ),
              MySearchBar(),
              SizedBox(
                height: 12,
              ),
              ImageLeader()
            ],
          ),
        ),
      ),
    );
  }
}
