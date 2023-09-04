import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:like_button/like_button.dart';
import '../models/photo.dart';

class RowUserData extends StatefulWidget {
  final Photo photo;
  const RowUserData({super.key, required this.photo});
  @override
  State<RowUserData> createState() => _RowUserDataState();
}

class _RowUserDataState extends State<RowUserData> {
  final _photoBox = Hive.box("photo_box");

  Future<bool> _like(Photo photo) async {
    if (_photoBox.get(photo.id) == null) {
      _photoBox.put(photo.id, photo);
      return true;
    }

    _photoBox.delete(photo.id);
    return false;
  }

  bool _isLiked(String id) {
    return _photoBox.get(id) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage(widget.photo.user.profileImage.medium),
              radius: 25,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.photo.user.name,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 97, 97)),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${widget.photo.user.totalPhotos} photos",
                  style: const TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 97, 97, 97)),
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.share_outlined,
                color: Color.fromARGB(255, 97, 97, 97),
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 15),
            IconButton(
              icon: const Icon(
                Icons.download,
                color: Color.fromARGB(255, 97, 97, 97),
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 15),
            LikeButton(
              size: 20,
              likeCount: widget.photo.likes,
              countPostion: CountPostion.bottom,
              isLiked: _isLiked(widget.photo.id),
              onTap: (isLiked) => _like(widget.photo),
            ),
          ],
        )
      ],
    );
  }
}
