import 'package:flutter/material.dart';
import 'package:furnitureapp/model/productmodel.dart';

class Productdetails extends StatefulWidget {
  List<ProductModel>? productmodel;
  Productdetails({super.key, this.productmodel});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
