import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_colors.dart';
import 'package:newsapp/screens/categories/models/news_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  const NewsCard({required this.newsModel, super.key});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            newsModel.imagePath,
            height: 232.h,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            newsModel.company,
            style: TextStyle(color: AppColors.greyColor, fontSize: 12.sp),
          ),
          Text(
            newsModel.title,
            style: TextStyle(
                color: AppColors.blackTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              timeago.format(newsModel.publishedDate),
              style: TextStyle(
                color: AppColors.lightGreyColor,
                fontSize: 15.sp,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
