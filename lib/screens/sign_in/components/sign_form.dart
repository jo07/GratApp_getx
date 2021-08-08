import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/controllers/sign_form_controller.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:get/get.dart';
class SignForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final SignFormController signFormController = SignFormController.to;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Obx( () =>Checkbox(
                  value: signFormController.remember.value,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    signFormController.remember(value);
                  },
                ),
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () =>
                     Get.toNamed(ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          Obx(() => FormError(errors: signFormController.errors)),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Get.toNamed(LoginSuccessScreen.routeName);

              }
            },
          ),
        ],
      ),
    );
  }

  Obx buildPasswordFormField() {
    return Obx(() => TextFormField(
        obscureText: true,
        onSaved: (newValue) => signFormController.password(newValue),
        onChanged: (value) {
          if (value.isNotEmpty) {
            signFormController.removeError(error: kPassNullError);
          } else if (value.length >= 8) {
            signFormController.removeError(error: kShortPassError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            signFormController.addError(error: kPassNullError);
            return "";
          } else if (value.length < 8) {
            signFormController.addError(error: kShortPassError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
        ),
      ),
    );
  }

  Obx buildEmailFormField() {
    return Obx(() => TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => signFormController.email(newValue),
        onChanged: (value) {
          if (value.isNotEmpty) {
            signFormController.removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(value)) {
            signFormController.removeError(error: kInvalidEmailError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            signFormController.addError(error: kEmailNullError);
            return "";
          } else if (!emailValidatorRegExp.hasMatch(value)) {
            signFormController.addError(error: kInvalidEmailError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
        ),
      ),
    );
  }
}
