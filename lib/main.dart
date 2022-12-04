import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:papb/home/main_page.dart';
import 'package:papb/tab_decider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ngopeee',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 250, 235)),
      home: const TabDecider(),
    );
  }
}
