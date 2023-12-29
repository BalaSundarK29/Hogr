import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'page1_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Hogr-Bala',
      home: Page1Widget(),
    );
  }
}
