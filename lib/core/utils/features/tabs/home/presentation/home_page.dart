import 'package:dio/dio.dart';
import 'package:e_comerce_app/core/config/size_config.dart';
import 'package:e_comerce_app/core/config/value_config.dart';
import 'package:e_comerce_app/core/utils/features/tabs/home/data/models/products.dart';
import 'package:e_comerce_app/core/utils/features/tabs/home/presentation/cubit/product_cubit.dart';
import 'package:e_comerce_app/widgets/constant.dart';
import 'package:e_comerce_app/widgets/assets_manager.dart';
import 'package:e_comerce_app/core/utils/features/tabs/home/data/entity/product_element.dart';
import 'package:e_comerce_app/core/utils/features/tabs/home/presentation/widgets/custom_appbar.dart';
import 'package:e_comerce_app/core/utils/features/tabs/home/presentation/widgets/image_lader.dart';
import 'package:e_comerce_app/core/utils/features/tabs/home/presentation/widgets/product_card.dart';
import 'package:e_comerce_app/core/utils/features/tabs/home/presentation/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<ProductElement> products = [
    ProductElement(
        title: "GoodJacket",
        description: "Allthing is very Well",
        price: "${12}",
        img: AssetsImages.jacketOne),
    ProductElement(
        title: "JacketGry",
        description: "Jacket Two Well",
        price: "${39}",
        img: AssetsImages.jacketTwo),
    ProductElement(
        title: "Gool",
        description: "Jewllery   has very heigh price",
        price: "${430}",
        img: AssetsImages.jewelry),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(dio: Dio()),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                height: SizeConfig.screenHeight * 0.9,
                child: Column(
                  children: [
                    SizedBox(
                      height: AppSize.s10(context),
                    ),
                    const CustomAppbar(),
                    SizedBox(
                      height: AppSize.s16(context),
                    ),
                    const MySearchBar(),
                    SizedBox(
                      height: AppSize.s12(context),
                    ),
                    const ImageLeader(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return ProductCard(product: products[index]);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
