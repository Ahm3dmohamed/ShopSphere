import 'package:e_comerce_app/core/utils/features/on_board/on_board.dart';
import 'package:e_comerce_app/core/utils/features/tabs/home/presentation/main_layout_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoard(),
    );
  }
}
