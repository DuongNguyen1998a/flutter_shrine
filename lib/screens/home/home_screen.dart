import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shrine_theme/screens/home/widgets/list_shimmer.dart';
import 'package:shrine_theme/screens/home/widgets/list_without_shimmer.dart';

// Controllers
import '../home/home_controller.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());;

    // Override theme
    final ThemeData theme = Theme.of(context);
    // config my app bar in home screen
    AppBar mAppBar = AppBar(
      elevation: 0.0,
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: const Icon(Icons.menu),
      // ),
      title: Obx(
        () => homeController.isSearch.value
            ? ListTile(
                leading: const Icon(
                  Icons.search,
                ),
                title: TextField(
                  controller: homeController.searchController,
                  onChanged: (val) {
                    // homeController.searchController.text = val;
                    homeController.searchData(val);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search data ...',
                    border: InputBorder.none,
                  ),
                ),
              )
            : const Text('SHRINE'),
      ),
      actions: [
        Obx(
          () => IconButton(
            onPressed: () {
              homeController.toggleSearch();
            },
            icon: homeController.isSearch.value
                ? const Icon(Icons.cancel_outlined)
                : const Icon(Icons.search),
          ),
        ),
        IconButton(
          onPressed: () {
            showMenu(
              context: context,
              position: const RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
              items: [
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Sort by asc'),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text('Sort by desc'),
                ),
                const PopupMenuItem<int>(
                  value: 3,
                  child: Text('Only favorites'),
                ),
                const PopupMenuItem<int>(
                  value: 4,
                  child: Text('Show all'),
                ),
                const PopupMenuItem<int>(
                  value: 5,
                  child: Text('Add Post'),
                ),
              ],
            ).then((value) {
              if (value == null) {
                return;
              } else if (value == 1) {
                homeController.sortListAToZ();
              } else if (value == 2) {
                homeController.sortListZToA();
              }
              else if (value == 3) {
                homeController.onlyFavorites();
              }
              else if (value == 4) {
                homeController.showAll();
              }
              else if (value == 5) {
                homeController.addPost();
              }
            });
          },
          icon: const Icon(Icons.tune),
        ),
      ],
    );

    return Scaffold(
      appBar: mAppBar,
      body: SafeArea(
        child: Obx(
          () => homeController.isLoading.value
              ? ListShimmer(
                  theme: theme,
                  isLoading: homeController.isLoading.value,
                )
              : RefreshIndicator(
                  onRefresh: homeController.fetchPosts,
                  child: ListWithoutShimmer(
                    homeController: homeController,
                    theme: theme,
                    isLoading: homeController.isLoading.value,
                  ),
                ),
        ),
      ),
      drawer: AppDrawer(theme: theme,),
    );
  }
}
