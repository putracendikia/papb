import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controler extends GetxController {
  var books = 0.obs;

  increment() {
    books.value++;
  }

  decrement() {
    if (books.value <= 0) {
      return;
    } else {
      books.value--;
    }
  }
}
