import 'package:flutter/material.dart';
import 'package:test4/models/category_model.dart';
import 'package:test4/widgets/caregory_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key, required this.categoryListtt});

  final List<CategoryModel> categoryListtt;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryListtt.length,
            itemBuilder: (context, index) =>
                CategoryItem(categoryModel: categoryListtt[index]),
          ),
        ),
      ),
    );
  }
}
