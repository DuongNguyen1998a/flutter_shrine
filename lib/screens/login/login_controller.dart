import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var loginFormKey = GlobalKey<FormState>();
  var username = ''.obs;
  var password = ''.obs;

  void doLogin() {
    final box = GetStorage();

    if (!loginFormKey.currentState!.validate()) {
      return;
    } else {
      loginFormKey.currentState!.save();
      if (username.value.toString().contains('duong') &&
          password.value.toString().contains('123456')) {
        box.write('USERNAME', username.value);
        box.write('PASSWORD', password.value);

        Get.offNamed('/home');
      } else {
        debugPrint('Invalid username or password');
      }
    }
  }
}
