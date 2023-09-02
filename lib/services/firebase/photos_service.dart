import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_wall/models/photo.dart';

class PhotosService extends ChangeNotifier {
  // firestore instance
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // method to save or update like
  Future<void> like(Photo photo, bool isLiked) async {
    try {
      if (!isLiked) {
        await _firebaseFirestore
            .collection("photos")
            .doc(photo.id)
            .update({"isLike": isLiked});
      } else {
        await _firebaseFirestore.collection("photos").doc(photo.id).set({
          "id": photo.id,
          "url": photo.urls.full,
          "likes": photo.likes,
          "isLike": isLiked
        });
      }
    } on FirebaseException catch (e) {
      throw (e.code);
    }
  }
}
