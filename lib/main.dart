import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// Utils
import './utils/theme.dart';
// Routes
import 'routes/app_routes.dart';
// Screens
import 'screens/home/home_screen.dart';
import '/screens/login/login_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => GetMaterialApp(
        title: 'Flutter Demo Ahihi nè',
        theme: kShrineTheme,
        debugShowCheckedModeBanner: false,
        home: box.read('USERNAME') != null
            ? const HomeScreen()
            : const LoginScreen(),
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        getPages: AppRoutes.routes,
      ),
    );
  }
}
