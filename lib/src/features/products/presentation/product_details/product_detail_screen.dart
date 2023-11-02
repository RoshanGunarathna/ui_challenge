//pub package imports
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

//Default package imports
import 'dart:ui';
import 'package:flutter/material.dart';

//Local file imports
import '../../../../constants/assets_path.dart';
import '../../../../constants/palette.dart';
import '../../domain/product_model.dart';

//!...DON"T USE DEVICE PREVIEW ON THIS SCREEN
/*Don't use Device Preview on this widget because I'm using PlatformDispatcher
 to get the device height before the widget is built. If you use Device Preview on this widget,
  it will result in a 'Pixel overflow' error & widget functionality will not work correctly.*/

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late final CarouselController _carouselController;
  late int currentCarouselIndex;

  //For the animations
  late ScrollController listViewScrollController = ScrollController();

  late double carouselHeightConstValue;
  late double carouselHeight;

  late final double totalPrice;
  late final ProductModel product;

  @override
  void initState() {
    _carouselController = CarouselController();
    currentCarouselIndex = 0;
    totalPrice = 12.99;

    final height = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.single)
        .size
        .height;
    debugPrint("height: $height");
    carouselHeightConstValue = height > 660.0 ? 355 : 255;
    carouselHeight = carouselHeightConstValue;

    product = ProductModel(
      id: "01",
      image: [
        "assets/images/products/product_01_00.png",
        "assets/images/products/product_01_01.png",
        "assets/images/products/product_01_02.png",
      ],
      name: "Lucky-Jade-Plant",
      description:
          "Plants make your life with minimal and happy love the plants more and enjoy life. Plants make your life with minimal and happy love the plants more and enjoy life. Plants make your life with minimal and happy love the plants more and enjoy life.Plants make your life with minimal and happy love the plants more and enjoy life. Plants make your life with minimal and happy love the plants more and enjoy life. Plants make your life with minimal and happy love the plants more and enjoy life.Plants make your life with minimal and happy love the plants more and enjoy life. Plants make your life with minimal and happy love the plants more and enjoy life. Plants make your life with minimal and happy love the plants more and enjoy life.Plants make your life with minimal and happy love the plants more and enjoy life. Plants make your life with minimal and happy love the plants more and enjoy life. Plants make your life with minimal and happy love the plants more and enjoy life.",
      price: 12.99,
      height: [30, 40],
      temperature: [20, 25],
      pot: "Ceramic Pot",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Bottom Card Text Styles
    final bottomCardMainTextStyle = TextStyle(
      fontSize: 13.sp,
      color: Palette.kFontColorWhite,
      fontWeight: FontWeight.w600,
    );
    final bottomCardSubtleTextStyle = TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w300,
      color: Palette.kFontColorWhite.withOpacity(0.9),
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55.h,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30).w,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: SvgPicture.asset(
              AssetsPath.kCartIcon,
              height: 28.r,
              width: 28.r,
            ),
          ),
          30.horizontalSpace,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: AnimatedContainer(
              duration: const Duration(
                milliseconds: 300,
              ),
              height: carouselHeight,
              width: 270.w,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (carouselHeight != carouselHeightConstValue.h) {
                      carouselHeight = carouselHeightConstValue.h;
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10).h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 35,
                          ).w,
                          child: dottedIndicator(currentCarouselIndex),
                        ),
                      ),
                      CarouselSlider(
                        items: product.image.map((image) {
                          return Image.asset(
                            image,
                            fit: BoxFit.contain,
                          );
                        }).toList(),
                        carouselController: _carouselController,
                        options: CarouselOptions(
                          scrollDirection: Axis.vertical,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentCarouselIndex = index;
                            });
                          },
                          viewportFraction: 1,
                          height: carouselHeightConstValue - 5.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ).w,
            child: Text(
              product.name,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          20.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 10.h,
                left: 30.w,
                right: 30.w,
              ),
              child: NotificationListener<ScrollUpdateNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (carouselHeight != 155.h &&
                      scrollInfo.metrics.pixels >= 10) {
                    setState(() {
                      carouselHeight = 155.h;
                    });
                  }

                  if (carouselHeight != carouselHeightConstValue.h &&
                      scrollInfo.metrics.pixels <= 0) {
                    setState(() {
                      carouselHeight = carouselHeightConstValue.h;
                    });
                  }
                  return true;
                },
                child: ListView(
                  controller: listViewScrollController,
                  children: [
                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Palette.kFontColorGray,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 230.h,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Palette.kPrimaryColor,
                borderRadius: BorderRadius.vertical(
                  top: const Radius.circular(40).r,
                ),
              ),
              child: Padding(
                padding: REdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              AssetsPath.kHeightIcon,
                              colorFilter: const ColorFilter.mode(
                                Palette.kIconColorWhite,
                                BlendMode.srcIn,
                              ),
                              height: 35.h,
                              width: 35.w,
                            ),
                            5.verticalSpace,
                            Text(
                              "Height",
                              style: bottomCardMainTextStyle,
                            ),
                            5.verticalSpace,
                            Text(
                              "${product.height[0].round()}cm - ${product.height[1].round()}cm",
                              style: bottomCardSubtleTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              AssetsPath.kTemperatureIcon,
                              colorFilter: const ColorFilter.mode(
                                Palette.kIconColorWhite,
                                BlendMode.srcIn,
                              ),
                              height: 35.h,
                              width: 35.w,
                            ),
                            5.verticalSpace,
                            Text(
                              "Temperature",
                              style: bottomCardMainTextStyle,
                            ),
                            5.verticalSpace,
                            Text(
                              "${product.temperature[0].round()}\u2103 - ${product.temperature[1].round()}\u2103",
                              style: bottomCardSubtleTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              AssetsPath.kPlantPotIcon,
                              colorFilter: const ColorFilter.mode(
                                Palette.kIconColorWhite,
                                BlendMode.srcIn,
                              ),
                              height: 35.h,
                              width: 35.w,
                            ),
                            5.verticalSpace,
                            Text(
                              "Pot",
                              style: bottomCardMainTextStyle,
                            ),
                            5.verticalSpace,
                            Text(
                              product.pot,
                              style: bottomCardSubtleTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ).w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Price",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Palette.kFontColorWhite,
                                ),
                              ),
                              Text(
                                "\$$totalPrice",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Palette.kFontColorWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 75.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                              color: Palette.kPrimaryDark,
                              borderRadius: BorderRadius.circular(20).r,
                            ),
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Palette.kFontColorWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//Dotted indicator
  Widget dottedIndicator(int currentCarouselIndex) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(
        product.image.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 3.0),
          height: currentCarouselIndex == index ? 18.0 : 6.0,
          width: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: currentCarouselIndex == index
                ? Palette.kPrimaryColor
                : Palette.kGrayColor,
          ),
        ),
      ),
    );
  }
}
