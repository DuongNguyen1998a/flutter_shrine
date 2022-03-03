import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shrine_theme/screens/home/home_controller.dart';

import 'item_list.dart';

class ListWithoutShimmer extends StatelessWidget {
  final HomeController homeController;
  final ThemeData theme;
  final bool isLoading;

  const ListWithoutShimmer({
    Key? key,
    required this.homeController,
    required this.theme,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: homeController.searchPosts.length,
        itemBuilder: (context, index) => Obx(
          () => ItemList(
            title: homeController.searchPosts[index].title ?? '',
            subTitle:
                '${homeController.searchPosts[index].userId} - ${homeController.searchPosts[index].id}',
            completed: homeController.searchPosts[index].completed ?? false,
            mIndex: index,
            mTheme: theme,
            completedClick: () {
              homeController.toggleCompleted(index);
            },
            isLoading: isLoading,
          ),
        ),
      ),
    );
  }
}
