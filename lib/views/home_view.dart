import 'package:flutter/material.dart';
import 'package:test4/models/category_model.dart';
import 'package:test4/widgets/category_list_view.dart';

import 'package:test4/widgets/newslist_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final List<CategoryModel> categoryList = const [
    CategoryModel(imagePath: 'assets/business.avif', categoryName: 'Business'),
    CategoryModel(
      imagePath: 'assets/entertainment.avif',
      categoryName: 'Entertainment',
    ),
    CategoryModel(imagePath: 'assets/health.avif', categoryName: 'Health'),
    CategoryModel(imagePath: 'assets/science.avif', categoryName: 'Science'),
    CategoryModel(imagePath: 'assets/sports.avif', categoryName: 'Sports'),
    CategoryModel(
      imagePath: 'assets/technology.jpeg',
      categoryName: 'Technology',
    ),
    CategoryModel(imagePath: 'assets/general.avif', categoryName: 'General'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          CategoryListView(categoryListtt: categoryList),

          NewsListViewBuilder(cateory: 'general'),
        ],
      ),
    );
  }
}
