import 'package:flutter/material.dart';
// import 'package:papb/home/main_page.dart';
import 'package:papb/produk/coffeearticle.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ngopeee',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 250, 235)),
      home: const CoffeeArticle(),
    );
  }
}
