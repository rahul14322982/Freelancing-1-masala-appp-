import 'package:get/get.dart';
import 'package:masala_showcase/screens/home_screen.dart';
import 'package:masala_showcase/screens/cart_screen.dart';
import 'package:masala_showcase/screens/product_detail_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String cart = '/cart';
  static const String productDetail = '/product-detail';

  static final routes = [
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: cart,
      page: () => CartScreen(),
    ),
    GetPage(
      name: productDetail,
      page: () => ProductDetailScreen(),
    ),
  ];
}