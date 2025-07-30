import 'package:get/get.dart';
import 'package:masala_showcase/models/product.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var selectedCategory = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() {
    isLoading.value = true;
    
    // Simulating API call with sample data
    Future.delayed(Duration(seconds: 1), () {
      products.value = [
        Product(
          id: '1',
          name: 'Garam Masala',
          description: 'Traditional blend of aromatic spices perfect for Indian cuisine',
          price: 150.0,
          imageUrl: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400',
          category: 'Spice Blends',
          weight: '100g',
          ingredients: 'Cumin, Coriander, Black Pepper, Cinnamon, Cardamom, Cloves',
        ),
        Product(
          id: '2',
          name: 'Chicken Masala',
          description: 'Special blend for chicken dishes with rich flavors',
          price: 180.0,
          imageUrl: 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
          category: 'Spice Blends',
          weight: '100g',
          ingredients: 'Turmeric, Red Chili, Ginger, Garlic, Onion, Coriander',
        ),
        Product(
          id: '3',
          name: 'Vegetable Masala',
          description: 'Perfect seasoning for all vegetable dishes',
          price: 120.0,
          imageUrl: 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=400',
          category: 'Spice Blends',
          weight: '100g',
          ingredients: 'Cumin, Mustard, Fenugreek, Asafoetida, Turmeric',
        ),
        Product(
          id: '4',
          name: 'Tandoori Masala',
          description: 'Authentic tandoori spice mix for grilled dishes',
          price: 200.0,
          imageUrl: 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=400',
          category: 'Spice Blends',
          weight: '100g',
          ingredients: 'Paprika, Cumin, Coriander, Ginger, Garlic, Garam Masala',
        ),
        Product(
          id: '5',
          name: 'Biryani Masala',
          description: 'Special blend for aromatic biryani preparation',
          price: 160.0,
          imageUrl: 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=400',
          category: 'Spice Blends',
          weight: '100g',
          ingredients: 'Saffron, Cardamom, Cinnamon, Cloves, Bay Leaves, Star Anise',
        ),
        Product(
          id: '6',
          name: 'Kashmiri Red Chili Powder',
          description: 'Mild and colorful chili powder for authentic taste',
          price: 140.0,
          imageUrl: 'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
          category: 'Individual Spices',
          weight: '100g',
          ingredients: 'Kashmiri Red Chilies',
        ),
      ];
      isLoading.value = false;
    });
  }

  List<Product> get filteredProducts {
    if (selectedCategory.value == 'All') {
      return products;
    }
    return products.where((product) => product.category == selectedCategory.value).toList();
  }

  List<String> get categories {
    Set<String> categories = products.map((product) => product.category).toSet();
    return ['All', ...categories.toList()];
  }

  void setCategory(String category) {
    selectedCategory.value = category;
  }
}