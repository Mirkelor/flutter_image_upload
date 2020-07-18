import 'package:flutter_image_upload/models/image.dart';

abstract class ImageRepository {
  Stream<List<Image>> imageList();
}
