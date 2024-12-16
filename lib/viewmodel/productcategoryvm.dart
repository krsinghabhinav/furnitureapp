import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductCategoryController extends GetxController {
  var categoryProduct = RxList<String>(['All']); // Reactive list for categories
  var allProducts =
      RxList<dynamic>([]); // To store all products fetched from the API
  var filteredProducts =
      RxList<dynamic>([]); // To store products filtered by category

  // Function to fetch products and update categories
  Future<void> getProducts() async {
    String url = 'https://dummyjson.com/products';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> products = jsonDecode(response.body)['products'];

        // Update the allProducts list
        allProducts.clear();
        allProducts.addAll(products);

        // Use a Set to remove duplicates for categories
        Set<String> uniqueCategories = {'All'}; // Include "All" by default
        for (var product in products) {
          uniqueCategories.add(product['category']);
        }

        // Update the reactive list with unique categories
        categoryProduct.clear();
        categoryProduct.addAll(uniqueCategories);

        // By default, show all products in filteredProducts
        filteredProducts.assignAll(allProducts);

        print('Categories: $categoryProduct'); // Debugging output
      } else {
        // Handle non-200 response
        print('Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors during the HTTP request
      print('Error: $e');
    }
  }

  // Function to filter products by selected category
  void filterProductsByCategory(String category) {
    if (category == 'All') {
      // Show all products if 'All' is selected
      filteredProducts.assignAll(allProducts);
    } else {
      // Filter products by selected category
      filteredProducts.assignAll(
        allProducts
            .where((product) => product['category'] == category)
            .toList(),
      );
    }
    print('Filtered Products: $filteredProducts'); // Debugging output
  }
}
