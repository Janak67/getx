import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/utils/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: screenRoutes,
    ),
  );
}
