import 'package:flutter/material.dart';
import 'package:newsapp/common/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/screens/categories/categories_card.dart';
import 'package:newsapp/screens/categories/models/category_model.dart';

class CategoriesView extends StatelessWidget {
  static String routeName = "categoriesScreen";
  const CategoriesView({required this.onSelect,super.key});
  final Function(CategoryModel) onSelect;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
          id: "1",
          imagePath: AppImages.ball,
          title: "Sports",
          containerColor: const Color(0xffC91C22)),
      CategoryModel(
          id: "2",
          imagePath: AppImages.politics,
          title: "Politics",
          containerColor: const Color(0xff003E90)),
      CategoryModel(
          id: "3",
          imagePath: AppImages.health,
          title: "Health",
          containerColor: const Color(0xffED1E79)),
      CategoryModel(
          id: "4",
          imagePath: AppImages.business,
          title: "Business",
          containerColor: const Color(0xffCF7E48)),
      CategoryModel(
          id: "5",
          imagePath: AppImages.enviroment,
          title: "Enviroment",
          containerColor: const Color(0xff4882CF)),
      CategoryModel(
          id: "6",
          imagePath: AppImages.science,
          title: "Science",
          containerColor: const Color(0xffF2D352)),
    ];
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 60.h),
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
                itemBuilder: (context, index) => GestureDetector(onTap: () => onSelect(categories[index]),
                  child: CategoriesCard(
                      index: index, categoryModel: categories[index]),
                ),
                itemCount: categories.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}