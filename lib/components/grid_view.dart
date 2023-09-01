import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/photo.dart';

class CustomGridView extends StatelessWidget {
  final List<Photo>? photos;
  const CustomGridView({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: MasonryGridView.builder(
      itemCount: photos!.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
      itemBuilder: ((context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(photos![index].urls.regular)))),
    ));
  }
}
