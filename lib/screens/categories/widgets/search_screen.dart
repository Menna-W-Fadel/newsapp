import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/providers/news_provider.dart';
import 'package:newsapp/common/widgets/error_widget.dart';
import 'package:newsapp/common/widgets/loading_widget.dart';
import 'package:newsapp/screens/categories/news_article_screen.dart';
import 'package:newsapp/screens/categories/news_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  final String categoryId;
  final String searchText;
  const SearchScreen(
      {super.key, required this.categoryId, required this.searchText});

  @override
  State<SearchScreen> createState() => _NewsListState();
}

class _NewsListState extends State<SearchScreen> {
  ScrollController scrollController = ScrollController();
  int pageNo = 1;
  late NewsProvider newsProvider;
  bool isLoadingMore = false;
  double previousOffset = 0;
  @override
  void initState() {
    super.initState();
    newsProvider = NewsProvider();
    newsProvider.searchNews(widget.categoryId, widget.searchText);
    scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    if (isLoadingMore) return;
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isLoadingMore) {
      setState(() {
        isLoadingMore = true;
        pageNo++;
        previousOffset = scrollController.offset;
      });
      await newsProvider
          .searchNews(widget.categoryId, widget.searchText)
          .then((_) {
        setState(() => isLoadingMore = false);
      });
      scrollController.jumpTo(previousOffset);
    }
  }

  @override
  void didUpdateWidget(covariant SearchScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    newsProvider.searchNews(widget.categoryId, widget.searchText);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: ListView(
        controller: scrollController,
        children: [
          ChangeNotifierProvider(
            create: (_) => newsProvider,
            child: Consumer<NewsProvider>(builder: (_, value, child) {
              return value.waiting
                  ? const LoadingWidget()
                  : value.errorMessage != null
                      ? CustomErrorWidget(
                          errorMessange:
                              value.errorMessage ?? "someThing went wrong")
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              value.news!.length + (isLoadingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == value.news!.length) {
                              return const LoadingWidget();
                            }
                            return GestureDetector(
                                onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NewsArticleScreen(
                                          articleDetails: value.news![index],
                                        ),
                                      ),
                                    ),
                                child: NewsCard(newsModel: value.news![index]));
                          });
            }),
          )
        ],
      ),
    );
  }
}
