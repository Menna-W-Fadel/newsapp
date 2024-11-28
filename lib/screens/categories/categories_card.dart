import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/screens/categories/models/category_model.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard(
      {required this.index, required this.categoryModel, super.key});
  final CategoryModel categoryModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: categoryModel.containerColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(25),
              bottomLeft:
                  index.isEven ? const Radius.circular(25) : const Radius.circular(0),
              bottomRight:
                  index.isOdd ? const Radius.circular(25) : const Radius.circular(0),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              categoryModel.imagePath,
              height: 100.h,
              fit: BoxFit.contain,
            ),
            Text(
              categoryModel.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
