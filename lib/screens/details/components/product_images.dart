import 'package:flutter/material.dart';
import 'package:shop_app/controllers/products_controller.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:get/get.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final ProductsController sampleProductsController = ProductsController.to;
    List<Product> products = sampleProductsController.sampleProducts;
    return Obx(() => Column(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(238),
            child: AspectRatio(
              aspectRatio: 1,
              child: Hero(
                tag: product.id.toString(),
                child: Image.asset(product.images[0]),
              ),
            ),
          ),
          // SizedBox(height: getProportionateScreenWidth(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(products[sampleProductsController.selectedImage.value].images.length,
                  (index) => buildSmallProductPreview(index)),
            ],
          )
        ],
      ),
    );
  }

  buildSmallProductPreview(int index) {
    final ProductsController sampleProductsController = ProductsController.to;
    return GestureDetector(
        onTap: () {
      //   setState(() {
      //     selectedImage = index;
      //   });
          sampleProductsController.updateSelectedImages(index);
      },
      child: AnimatedContainer(
          duration: defaultDuration,
          margin: EdgeInsets.only(right: 15),
          padding: EdgeInsets.all(8),
          height: getProportionateScreenWidth(48),
          width: getProportionateScreenWidth(48),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: kPrimaryColor.withOpacity(sampleProductsController.selectedImage.value == index ? 1 : 0)),
          ),
          child: Image.asset(product.images[index]),
        ),
    );
  }
}
