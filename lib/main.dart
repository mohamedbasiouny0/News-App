import 'package:flutter/material.dart';
import 'package:test4/views/home_view.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeView(), debugShowCheckedModeBanner: false);
  }
}
