import 'package:flutter/material.dart';
import 'package:test4/models/artical_model/article_model.dart';
import 'package:test4/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.artList});

  final List<ArticleModel> artList;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: artList.length,
      itemBuilder: (context, index) => NewsTile(articleModel: artList[index]),
    );
  }
}
