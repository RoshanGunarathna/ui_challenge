import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'palette.dart';
import 'product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final CarouselController _carouselController = CarouselController();
  int currentCarouselIndex = 0;
  final ProductModel product = ProductModel(
    id: "01",
    image: [
      "assets/images/products/product_02.png",
      "assets/images/products/product_02_01.png",
      "assets/images/products/product_02_02.png",
    ],
    name: "Lucky-Jade-Plant",
    description:
        "Plants make your life with minimal and happy love the plants more and enjoy life.",
    price: 12.99,
    height: [30, 35],
    temperature: [20, 25],
    pot: "Ceramic Pot",
  );

  final totalPrice = 12.99;
  @override
  Widget build(BuildContext context) {
    const underCardTextStyle = TextStyle(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leadingWidth: 0,
        backgroundColor: Palette.backgroundColor,
        toolbarHeight: 55,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 28,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 30.0,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 355,
                  width: 270,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 35,
                          ),
                          child: dottedIndicator(currentCarouselIndex),
                        ),
                      ),
                      CarouselSlider(
                        items: product.image.map((image) {
                          // currentCarouselIndex = entry.key;

                          return Image.asset(
                            image,
                            fit: BoxFit.cover,
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
                          height: 350,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30,
                  left: 30,
                  right: 30,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Palette.fontColorGray,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 230,
              width: double.infinity,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Palette.primaryColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Icon(
                                Icons.upload_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Height",
                                style: underCardTextStyle,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${product.height[0].round()}cm - ${product.height[1].round()}cm",
                                style: underCardTextStyle.copyWith(
                                  fontSize: 12,
                                  color: Colors.white60,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                size: 35,
                                Icons.thermostat_rounded,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Temperature",
                                style: underCardTextStyle,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${product.temperature[0].round()}\u2103 - ${product.temperature[1].round()}\u2103",
                                style: underCardTextStyle.copyWith(
                                  fontSize: 10,
                                  color: Colors.white60,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(
                                size: 35,
                                Icons.grass_rounded,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Pot",
                                style: underCardTextStyle,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                product.pot,
                                style: underCardTextStyle.copyWith(
                                  fontSize: 12,
                                  color: Colors.white60,
                                ),
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
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Total Price",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "\$$totalPrice",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              height: 75,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Palette.primaryDark,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "Add to Cart",
                                style: TextStyle(
                                  color: Palette.fontColorWhite,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
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
                ? Palette.primaryColor
                : Palette.grayColor,
          ),
        ),
      ),
    );
  }
}
