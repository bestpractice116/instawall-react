import 'package:hive/hive.dart';
part 'download_links.g.dart';

@HiveType(typeId: 2)
class DownloadLinks {
  @HiveField(0)
  String download;

  @HiveField(1)
  String downloadLocation;

  DownloadLinks({
    required this.download,
    required this.downloadLocation,
  });

  factory DownloadLinks.fromMap(Map<String, dynamic> json) => DownloadLinks(
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toMap() => {
        "download": download,
        "download_location": downloadLocation,
      };
}
