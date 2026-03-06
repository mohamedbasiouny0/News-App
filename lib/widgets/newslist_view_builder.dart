import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test4/cubit/get_news_cubit.dart';
import 'package:test4/widgets/error_widget.dart';
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
    BlocProvider.of<GetNewsCubit>(
      context,
    ).getNewsFunction(category: widget.cateory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is GetNewsSuccess) {
          return NewsListView(artList: state.articalList);
        }
        if (state is GetNewsLFailure) {
          return ErrorMessageWidget(message: state.errorMessage);
        } else {
          return ShimmerListView();
        }
      },
    );
  }
}
