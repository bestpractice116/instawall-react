import 'package:hive/hive.dart';

part 'url.g.dart';

@HiveType(typeId: 1)
class Urls {
  @HiveField(0)
  String full;

  @HiveField(1)
  String regular;
  
  @HiveField(2)
  String small;


  Urls({
    required this.full,
    required this.regular,
    required this.small,
  });

  factory Urls.fromMap(Map<String, dynamic> json) => Urls(
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
      );

  Map<String, dynamic> toMap() => {
        "full": full,
        "regular": regular,
        "small": small,
      };
}

