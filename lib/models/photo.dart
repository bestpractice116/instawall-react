import 'package:hive/hive.dart';

import 'url.dart';
import 'user.dart';
part 'photo.g.dart';

@HiveType(typeId: 0)
class Photo extends HiveObject{
  @HiveField(0)
  String id;
  
  @HiveField(1)
  DateTime createdAt;
  
  @HiveField(2)
  String altDescription;
  
  @HiveField(3)
  Urls urls;
  
  @HiveField(4)
  DownloadLinks downloadLinks;
  
  @HiveField(5)
  int likes;

  @HiveField(6)
  User user;

  Photo({
    required this.id,
    required this.createdAt,
    required this.altDescription,
    required this.urls,
    required this.downloadLinks,
    required this.likes,
    required this.user,
  });

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        altDescription: json["alt_description"],
        urls: Urls.fromMap(json["urls"]),
        downloadLinks: DownloadLinks.fromMap(json["links"]),
        likes: json["likes"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "alt_description": altDescription,
        "urls": urls.toMap(),
        "downloadLinks": downloadLinks.toMap(),
        "likes": likes,
        "user": user.toMap(),
      };
}
