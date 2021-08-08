import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/controllers/sign_form_controller.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  final SignFormController signFormController = SignFormController.to;
  final _formKey = GlobalKey<FormState>();

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
          buildConformPassFormField(),
          FormError(errors: signFormController.errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                Get.toNamed(CompleteProfileScreen.routeName);

              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => signFormController.confirmPassword(newValue),
      onChanged: (value) {
        if (value.isNotEmpty) {
          signFormController.removeError(error: kPassNullError);
        } else if (value.isNotEmpty && signFormController.password.value == signFormController.confirmPassword.value) {
          signFormController.removeError(error: kMatchPassError);
        }
        signFormController.confirmPassword(value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          signFormController.addError(error: kPassNullError);
          return "";
        } else if ((signFormController.password.value != value)) {
          signFormController.addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => signFormController.password(newValue),
      onChanged: (value) {
        if (value.isNotEmpty) {
          signFormController.removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          signFormController.removeError(error: kShortPassError);
        }
        signFormController.password(value);
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
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
    );
  }
}
