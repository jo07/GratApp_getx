import 'package:get/get.dart';
import 'package:shop_app/models/CompleteForm.dart';

class CompleteFormController extends GetxController{
  final completeForm = CompleteForm(errors: []).obs;

  static CompleteFormController get to => Get.find<CompleteFormController>();
}