import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controller/searchproduct.dart';
import '../view/productdetails.dart';
import '../widgets/mainpageheader.dart';

class Mainscreen extends StatelessWidget {
  Mainscreen({super.key});

  final searchController = Get.put(SearchProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#015ab4"),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mainpageheader(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  color: HexColor("#ede5cc"),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Obx(
                  () => Visibility(
                    visible: searchController.isLoading.value,
                    replacement: Center(
                      child: CircularProgressIndicator(
                        color: HexColor("#e91d64"),
                      ),
                    ),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemCount: searchController.searchPro.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final product = searchController.searchPro[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              Productdetails(productmodel: [product]),
                            );
                          },
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 120,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: HexColor("#a5d3eb"),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Text(
                                            product.title ?? '',
                                            style: TextStyle(
                                              color: HexColor("#2d85c5"),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 40,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: HexColor("#015ab4"),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(35),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '\$${product.price}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    height: 200,
                                    child: Image.network(product.image ?? ''),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
