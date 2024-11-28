import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_colors.dart';
import 'package:newsapp/common/app_images.dart';
import 'package:newsapp/screens/categories/models/news_model.dart';
import 'package:newsapp/screens/categories/news_card.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({required this.id, super.key});
  final String id;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  List<NewsModel> newsList = List.generate(
      10,
      (index) => NewsModel(
          company: "BBC news",
          imagePath: AppImages.newsTest,
          id: index.toString(),
          title: "Why are football's biggest clubs starting a new tournament?",
          publishedDate: DateTime.now()));
  int selectedSubCategoryId = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 85.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              child: ChoiceChip(
                onSelected: (value) {
                  selectedSubCategoryId = index;
                  setState(() {});
                },
                label: Text("data$index"),
                labelStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: index == selectedSubCategoryId
                        ? AppColors.secondaryColor
                        : AppColors.primaryColor),
                selected: index == selectedSubCategoryId,
                showCheckmark: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                side: BorderSide(color: AppColors.primaryColor),
                selectedColor: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: newsList.length,
          itemBuilder: (context, index) => NewsCard(
            newsModel: newsList[index],
          ),
        )
      ],
    );
  }
}
