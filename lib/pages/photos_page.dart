import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_wall/services/api_service.dart';

import '../models/photo.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  String _currentItem = "Architecture";

  List<String> categories = [
    "Architecture",
    "Animals",
    "Nature",
    "Abstract",
    "Backgrounds",
    "Cityscapes",
    "Photography"
  ];

  late List<Photo>? photos = [];

  @override
  void initState() {
    super.initState();
    _getdata();
  }

  void _getdata() async {
    photos = (await ApiService().getPhotos(_currentItem))!;
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categories
                    .map((e) => Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _currentItem = e;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                                backgroundColor: _currentItem == e
                                    ? const Color(0xFFe1e1e1)
                                    : Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24))),
                            child: Text(
                              e,
                              style: const TextStyle(color: Color(0xFF232323)),
                            ),
                          ),
                        ))
                    .toList(),
              )),
          Expanded(
              child: MasonryGridView.builder(
            itemCount: photos!.length,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(photos![index].urls.regular)))),
          ))
        ],
      ),
    );
  }
}
