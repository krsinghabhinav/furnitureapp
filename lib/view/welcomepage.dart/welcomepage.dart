import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widget.dart/colorswidgets.dart';
import '../custom_widget.dart/customButton.dart';
import 'componets/background.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;

    return Scaffold(
      body: backgroundwidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to akCoding",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colorswidgets.textblack,
                ),
              ),
              Image.asset(
                "assets/images/undraw_Balloons.png",
                height: size.height * .35,
              ),
              CustomButton(
                textTitle: 'LOGIN',
                ontab: () {
                  Get.snackbar(
                    "Login",
                    "Login Button Pressed",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
              CustomButton(
                textTitle: 'REGISTER',
                color: Colors.blue,
                ontab: () {
                  Get.snackbar(
                    "Register",
                    "Register Button Pressed",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
