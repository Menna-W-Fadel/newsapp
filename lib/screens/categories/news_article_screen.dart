import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/app_colors.dart';

import 'package:newsapp/screens/categories/models/news_model/article.dart';

import 'package:newsapp/screens/categories/news_card.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsArticleScreen extends StatefulWidget {
  static const String routeName = "NewsArticleScreen";

  const NewsArticleScreen({
    required this.articleDetails,
    super.key,
  });
  final Article articleDetails;
  @override
  State<NewsArticleScreen> createState() => _NewsArticleScreenState();
}

class _NewsArticleScreenState extends State<NewsArticleScreen> {
  void _launchURL(Uri uri) async {
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    ModalRoute.of(context)!.settings.arguments as Article?;
    return Container(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/images/pattern.png")),
            color: Colors.white),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(widget.articleDetails.title ?? "news title"),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NewsCard(newsModel: widget.articleDetails),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  width: 360.w,
                  height: 200.h,
                  child: Text(
                    widget.articleDetails.description ?? "",
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 13.sp),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0, bottom: 10),
                      child: TextButton.icon(
                        onPressed: () => _launchURL(
                            Uri.parse(widget.articleDetails.url ?? '')),
                        label: Text(
                          "View Full Article",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14.sp),
                        ),
                        icon: const Icon(Icons.navigate_next_rounded),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                )
              ],
            ),
          ),
        ));
  }
}
