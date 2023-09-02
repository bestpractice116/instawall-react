import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/main.dart';
import '../../models/photo.dart';
import 'dart:developer' as developer;
import 'constants.dart';

class ApiService extends ChangeNotifier {
  Future<List<Photo>?> getPhotos(String category) async {
    try {
      var url = Uri.parse(
          "${Constants.baseUrl}${Constants.photosEndpoint}?page=1&query=$category&client_id=${Constants.apiKey}");
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
