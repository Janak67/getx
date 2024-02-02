import 'package:flutter/material.dart';
import 'package:getx/screen/cart/view/cart_screen.dart';
import 'package:getx/screen/detail/view/detail_screen.dart';
import 'package:getx/screen/home/view/home_screen.dart';

Map<String, WidgetBuilder> screenRoutes = {
  '/': (context) => const HomeScreen(),
  'detail': (context) => const DetailScreen(),
  'cart': (context) => const CartScreen(),
};
