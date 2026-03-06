import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test4/cubit/get_news_cubit.dart';
import 'package:test4/views/home_view.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNewsCubit(),
      child: MaterialApp(home: HomeView(), debugShowCheckedModeBanner: false),
    );
  }
}
