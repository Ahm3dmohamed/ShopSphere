import 'package:e_comerce_app/constant.dart';
import 'package:flutter/material.dart';

//  fetch('https://dummyjson.com/products')

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey, size: 34),
            const SizedBox(width: 12),
            const Flexible(
              flex: 4,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search..",
                  hintStyle: TextStyle(fontWeight: FontWeight.w400),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              height: 24,
              width: 1.5,
              color: Colors.grey,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
          ],
        ),
      ),
    );
  }
}
