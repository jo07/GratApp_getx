import 'package:get/get.dart';

class CompleteForm {
  List<String?> errors ;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  CompleteForm({this.firstName, this.lastName, this.phoneNumber, this.address, required this.errors});

}

