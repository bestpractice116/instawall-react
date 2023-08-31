import 'url.dart';
import 'user.dart';

class Photo {
  String id;
  DateTime createdAt;
  String altDescription;
  Urls urls;
  DownloadLinks downloadLinks;
  int likes;
  // User user;

  Photo({
    required this.id,
    required this.createdAt,
    required this.altDescription,
    required this.urls,
    required this.downloadLinks,
    required this.likes,
    // required this.user,
  });

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        altDescription: json["alt_description"],
        urls: Urls.fromMap(json["urls"]),
        downloadLinks: DownloadLinks.fromMap(json["links"]),
        likes: json["likes"],
        // user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "alt_description": altDescription,
        "urls": urls.toMap(),
        "downloadLinks": downloadLinks.toMap(),
        "likes": likes,
        // "user": user.toMap(),
      };
}
