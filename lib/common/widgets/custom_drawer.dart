import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({required this.onSelect, super.key});
  final Function(DrawerItems) onSelect;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350.w,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 200.h,
            color: AppColors.primaryColor,
            child: Text(
              "News App!", 
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ListTile(
            onTap: () {
              onSelect(DrawerItems.categories);
              Navigator.of(context).pop();
            },
            leading: const Icon(
              Icons.list,
              size: 25,
            ),
            title: Text(
              "Categories", 
              style: TextStyle(fontSize: 22.sp),
            ),
          ),
          ListTile(
            onTap: () {
              onSelect(DrawerItems.settings);
              Navigator.of(context).pop();
            },
            leading: const Icon(
              Icons.settings,
              size: 25,
            ),
            title: Text(
              "Settings", 
              style: TextStyle(fontSize: 22.sp),
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerItems { settings, categories }
