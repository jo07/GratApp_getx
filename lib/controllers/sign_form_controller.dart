import 'package:get/get.dart';

class SignFormController extends GetxController{
  final email = ''.obs;
  final password = ''.obs;
  final remember = false.obs;
  final confirmPassword = ''.obs;

  final List<String> errors = [].obs as List<String>;

  void addError({required String error}) {
    if (!errors.contains(error))
      errors.add(error);
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      errors.remove(error);
  }

  setRemember(bool rememberVal){
    remember(rememberVal);
  }

  setPassword(String pass){
    password(pass);
  }

  setConfirmPassword(String pass){
    confirmPassword(pass);
  }

  setEmail(String val){
    email(val);
  }

  static SignFormController get to => Get.find<SignFormController>();
}