import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/features/onboard/onboard_screen.dart';
import 'src/features/products/presentation/product_details/product_detail_screen.dart';
import 'src/features/products/presentation/search_products/search_product_screen.dart';
import 'src/constants/palette.dart';
import 'src/theme.dart';

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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'ui_challenge',
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: CustomTheme.primaryTheme(context),
          home: child,
        );
      },
      child: const OnboardScreen(),
      // const SearchProductScreen(),
      // const ProductDetailScreen(),
    );
  }
}
