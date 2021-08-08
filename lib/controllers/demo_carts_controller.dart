// Demo data for our cart
import 'package:get/get.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';


class DemoCartsController extends GetxController{

  final List<Cart> demoCarts = [
    Cart(product: demoProducts[0], numOfItem: 2),
    Cart(product: demoProducts[1], numOfItem: 1),
    Cart(product: demoProducts[3], numOfItem: 1),
  ].obs;

  static DemoCartsController get to => Get.find<DemoCartsController>();

}