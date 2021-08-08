import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/controllers/splash_controller.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatelessWidget {
  final SplashController splashController = SplashController.to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Obx(() => PageView.builder(
                  onPageChanged: (value) {
                    splashController.currentPage(value);

                  },
                  itemCount: splashController.splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashController.splashData[index]["image"],
                    text: splashController.splashData[index]['text'],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashController.splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Get.toNamed(SignInScreen.routeName);
                        // Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Obx buildDot({int? index}) {
    return Obx(()  => AnimatedContainer(
        duration: kAnimationDuration,
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: splashController.currentPage.value == index ? 20 : 6,
        decoration: BoxDecoration(
          color: splashController.currentPage.value == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
