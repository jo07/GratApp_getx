import 'package:get/get.dart';
import 'package:shop_app/models/Product.dart';


class ProductsController extends GetxController{
  final List<Product> sampleProducts = demoProducts.obs;
  final selectedImage = 0.obs;

  void updateSelectedImages(index){
    selectedImage(index);
  }
  static ProductsController get to => Get.find<ProductsController>();

}