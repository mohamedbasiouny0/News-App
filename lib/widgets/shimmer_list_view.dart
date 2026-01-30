import 'package:flutter/material.dart';
import 'package:test4/widgets/shimmer.dart';

class ShimmerListView extends StatelessWidget {
  const ShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => ShimmerWidget(),
      itemCount: 4,
    );
  }
}
