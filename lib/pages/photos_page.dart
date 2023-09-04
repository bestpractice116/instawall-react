import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_wall/components/search_text_field.dart';
import '../models/photo.dart';
import '../services/api_service.dart';
import '../services/constants.dart';

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

  Future<void> _getdata() async {
    listPhoto = (await ApiService().getPhotos(_currentItem))!;
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
              child: RefreshIndicator(
                onRefresh: _getdata,
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
                                style:
                                    const TextStyle(color: Color(0xFF232323)),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )),
          Expanded(
              child: FutureBuilder(
            future: _getdata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFe1e1e1),
                  ),
                );
              } else {
                return MasonryGridView.builder(
                  itemCount: listPhoto!.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                  itemBuilder: ((context, index) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Constants.detailRoute,
                              arguments: listPhoto![index]);
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(listPhoto![index].urls.full)),
                      ))),
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
