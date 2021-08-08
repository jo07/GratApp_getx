import 'package:get/get.dart';

class SplashController extends GetxController{
  final currentPage = 0.obs;
  final List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
      "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ].obs;

  setCurrentPage( val){
    currentPage(val);
  }

  static SplashController get to => Get.find<SplashController>();

}