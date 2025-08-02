import 'package:get/get.dart';
import 'package:masala_showcase/models/cart_item.dart';
import 'package:masala_showcase/models/product.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var isOrderPlaced = false.obs;

  double get totalAmount {
    return cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  int get totalItems {
    return cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  void addToCart(Product product) {
    final existingIndex = cartItems.indexWhere((item) => item.product.id == product.id);
    
    if (existingIndex >= 0) {
      cartItems[existingIndex].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(CartItem(product: product));
    }
    
    Get.snackbar(
      'Added to Cart',
      '${product.name} has been added to your cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      backgroundColor: Get.theme.primaryColor,
      colorText: Colors.white,
    );
  }

  void removeFromCart(String productId) {
    cartItems.removeWhere((item) => item.product.id == productId);
  }

  void updateQuantity(String productId, int quantity) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (quantity <= 0) {
        cartItems.removeAt(index);
      } else {
        cartItems[index].quantity = quantity;
        cartItems.refresh();
      }
    }
  }

  void clearCart() {
    cartItems.clear();
  }

  void placeOrder() {
    if (cartItems.isEmpty) {
      Get.snackbar(
        'Empty Cart',
        'Please add items to your cart before placing an order',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Show order confirmation dialog
    Get.dialog(
      AlertDialog(
        title: Text('Order Confirmation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your order has been placed successfully!'),
            SizedBox(height: 16),
            Text('Total Amount: ₹${totalAmount.toStringAsFixed(2)}'),
            SizedBox(height: 16),
            Text('Contact Owner: +91 98765 43210'),
            SizedBox(height: 8),
            Text('Email: owner@masalahome.com'),
            SizedBox(height: 16),
            Text(
              'We will contact you soon to confirm your order and arrange delivery.',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              clearCart();
              isOrderPlaced.value = true;
              Get.snackbar(
                'Order Placed!',
                'Thank you for your order. We will contact you soon.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
                duration: Duration(seconds: 3),
              );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}