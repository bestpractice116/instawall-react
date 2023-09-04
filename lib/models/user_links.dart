import 'package:hive/hive.dart';
part 'user_links.g.dart';

@HiveType(typeId: 4)
class UserLinks {
  @HiveField(0)
  String following;
  @HiveField(1)
  String followers;

  UserLinks({
    required this.following,
    required this.followers,
  });

  factory UserLinks.fromMap(Map<String, dynamic> json) => UserLinks(
        following: json["following"] ?? "",
        followers: json["followers"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "following": following,
        "followers": followers,
      };
}
