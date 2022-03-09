import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project01/pages/detail.dart';
import 'package:project01/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/detail', page: () => DetailPage()),
      ],
    );
  }
}
