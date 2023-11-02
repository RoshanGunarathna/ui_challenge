import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final int index;
  final int productListLength;
  const ProductCard({
    super.key,
    required this.product,
    required this.index,
    required this.productListLength,
  });

  @override
  Widget build(BuildContext context) {
    final Widget card = Transform.translate(
      offset: Offset(
        0.0,
        index.isEven ? 85.h : 0.0,
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(
                  product.image[0],
                  fit: BoxFit.contain,
                  height: 80.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                  left: 5.w,
                  right: 5.w,
                  bottom: 5.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      product.shortDescription ?? "",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 30.h,
                          width: 30.w,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_rounded,
                              color: Colors.white,
                              size: 18.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (index == 0) {
      return Stack(
        children: [
          card,
          Container(
            padding: EdgeInsets.only(
              left: 8.w,
            ),
            height: 76.h,
            alignment: Alignment.bottomLeft,
            child: Text(
              "Found \n$productListLength Results",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
                height: 1.2.h,
              ),
            ),
          ),
        ],
      );
    } else {
      return card;
    }
  }
}
