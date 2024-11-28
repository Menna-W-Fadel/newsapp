import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350.w,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 200.h,
            color: AppColors.primaryColor,
            child: Text(
              "News App!", //TODO:localization
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.list,
              size: 25,
            ),
            title: Text(
              "Categories", //TODO:localization
              style: TextStyle(fontSize: 22.sp),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 25,
            ),
            title: Text(
              "Settings", //TODO:localization
              style: TextStyle(fontSize: 22.sp),
            ),
          ),
        ],
      ),
    );
  }
}
