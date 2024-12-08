import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/productmodel.dart';
import '../service/service.dart';

class SearchProductController extends GetxController {
  final apiService = ApiService(); // API service instance
  var productModel = <ProductModel>[]; // All available products
  final searchPro = <ProductModel>[].obs; // Reactive list for filtered products
  final searchController = TextEditingController(); // Search input controller
  var isLoading = false.obs; // Reactive loading flag

  // Method to fetch product data
  void getProductData() async {
    try {
      isLoading.value = false;
      final products = await apiService.getProductdata();
      productModel = products ?? [];
      searchPro.value = productModel;
      isLoading.value = true;
    } catch (e) {
      print("Error fetching products: $e");
      isLoading.value = false;
    }
  }

  // Method to filter the product list based on the search query
  void searchData() {
    var query = searchController.text.trim();
    if (query.isNotEmpty) {
      searchPro.value = productModel.where((element) {
        return element.title?.toLowerCase().contains(query.toLowerCase()) ??
            false;
      }).toList();
    } else {
      searchPro.value = productModel;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductData();
  }

  @override
  void onClose() {
    searchController.dispose(); // Dispose the controller when done
    super.onClose();
  }
}
