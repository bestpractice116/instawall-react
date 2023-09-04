import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/photo.dart';
import '../services/constants.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _photoBox = Hive.box("photo_box");
  late List<Photo> listPhoto = [];

  void _getLikedPhotos() {
    listPhoto = _photoBox.values.toList().cast<Photo>();
  }

  @override
  void initState() {
    super.initState();
    _getLikedPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      height: double.infinity,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ListView.builder(
            itemCount: listPhoto.length,
            itemBuilder: (context, index) {
              return Stack(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Constants.detailRoute,
                        arguments: listPhoto[index]);
                  },
                  child: Image.network(
                    listPhoto[index].urls.full,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    listPhoto[index].user.name,
                    style: const TextStyle(
                        color: Color(0xFFf5f5f5),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ))
              ]);
            }),
      ),
    );
  }
}
