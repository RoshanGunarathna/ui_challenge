import 'package:flutter/material.dart';

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
        index.isEven ? 100 : 0.0,
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  product.image[0],
                  fit: BoxFit.contain,
                  height: 80,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      product.shortDescription ?? "",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_rounded,
                              color: Colors.white,
                              size: 18,
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
          SizedBox(
            width: 200,
            height: 75,
            child: Text(
              "Found \n$productListLength Results",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          card,
        ],
      );
    }
    //else if (index == productListLength - 1) {
    //   return Padding(
    //     padding: const EdgeInsets.only(bottom: 100),
    //     child: card,
    //   );
    // }
    else {
      return card;
    }
  }
}
