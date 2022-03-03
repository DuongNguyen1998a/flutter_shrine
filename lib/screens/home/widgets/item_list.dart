import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ItemList extends StatelessWidget {
  final int mIndex;
  final String title;
  final String subTitle;
  final bool completed;
  final ThemeData mTheme;
  final Function completedClick;
  final bool isLoading;

  const ItemList({
    Key? key,
    required this.mIndex,
    required this.mTheme,
    required this.title,
    required this.subTitle,
    required this.completed,
    required this.completedClick,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.fromLTRB(16.0.w, 12.0.h, 16.0.w, 8.0.h),
      child: ListTile(
        title: !isLoading
            ? Text(
                '${mIndex + 1}. $title',
                style: mTheme.textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              )
            : Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 100.w,
                  height: 10.h,
                  color: Colors.white,
                ),
              ),
        subtitle: !isLoading
            ? Text(
                subTitle,
                style: mTheme.textTheme.subtitle1,
              )
            : Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 50.w,
                  height: 10.h,
                  color: Colors.white,
                ),
              ),
        trailing: !isLoading
            ? IconButton(
                onPressed: () {
                  completedClick();
                },
                icon: Icon(
                  Icons.favorite_outlined,
                  color: completed ? Colors.red : Colors.grey.withOpacity(0.6),
                ),
              )
            : Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
