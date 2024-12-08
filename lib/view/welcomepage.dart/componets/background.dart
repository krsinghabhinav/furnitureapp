import 'package:flutter/material.dart';
import 'package:get/get.dart';

class backgroundwidget extends StatelessWidget {
  Size size = Get.size;
  final Widget child;
  backgroundwidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          // Background Image Positioned at the Top
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.50, // Adjust size as needed
            ),
          ),
          // Example of Adding More Content
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/bottom.png",
              width: size.width * 0.50, // Adjust size as needed
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 80,
          //     left: 40,
          //   ),
          //   child: Image.asset(
          //     "assets/images/undraw_Balloons.png",
          //   ),
          // )
          child,
        ],
      ),
    );
  }
}
