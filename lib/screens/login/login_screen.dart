import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// Controllers
import 'package:shrine_theme/screens/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
    );

    SizedBox height12 = SizedBox(
      height: 12.h,
    );
    SizedBox height40 = SizedBox(
      height: 40.h,
    );

    final loginController = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: loginController.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'SHRINE',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                height40,
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    prefixIcon: const Icon(Icons.person),
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                  ),
                  onSaved: (val) {
                    loginController.username.value = val!;
                  },
                ),
                height12,
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: const Icon(Icons.visibility),
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                  ),
                  onSaved: (val) {
                    loginController.password.value = val!;
                  },
                ),
                height12,
                ElevatedButton(
                  onPressed: () {
                    loginController.doLogin();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 12.w,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
