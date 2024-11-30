import 'package:flutter/material.dart';
import 'package:newsapp/api/api_services.dart';
import 'package:newsapp/common/widgets/error_widget.dart';
import 'package:newsapp/common/widgets/loading_widget.dart';
import 'package:newsapp/screens/categories/models/news_model/news_model.dart';
import 'package:newsapp/screens/categories/news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList({required this.sourceId, super.key});
  final String sourceId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              } else if (snapshot.hasError) {
                return CustomErrorWidget(errorMessange:snapshot.error.toString());
              }
        NewsModel? newsmodel = snapshot.data;
        var newsList = newsmodel?.articles ?? [];
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: newsList.length,
          itemBuilder: (context, index) => NewsCard(
            newsModel: newsList[index],
          ),
        );
      },
    );
  }
}
