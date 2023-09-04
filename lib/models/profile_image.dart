import 'package:hive/hive.dart';
part 'profile_image.g.dart';

@HiveType(typeId: 5)
class ProfileImage {
  @HiveField(0)
  String small;

  @HiveField(1)
  String medium;

  @HiveField(2)
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
