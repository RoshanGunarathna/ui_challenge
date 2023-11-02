import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants/palette.dart';
import '../../domain/product_model.dart';
import 'dart:math' as math;

import 'product_card.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({super.key});

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  late final TextEditingController _searchController;
  late final List<ProductModel> _products;

  bool enableSearchResultCountWidget = false;

  @override
  void initState() {
    _searchController = TextEditingController();
    _searchController.text = "Plants";

    _products = [
      ProductModel(
        id: "01",
        image: ["assets/images/products/product_01_00.png"],
        name: "Lucky Jade Plant",
        description:
            "Plants make your life with minimal and happy love the plants more and enjoy life.",
        price: 12.99,
        height: [30, 40],
        temperature: [20, 25],
        pot: "Ceramic Pot",
      ),
      ProductModel(
        id: "02",
        image: ["assets/images/products/product_02.png"],
        description:
            "Plants make your life with minimal and happy love the plants more and enjoy life.",
        name: "Snake Plants",
        price: 12.99,
        height: [30, 40],
        temperature: [20, 25],
        pot: "Ceramic Pot",
      ),
      ProductModel(
        id: "03",
        image: ["assets/images/products/product_03.png"],
        description:
            "Plants make your life with minimal and happy love the plants more and enjoy life.",
        name: "Peperomia plant",
        shortDescription: "Super green",
        price: 12.99,
        height: [30, 40],
        temperature: [20, 25],
        pot: "Ceramic Pot",
      ),
      ProductModel(
        id: "04",
        image: ["assets/images/products/product_04.png"],
        name: "Small Plant",
        description:
            "Plants make your life with minimal and happy love the plants more and enjoy life.",
        shortDescription: "Super green",
        price: 12.99,
        height: [30, 40],
        temperature: [20, 25],
        pot: "Ceramic Pot",
      ),
      ProductModel(
        id: "05",
        image: ["assets/images/products/product_05.png"],
        name: "Plant",
        description:
            "Plants make your life with minimal and happy love the plants more and enjoy life.",
        price: 12.99,
        height: [30, 40],
        temperature: [20, 25],
        pot: "Ceramic Pot",
      ),
      ProductModel(
        id: "06",
        image: ["assets/images/products/product_06.png"],
        name: "Plant",
        description:
            "Plants make your life with minimal and happy love the plants more and enjoy life.",
        price: 12.99,
        height: [30, 40],
        temperature: [20, 25],
        pot: "Ceramic Pot",
      ),
      ProductModel(
        id: "01",
        image: ["assets/images/products/product_01_00.png"],
        name: "Lucky Jade Plant",
        description:
            "Plants make your life with minimal and happy love the plants more and enjoy life.",
        price: 12.99,
        height: [30, 40],
        temperature: [20, 25],
        pot: "Ceramic Pot",
      ),
      ProductModel(
        id: "02",
        image: ["assets/images/products/product_02.png"],
        description:
            "Plants make your life with minimal and happy love the plants more and enjoy life.",
        name: "Snake Plants",
        price: 12.99,
        height: [30, 40],
        temperature: [20, 25],
        pot: "Ceramic Pot",
      ),
      ProductModel(
        id: "03",
        image: ["assets/images/products/product_03.png"],
        description:
            "Plants make your life with minimal and happy love the plants more and enjoy life.",
        name: "Peperomia plant",
        shortDescription: "Super green",
        price: 12.99,
        height: [30, 40],
        temperature: [20, 25],
        pot: "Ceramic Pot",
      ),
      ProductModel(
        id: "04",
        image: ["assets/images/products/product_04.png"],
        name: "Small Plant",
        description:
            "Plants make your life with minimal and happy love the plants more and enjoy life.",
        shortDescription: "Super green",
        price: 12.99,
        height: [30, 40],
        temperature: [20, 25],
        pot: "Ceramic Pot",
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leadingWidth: 0,
        //backgroundColor: Palette.backgroundColor,
        toolbarHeight: 55,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Search Products",
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              right: 30,
            ),
            padding: const EdgeInsets.all(1.0),
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: CircleAvatar(
              child: Image.asset("assets/images/profile_pic.png"),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            sliver: SliverAppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              snap: true,
              floating: true,
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              //backgroundColor: Palette.backgroundColor,
              title: PreferredSize(
                preferredSize: const Size(double.infinity, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 55,
                      child: Row(
                        children: [
                          Expanded(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextField(
                                controller: _searchController,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      "assets/icons/search_icon.svg",
                                      colorFilter: const ColorFilter.mode(
                                        Color.fromARGB(255, 134, 134, 134),
                                        BlendMode.srcIn,
                                      ),
                                      height: 15,
                                    ),
                                    // icon: const Icon(
                                    //   Icons.search,
                                    //   opticalSize: 1,
                                    //   weight: 0.4,
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 50,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Transform.flip(
                                  flipX: true,
                                  child: SvgPicture.asset(
                                    "assets/icons/filter_icon.svg",
                                    colorFilter: const ColorFilter.mode(
                                      Color.fromARGB(255, 59, 59, 59),
                                      BlendMode.srcIn,
                                    ),
                                    height: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.only(top: 16, left: 25, right: 25),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.9,
                mainAxisExtent: 275,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final ProductModel product = _products[index];

                  return ProductCard(
                    index: index,
                    product: product,
                    productListLength: _products.length,
                  );
                },
                childCount: _products.length,
              ),
            ),
          ),

          //To fix the regression after add offset to Product Card widget
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
