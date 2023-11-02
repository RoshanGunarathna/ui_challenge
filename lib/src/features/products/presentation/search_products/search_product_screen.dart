import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/assets_path.dart';
import '../../../../constants/palette.dart';
import '../../domain/product_model.dart';

import 'product_card.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({super.key});

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  late final TextEditingController _searchController;
  late final List<ProductModel> _products;

  @override
  void initState() {
    _searchController = TextEditingController();
    _searchController.text = "Plants";

    _products = [
      ProductModel(
        id: "01",
        image: [AssetsPath.kProductImage1],
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
        image: [AssetsPath.kProductImage2],
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
        image: [AssetsPath.kProductImage3],
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
        image: [AssetsPath.kProductImage4],
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
        image: [AssetsPath.kProductImage5],
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
        image: [AssetsPath.kProductImage6],
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
        image: [AssetsPath.kProductImage1],
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
        image: [AssetsPath.kProductImage2],
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
        image: [AssetsPath.kProductImage3],
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
        image: [AssetsPath.kProductImage4],
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.h,
        shadowColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leadingWidth: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20).w,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Search Products",
          style: TextStyle(
            fontSize: 17.sp,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              right: 25,
            ).w,
            padding: const EdgeInsets.all(1.0).r,
            height: 52.r,
            width: 52.r,
            decoration: BoxDecoration(
              color: Palette.kWhiteColor,
              borderRadius: BorderRadius.circular(30).r,
            ),
            child: CircleAvatar(
              radius: 30.r,
              child: Image.asset(
                AssetsPath.kProfileImage,
                height: 51.r,
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
              left: 13.w,
              right: 13.w,
            ),
            sliver: SliverAppBar(
              primary: false,
              elevation: 0,
              scrolledUnderElevation: 0,
              snap: true,
              toolbarHeight: 65.h,
              floating: true,
              automaticallyImplyLeading: false,
              title: PreferredSize(
                preferredSize: Size(double.infinity, 100.h),
                child: Row(
                  children: [
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Palette.kWhiteColor,
                          borderRadius: BorderRadius.circular(14).r,
                        ),
                        child: TextField(
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          controller: _searchController,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                AssetsPath.kSearchIcon,
                                colorFilter: const ColorFilter.mode(
                                  Palette.kIconColorGray,
                                  BlendMode.srcIn,
                                ),
                                height: 15.r,
                                width: 15.r,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    10.horizontalSpace,
                    SizedBox(
                      height: 46.h,
                      width: 46.w,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Palette.kWhiteColor,
                          borderRadius: BorderRadius.circular(14).r,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Transform.flip(
                            flipX: true,
                            child: SvgPicture.asset(
                              AssetsPath.kFilterIcon,
                              colorFilter: const ColorFilter.mode(
                                Palette.kIconPrimaryColor,
                                BlendMode.srcIn,
                              ),
                              height: 20.r,
                              width: 20.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.only(
              top: 18.h,
              left: 25.w,
              right: 25.w,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 20.w,
                childAspectRatio: (100.r / 2) / (172.r / 2),
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
          SliverToBoxAdapter(
            child: 100.verticalSpace,
          ),
        ],
      ),
    );
  }
}
