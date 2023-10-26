import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'onboard_screen.dart';
import 'palette.dart';
import 'search_product_screen.dart';

void main() {
  runApp(
    DevicePreview(
      //enabled: false,
      enabled: !kReleaseMode,
      builder: (_) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'ui_challenge',
      theme: ThemeData(
        scaffoldBackgroundColor: Palette.backgroundColor,
        fontFamily: 'Caros-Soft',
        useMaterial3: true,
        primaryColor: Palette.primaryColor,
      ),
      home: const SearchProductScreen(),
    );
  }
}
