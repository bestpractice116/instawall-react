import 'package:http/http.dart' as http;
import 'package:insta_wall/services/api_constants.dart';
import '../models/main.dart';
import '../models/photo.dart';
import 'dart:developer' as developer;

class ApiService {
  Future<List<Photo>?> getPhotos(String category) async {
    try {
      var url = Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.photosEndpoint}?page=1&query=$category&client_id=${ApiConstants.apiKey}");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Main main = resultFromMap(response.body);
        List<Photo> photos = main.results;
        return photos;
      }
    } catch (e) {
      developer.log('Error fetching photos: $e', name: "ApiService");
    }

    return null;
  }
}
