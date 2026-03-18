import 'package:flutter/material.dart';
import 'package:test4/widgets/newslist_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(category, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: CustomScrollView(slivers: [NewsListViewBuilder(cateory: category)]),
    );
  }
}
