import 'package:flutter/material.dart';
import 'package:test4/models/category_model.dart';
import 'package:test4/views/category_view.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              CategoryView(category: categoryModel.categoryName),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(right: 5),
        height: 90,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(categoryModel.imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          categoryModel.categoryName,

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
