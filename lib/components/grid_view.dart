import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/photo.dart';
import '../services/unsplash/constants.dart';

class CustomGridView extends StatelessWidget {
  final List<Photo>? photos;
  const CustomGridView({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    if (photos!.isEmpty) {
      return const SpinKitRotatingCircle(
        color: Color(0xFFe1e1e1),
        size: 70,
      );
    }
    return Expanded(
        child: MasonryGridView.builder(
      itemCount: photos!.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
      itemBuilder: ((context, index) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Constants.detailRoute,
                  arguments: photos![index]);
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(photos![index].urls.full)),
          ))),
    ));
  }
}
