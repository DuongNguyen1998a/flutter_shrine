import 'package:flutter/material.dart';

import 'item_list.dart';

class ListShimmer extends StatelessWidget {
  final ThemeData theme;
  final bool isLoading;

  const ListShimmer({
    Key? key,
    required this.theme,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => ItemList(
        title: '',
        subTitle: '',
        completed: false,
        mIndex: index,
        mTheme: theme,
        completedClick: () {},
        isLoading: isLoading,
      ),
    );
  }
}
