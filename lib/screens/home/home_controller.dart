import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shrine_theme/services/api_service.dart';

import 'model/post.dart';

class HomeController extends GetxController {
  var posts = <Post>[].obs;
  var searchPosts = <Post>[].obs;
  var favPosts = <Post>[].obs;
  var isLoading = false.obs;
  var isSearch = false.obs;
  var isFav = false.obs;
  var searchController = TextEditingController();
  ApiService apiService = ApiService();

  @override
  void onInit() async {
    fetchPosts();
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading(true);
      var response = await apiService.getRequest('/todos');

      if (response != null) {
        var data =
            (response.data as List).map((item) => Post.fromJson(item)).toList();
        posts.assignAll(data);
        searchPosts.assignAll(data);
        isLoading(false);
      } else {
        debugPrint('Error nè');
      }
    } on Exception catch (e) {
      isLoading(false);
      debugPrint(e.toString());
    }
  }

  void toggleCompleted(int index) {
    searchPosts[index].completed = !searchPosts[index].completed!;
    searchPosts.refresh();
  }

  void sortListAToZ() {
    searchPosts.sort((a, b) {
      return a.title!.toLowerCase().compareTo(b.title!.toLowerCase());
    });
  }

  void sortListZToA() {
    searchPosts.sort((a, b) {
      return b.title!.toLowerCase().compareTo(a.title!.toLowerCase());
    });
  }

  void onlyFavorites() {
    var dataList = searchPosts.where((p0) => p0.completed! == true).toList();

    searchPosts.assignAll([]);
    searchPosts.assignAll(dataList);
  }

  void showAll() {
    isFav(false);
    searchPosts.assignAll([]);
    searchPosts.assignAll(posts);
  }

  void toggleSearch() {
    isSearch(!isSearch.value);
    if (!isSearch.value) {
      searchPosts.assignAll([]);
      searchPosts.assignAll(posts);
      searchPosts.refresh();
      searchController.text = '';
    }
  }

  void searchData(String val) {
    //var search = searchController.text;

    if (val.isNotEmpty) {
      for (var item in posts) {
        if (item.title!.contains(val)) {
          //searchPosts.assignAll([]);
          searchPosts.assign(item);
          searchPosts.refresh();
        }
      }
    } else {
      searchPosts.assignAll([]);
      searchPosts.assignAll(posts);
      searchPosts.refresh();
    }
  }

  Future<void> addPost() async {
    try {
      Map<String, dynamic> body = {'title': 'foo', 'body': 'bar', 'userId': 1};
      var response = await apiService.postRequest('/posts', body);

      if (response != null) {
        debugPrint(response.data.toString());
      } else {
        debugPrint('Error nè');
      }
    } catch (e) {
      rethrow;
    }
  }
}
