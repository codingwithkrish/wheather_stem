import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnakBar(String text) {
  final snackBar = SnackBar(
    duration: Duration(seconds: 2),
    content: Text(text),
  );

  ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
}
