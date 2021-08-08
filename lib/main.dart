import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';
import 'package:get/get.dart';

import 'controllers/complete_form_controller.dart';
import 'controllers/demo_carts_controller.dart';
import 'controllers/products_controller.dart';
import 'controllers/sign_form_controller.dart';

void main() {
  Get.put(ProductsController());
  Get.put(DemoCartsController());
  Get.put(CompleteFormController());
  Get.put(SignFormController());

  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      // routes: routes,
      getPages: getPages,
    );
  }
}
