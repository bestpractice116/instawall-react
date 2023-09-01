class Urls {
  String full;
  String regular;
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

class DownloadLinks {
  String download;
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
