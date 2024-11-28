import 'package:flutter/material.dart';
import 'package:newsapp/common/app_images.dart';
import 'package:newsapp/common/widgets/custom_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/screens/categories/categories_card.dart';
import 'package:newsapp/screens/categories/category_model.dart';

class CategoriesScreen extends StatelessWidget {
  static String routeName = "categoriesScreen";
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
          imagePath: AppImages.ball,
          title: "Sports",
          containerColor: Color(0xffC91C22)),
      CategoryModel(
          imagePath: AppImages.politics,
          title: "Politics",
          containerColor: Color(0xff003E90)),
      CategoryModel(
          imagePath: AppImages.health,
          title: "Health",
          containerColor: Color(0xffED1E79)),
      CategoryModel(
          imagePath: AppImages.business,
          title: "Business",
          containerColor: Color(0xffCF7E48)),
      CategoryModel(
          imagePath: AppImages.enviroment,
          title: "Enviroment",
          containerColor: Color(0xff4882CF)),
      CategoryModel(
          imagePath: AppImages.science,
          title: "Science",
          containerColor: Color(0xffF2D352)),
    ];
    return SafeArea(
        child: Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text("News App"), //TODO:localization
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 60.h),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.backgrounImage),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pick your Category\nof Interest",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 155.h,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 25.w,
                  ),
                  itemBuilder: (context, index) => CategoriesCard(
                      index: index, categoryModel: categories[index]),
                  itemCount: categories.length,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
