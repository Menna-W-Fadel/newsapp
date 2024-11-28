import 'package:flutter/material.dart';
import 'package:newsapp/common/app_images.dart';
import 'package:newsapp/common/widgets/custom_drawer.dart';
import 'package:newsapp/screens/categories/categories_view.dart';
import 'package:newsapp/screens/categories/category_details_view.dart';
import 'package:newsapp/screens/categories/models/category_model.dart';
import 'package:newsapp/screens/settings/settings_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItems selectedView = DrawerItems.categories;
  CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(AppImages.backgrounImage), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: CustomDrawer(
            onSelect: (value) {
              selectedView = value;
              selectedCategory = null;
              setState(() {});
            },
          ),
          appBar: AppBar(
            title: selectedCategory != null
                ? Text(selectedCategory!.title)
                : selectedView == DrawerItems.settings
                    ? const Text("Settings") //TODO:localization
                    : const Text("News App"),
            actions: selectedCategory != null
                ? [
                    SizedBox(
                      width: 10.w,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                        )),
                    SizedBox(
                      width: 10.w,
                    )
                  ]
                : null,
          ),
          body: selectedCategory != null
              ? CategoryDetailsView(id: selectedCategory!.id)
              : selectedView == DrawerItems.categories
                  ? CategoriesView(
                      onSelect: (value) {
                        selectedCategory = value;
                        setState(() {});
                      },
                    )
                  : const SettingsView()),
    ));
  }
}
