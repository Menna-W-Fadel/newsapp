import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/providers/news_provider.dart';
import 'package:newsapp/common/widgets/error_widget.dart';
import 'package:newsapp/common/widgets/loading_widget.dart';
import 'package:newsapp/screens/categories/news_card.dart';
import 'package:newsapp/screens/categories/news_article_screen.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  final String sourceId;

  const NewsList({super.key, required this.sourceId});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  ScrollController scrollControlleroller = ScrollController();
  int pageNo = 1;
  bool isLoadingMore = false;
  late NewsProvider newsProvider;
  double previousOffset = 0;
  @override
  void initState() {
    super.initState();
    newsProvider = NewsProvider();
    newsProvider.getNews(widget.sourceId, 1);
    scrollControlleroller.addListener(_scrollController);
  }

  void _scrollController() async {
    if (isLoadingMore) return;
    if (scrollControlleroller.position.pixels ==
            scrollControlleroller.position.maxScrollExtent &&
        !isLoadingMore) {
      setState(() {
        isLoadingMore = true;
        pageNo++;
        previousOffset = scrollControlleroller.offset;
      });
      await newsProvider.getNews(widget.sourceId, pageNo).then((_) {
        setState(() => isLoadingMore = false);
      });
      scrollControlleroller.jumpTo(previousOffset);
    }
  }

  @override
  void didUpdateWidget(covariant NewsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    newsProvider.getNews(widget.sourceId, 1);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: ListView(
        controller: scrollControlleroller,
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
                              return const LoadingWidget(); // Show loading indicator at the bottom
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
