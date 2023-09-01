import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:share_plus/share_plus.dart';
import '../models/photo.dart';

class RowUserData extends StatelessWidget {
  final Photo photo;
  const RowUserData({super.key, required this.photo});

  void share(String url) {
    Share.share(url, subject: 'Nice picture');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(photo.user.profileImage.medium),
              radius: 25,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  photo.user.name,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 97, 97)),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${photo.user.totalPhotos} photos",
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
              onPressed: () {
                share(photo.downloadLinks.download.toString());
              },
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
              likeCount: photo.likes,
              countPostion: CountPostion.bottom,
            ),
          ],
        )
      ],
    );
  }
}
