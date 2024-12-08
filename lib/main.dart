import 'package:flutter/material.dart';
import 'package:furnitureapp/view/welcomepage.dart/welcomepage.dart';
import 'package:get/get.dart';

import 'view/custom_widget.dart/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: myTheme.lightTheme(context),
      // darkTheme: myTheme.darkTheme(context),
      home: WelelcomePage(),
    );
  }
}
