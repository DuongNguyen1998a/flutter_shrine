import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/colors.dart';

class AppDrawer extends StatelessWidget {
  final ThemeData theme;

  const AppDrawer({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: kShrinePink50,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          children: [
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: kShrineBrown900,
              ),
              title: Text(
                'Sign out',
                style: theme.textTheme.bodyText1,
              ),
              onTap: () {
                final box = GetStorage();
                box.erase();
                Get.offNamed('/login');
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
