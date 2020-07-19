import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_upload/core/exceptions.dart';
import 'package:flutter_image_upload/entities/picked_image_entity.dart';
import 'package:flutter_image_upload/models/picked_image.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PickedImageLocalDataSource {
  FileType _pickingType = FileType.image;

  Future<List<PickedImage>> pickedImageList() async {
    try {
      List<PickedImage> pickedImageList =
          (await FilePicker.getMultiFilePath(type: _pickingType))
              ?.values
              ?.map((path) =>
                  PickedImage.fromEntity(PickedImageEntity.fromFilePath(path)))
              ?.toList();
      return pickedImageList;
    } on Exception {
      throw PickedImageException();
    }
  }
}
