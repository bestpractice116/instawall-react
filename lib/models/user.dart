import 'package:hive/hive.dart';
import 'profile_image.dart';
import 'user_links.dart';
part 'user.g.dart';

@HiveType(typeId: 3)
class User {
  @HiveField(0)
  String id;

  @HiveField(1)
  String username;

  @HiveField(2)
  String name;

  @HiveField(3)
  String bio;

  @HiveField(4)
  String location;

  @HiveField(5)
  UserLinks links;

  @HiveField(6)
  ProfileImage profileImage;

  @HiveField(7)
  int totalCollections;

  @HiveField(8)
  int totalLikes;

  @HiveField(9)
  int totalPhotos;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.bio,
    required this.location,
    required this.links,
    required this.profileImage,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"] ?? "",
        name: json["name"] ?? "",
        bio: json["bio"] ?? "",
        location: json["location"] ?? "",
        links: UserLinks.fromMap(json["links"]),
        profileImage: ProfileImage.fromMap(json["profile_image"]),
        totalCollections: json["total_collections"] ?? 0,
        totalLikes: json["total_likes"] ?? 0,
        totalPhotos: json["total_photos"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "name": name,
        "bio": bio,
        "location": location,
        "links": links.toMap(),
        "profile_image": profileImage.toMap(),
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
      };
}
