import 'package:flutter/material.dart';
import 'package:newsapp/common/app_images.dart';
import 'package:newsapp/common/widgets/custom_drawer.dart';
import 'package:newsapp/common/widgets/custom_search_bar.dart';
import 'package:newsapp/screens/categories/categories_view.dart';
import 'package:newsapp/screens/categories/models/category_model.dart';
import 'package:newsapp/screens/categories/widgets/search_screen.dart';
import 'package:newsapp/screens/categories/widgets/sources_widget.dart';
import 'package:newsapp/screens/settings/settings_view.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItems selectedView = DrawerItems.categories;
  CategoryModel? selectedCategory;
  bool isSearchClicked = false;
  bool finished = false;
  TextEditingController searchBarController = TextEditingController();
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
            title: selectedCategory != null && isSearchClicked
                ? CustomSearchBar(
                    controller: searchBarController,
                    closedClicked: () => setState(() {
                          isSearchClicked = false;
                        }),
                    searchClicked: () => setState(() {
                          isSearchClicked = true;
                          finished = true;
                        }))
                : selectedCategory != null
                    ? Text(selectedCategory?.title ?? "category")
                    : const Text("News App"),
            actions: [
              if (selectedCategory != null && !isSearchClicked)
                IconButton(
                    onPressed: () {
                      setState(() {
                        isSearchClicked = true;
                      });
                    },
                    icon: const Icon(Icons.search))
            ],
          ),
          body: selectedCategory != null
              ? isSearchClicked&& finished
                  ? SearchScreen(categoryId: selectedCategory?.id??"",searchText:searchBarController.text)
                  : SourcesWidget(
                      id: selectedCategory?.id ?? "", searching: true)
              : selectedView == DrawerItems.categories
                  ? CategoriesView(
                      onSelect: (p0) {
                        selectedCategory = p0;
                        setState(() {});
                      },
                    )
                  : const SettingsView()),
    ));
  }
}
