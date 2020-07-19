import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_upload/core/exceptions.dart';
import 'package:flutter_image_upload/core/failures.dart';
import 'package:flutter_image_upload/datasources/picked_image_local_data_source.dart';
import 'package:flutter_image_upload/datasources/picked_image_remote_data_source.dart';
import 'package:flutter_image_upload/models/picked_image.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@lazySingleton
class PickedImageRepository {
  final PickedImageLocalDataSource localDataSource;
  final PickedImageRemoteDataSource remoteDataSource;

  PickedImageRepository({
    @required this.localDataSource,
    @required this.remoteDataSource,
  });

  Stream<Either<Failure, List<PickedImage>>> pickedImageList() async* {
    try {
      final pickedImageList = await localDataSource.pickedImageList();
      yield Right(pickedImageList);
    } on PickedImageException {
      yield Left(PickImageFailure());
    }
  }

  Stream<PickedImage> _uploadPickedImage(PickedImage pickedImage) async* {
    StorageUploadTask task =
        remoteDataSource.uploadPickedImageToStorage(pickedImage);
    yield* remoteDataSource.uploadPickedImageToCloud(
        pickedImage, await task.onComplete);
  }

  Stream<PickedImage> uploadPickedImageList(
      List<PickedImage> pickedImageList) async* {
    for (PickedImage pickedImage in pickedImageList) {
      yield* _uploadPickedImage(pickedImage);
    }
  }
}
