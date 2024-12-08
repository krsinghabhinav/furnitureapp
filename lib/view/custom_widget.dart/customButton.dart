import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colorswidgets.dart'; // Ensure this file has `textColor` defined

class CustomButton extends StatelessWidget {
  final String textTitle;
  final Color? color;
  final VoidCallback? ontab;

  const CustomButton({
    required this.textTitle,
    this.color,
    this.ontab,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        margin: const EdgeInsets.all(10),
        height: Get.height * 0.06,
        width: Get.width * 0.80,
        decoration: BoxDecoration(
          color: color ?? const Color.fromARGB(255, 143, 2, 143),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            textTitle,
            style: TextStyle(
              fontSize: 20,
              color: Colorswidgets.textWhite, // Ensure `textColor` is defined
            ),
          ),
        ),
      ),
    );
  }
}
