import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:springy_shopp/presentation/pages/cart_page.dart';
import '../pages/home_page.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        return CupertinoPageRoute(builder: (_) => const HomePage());
      case Routes.cart:
        return CupertinoPageRoute(builder: (_) => const CartPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Error')),
      );
    });
  }
}
