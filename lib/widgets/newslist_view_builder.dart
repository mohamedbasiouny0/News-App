import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test4/models/article_model.dart';
import 'package:test4/services/news_service.dart';
import 'package:test4/widgets/news_list_view.dart';
import 'package:test4/widgets/shimmer_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.cateory});
  final String cateory;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;

  @override
  void initState() {
    future = NewsService(dio: Dio()).getTopHeadlines(category: widget.cateory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapShots) {
        if (snapShots.hasData) {
          return NewsListView(artList: snapShots.data!);
        } else if (snapShots.hasError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text('There was an error', style: TextStyle(fontSize: 20)),
            ),
          );
        } else {
          return ShimmerListView();
        }
      },
    );
  }
}
