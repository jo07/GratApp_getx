import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/controllers/demo_carts_controller.dart';
import 'package:shop_app/models/Cart.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

import 'package:get/get.dart';

class Body extends StatelessWidget {
  final DemoCartsController demoCartsController = DemoCartsController.to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Container(
        child: Obx(
          () => ListView.builder(
            itemCount: demoCartsController.demoCarts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key(
                  demoCartsController.demoCarts[index].product.id.toString(),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  demoCartsController.demoCarts.removeAt(index);
                },
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg"),
                    ],
                  ),
                ),
                child: CartCard(cart: demoCartsController.demoCarts[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
