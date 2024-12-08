import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controller/searchproduct.dart';
import '../service/service.dart';

class mainpageheader extends StatefulWidget {
  ApiService apiService = ApiService();
  mainpageheader({
    super.key,
  });

  @override
  State<mainpageheader> createState() => _mainpageheaderState();
}

class _mainpageheaderState extends State<mainpageheader> {
  final searchController = Get.put(SearchProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Furniture Design",
              style: TextStyle(
                  color: HexColor("#ffffff"),
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: HexColor("#e6dae2"),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: searchController.searchController,
                onChanged: (value) {
                  searchController.searchData();
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search Products",
                    contentPadding: EdgeInsets.all(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
