import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masala_showcase/controllers/cart_controller.dart';
import 'package:masala_showcase/models/cart_item.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final CartController cartController = Get.find();

  CartItemCard({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                cartItem.product.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.image_not_supported,
                      size: 32,
                      color: Colors.grey[600],
                    ),
                  );
                },
              ),
            ),
          ),
          
          SizedBox(width: 12),
          
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                SizedBox(height: 4),
                
                Text(
                  '₹${cartItem.product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.orange[600],
                  ),
                ),
                
                SizedBox(height: 8),
                
                // Quantity Controls
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (cartItem.quantity > 1) {
                          cartController.updateQuantity(
                            cartItem.product.id,
                            cartItem.quantity - 1,
                          );
                        }
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    
                    SizedBox(width: 12),
                    
                    Text(
                      '${cartItem.quantity}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    SizedBox(width: 12),
                    
                    GestureDetector(
                      onTap: () {
                        cartController.updateQuantity(
                          cartItem.product.id,
                          cartItem.quantity + 1,
                        );
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.orange[600],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Remove Button and Total
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => cartController.removeFromCart(cartItem.product.id),
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red[400],
                  size: 20,
                ),
              ),
              
              SizedBox(height: 8),
              
              Text(
                '₹${cartItem.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}