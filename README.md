# Masala Showcase - Flutter Application

[![GitHub issues](https://img.shields.io/github/issues/rahul14322982/Freelancing-1-masala-appp-)](https://github.com/rahul14322982/Freelancing-1-masala-appp-/issues)
[![GitHub closed issues](https://img.shields.io/github/issues-closed/rahul14322982/Freelancing-1-masala-appp-)](https://github.com/rahul14322982/Freelancing-1-masala-appp-/issues?q=is%3Aissue+is%3Aclosed)

A beautiful Flutter application for showcasing and selling homemade masala items using GetX state management.

## Features

- **Product Showcase**: Display all masala products in an attractive grid layout
- **Category Filtering**: Filter products by categories (Spice Blends, Individual Spices, etc.)
- **Product Details**: View detailed information about each product including ingredients
- **Shopping Cart**: Add products to cart with quantity controls
- **Order Placement**: Place orders with owner contact information
- **Modern UI**: Beautiful orange-themed design with Material Design 3

## Screens

1. **Home Screen**: Product grid with category filters and cart icon
2. **Product Detail Screen**: Detailed product information with add to cart
3. **Cart Screen**: Shopping cart with quantity controls and order placement

## State Management

The application uses **GetX** for state management with:
- `ProductController`: Manages product data and category filtering
- `CartController`: Handles cart operations and order placement

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── controllers/              # GetX controllers
│   ├── product_controller.dart
│   └── cart_controller.dart
├── models/                   # Data models
│   ├── product.dart
│   └── cart_item.dart
├── screens/                  # UI screens
│   ├── home_screen.dart
│   ├── cart_screen.dart
│   └── product_detail_screen.dart
├── widgets/                  # Reusable widgets
│   ├── product_card.dart
│   ├── category_filter.dart
│   └── cart_item_card.dart
└── routes/                   # Navigation routes
    └── app_routes.dart
```

## Getting Started

1. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

2. **Run the Application**:
   ```bash
   flutter run
   ```

## Dependencies

- `get: ^4.6.6` - State management and navigation
- `http: ^1.1.0` - HTTP requests (for future API integration)
- `shared_preferences: ^2.2.2` - Local storage
- `cached_network_image: ^3.3.0` - Image caching

## Features Implemented

✅ Product showcase with grid layout  
✅ Category filtering  
✅ Product detail view  
✅ Shopping cart functionality  
✅ Quantity controls  
✅ Order placement with confirmation dialog  
✅ Owner contact information display  
✅ Beautiful orange-themed UI  
✅ GetX state management  
✅ Responsive design  

## Contact Information

When users place an order, they see:
- **Phone**: +91 98765 43210
- **Email**: owner@masalahome.com

The application is ready to run and provides a complete e-commerce experience for homemade masala products!