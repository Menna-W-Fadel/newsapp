import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_colors.dart';
import 'package:newsapp/common/app_images.dart';

import 'package:newsapp/screens/categories/models/news_model/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  const NewsCard({required this.newsModel, super.key});
  final Article newsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            errorBuilder: (context, error, stackTrace) => Image.asset(
              AppImages.noImage,
              height: 232.h,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            newsModel.urlToImage ?? "",
            height: 232.h,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            newsModel.author ?? "",
            style: TextStyle(color: AppColors.greyColor, fontSize: 12.sp),
          ),
          Text(
            newsModel.title ?? "",
            style: TextStyle(
                color: AppColors.blackTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          if (newsModel.publishedAt != null)
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                timeago.format(DateTime.parse(newsModel.publishedAt ?? "")),
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
