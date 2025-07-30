import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masala_showcase/routes/app_routes.dart';
import 'package:masala_showcase/controllers/cart_controller.dart';
import 'package:masala_showcase/controllers/product_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Masala Showcase',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Colors.orange[600],
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange[600],
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[600],
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => ProductController());
        Get.lazyPut(() => CartController());
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}