class User {
  String id;
  String username;
  String name;
  String bio;
  String location;
  UserLinks links;
  ProfileImage profileImage;
  int totalCollections;
  int totalLikes;
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

class UserLinks {
  String following;
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

class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromMap(Map<String, dynamic> json) => ProfileImage(
        small: json["small"] ?? "",
        medium: json["medium"] ?? "",
        large: json["large"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}
