import 'package:e_comerce_app/core/config/value_config.dart';
import 'package:e_comerce_app/core/utils/features/tabs/home/data/entity/product_element.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  ProductElement product;
  ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: AppMargin.m8(context)),
      child: ListTile(
        onTap: () {},
        leading: Image.asset(
          product.img,
          fit: BoxFit.cover,
        ),
        title: Text(product.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.price),
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(product.description,
                  style: const TextStyle(color: Colors.red, fontSize: 11)),
            ),
          ],
        ),
      ),
    );
  }
}
