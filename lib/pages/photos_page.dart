import 'package:flutter/material.dart';
import 'package:insta_wall/components/search_text_field.dart';
import '../components/grid_view.dart';
import '../models/photo.dart';
import '../services/unsplash/api_service.dart';

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
    "Background",
    "Cityscape",
    "Photography"
  ];

  late List<Photo>? listPhoto = [];

  @override
  void initState() {
    super.initState();
    _getdata();
  }

  void _getdata() async {
    listPhoto = (await ApiService().getPhotos(_currentItem))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
            child: SearchTextField(
              controller: searchController,
              hint: 'Search',
              icon: const Icon(
                Icons.search,
                color: Color(0xFFbcbcbc),
              ),
              onSubmitted: (val) {
                setState(() {
                  _currentItem = val;
                });
                _getdata();
              },
            ),
          ),
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
                              _getdata();
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
          CustomGridView(photos: listPhoto)
        ],
      ),
    );
  }
}
