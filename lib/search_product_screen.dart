import 'package:flutter/material.dart';
import 'palette.dart';
import 'product_card.dart';
import 'product_model.dart';

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
        id: "02",
        image: "assets/images/products/product_02.png",
        name: "Lucky Jade Plant",
        price: 12.99,
      ),
      ProductModel(
        id: "01",
        image: "assets/images/products/product_01.png",
        name: "Snake Plants",
        price: 12.99,
      ),
      ProductModel(
        id: "04",
        image: "assets/images/products/product_04.png",
        name: "Peperomia plant",
        shortDescription: "Super green",
        price: 12.99,
      ),
      ProductModel(
        id: "03",
        image: "assets/images/products/product_03.png",
        name: "Small Plant",
        shortDescription: "Super green",
        price: 12.99,
      ),
      ProductModel(
        id: "05",
        image: "assets/images/products/product_05.png",
        name: "Plant",
        price: 12.99,
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
        backgroundColor: Palette.backgroundColor,
        toolbarHeight: 55,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
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
            fontSize: 18,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              right: 20,
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
          SliverAppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            snap: true,
            floating: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            backgroundColor: Palette.backgroundColor,
            title: PreferredSize(
              preferredSize: const Size(double.infinity, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
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
                                  color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search,
                                    opticalSize: 1,
                                    weight: 0.4,
                                  ),
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
                              icon: const Icon(Icons.menu_rounded),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.9,
                mainAxisExtent: 300,
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
