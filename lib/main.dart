import 'package:crafty_bay/crafty_bay.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const CraftyBay());
}
