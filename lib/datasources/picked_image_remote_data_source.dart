import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_upload/core/constants.dart';
import 'package:flutter_image_upload/core/exceptions.dart';
import 'package:flutter_image_upload/entities/picked_image_entity.dart';
import 'package:flutter_image_upload/entities/picked_image_status.dart';
import 'package:flutter_image_upload/models/picked_image.dart';

class PickedImageRemoteDataSource {
  final FirebaseStorage _storage = FirebaseStorage(
      storageBucket: 'gs://flutter-image-upload-dc0bc.appspot.com');
  final Firestore _firestore = Firestore.instance;

  StorageUploadTask uploadPickedImageToStorage(PickedImage pickedImage) {
    PickedImageEntity entity = PickedImageEntity.fromFilePath(pickedImage.path);
    File file = File(entity.path);
    String extension = entity.path.substring(entity.path.lastIndexOf('.'));
    String filePath = 'images/$REALTY/${entity.name}$extension';
    try {
      return _storage.ref().child(filePath).putFile(file);
    } on Exception {
      throw ServerException();
    }
  }

  Stream<PickedImage> uploadPickedImageToCloud(
      PickedImage pickedImage, StorageTaskSnapshot snapshot) async* {
    try {
      yield pickedImage.copyWith(status: PickedImageStatus.IN_PROGRESS);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      _firestore
          .collection(PARENT_COLLECTION)
          .document(SUB_COLLECTION)
          .collection(REALTY)
          .document(pickedImage.name)
          .setData({"url": downloadUrl, "name": pickedImage.name});
      yield pickedImage.copyWith(status: PickedImageStatus.SUCCESS);
    } on Exception {
      yield pickedImage.copyWith(status: PickedImageStatus.FAIL);
      throw ServerException();
    }
  }
}
