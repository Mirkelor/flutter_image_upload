import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_image_upload/core/constants.dart';
import 'package:flutter_image_upload/entities/image_entity.dart';
import 'package:flutter_image_upload/models/image.dart';
import 'package:flutter_image_upload/repositories/image_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ImageRepository)
class FirebaseImageRepository implements ImageRepository {
  final imageCollection = Firestore.instance
      .collection(PARENT_COLLECTION)
      .document(SUB_COLLECTION)
      .collection(REALTY);

  @override
  Stream<List<Image>> imageList() {
    return imageCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Image.fromEntity(ImageEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}
