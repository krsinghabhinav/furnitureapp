import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodel/productcategoryvm.dart';

class Dymmycategory extends StatefulWidget {
  const Dymmycategory({super.key});

  @override
  State<Dymmycategory> createState() => _DymmycategoryState();
}

class _DymmycategoryState extends State<Dymmycategory> {
  final productCateg = Get.put(ProductCategoryController());

  @override
  void initState() {
    super.initState();
    productCateg.getProducts(); // Fetch categories and products
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Category'),
      ),
      body: Column(
        children: [
          // Horizontal category list
          Container(
            height: 70,
            padding: const EdgeInsets.all(10),
            child: Obx(() {
              if (productCateg.categoryProduct.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productCateg.categoryProduct.length,
                itemBuilder: (context, index) {
                  final category = productCateg.categoryProduct[index];
                  return GestureDetector(
                    onTap: () {
                      // Call the filter function when a category is tapped
                      productCateg.filterProductsByCategory(category);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          // Display filtered products
          Expanded(
            child: Obx(() {
              if (productCateg.filteredProducts.isEmpty) {
                return const Center(child: Text('No products available.'));
              }
              return ListView.builder(
                itemCount: productCateg.filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = productCateg.filteredProducts[index];
                  return ListTile(
                    leading: Image.network(
                      product['thumbnail'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product['title']),
                    subtitle: Text(product['category']),
                    trailing: Text('\$${product['price']}'),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
