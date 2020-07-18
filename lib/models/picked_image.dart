import 'package:flutter_image_upload/entities/picked_image_entity.dart';
import 'package:flutter_image_upload/entities/picked_image_status.dart';

class PickedImage {
  final String name;
  final String path;
  final PickedImageStatus status;

  PickedImage({
    this.name,
    this.path,
    this.status,
  });

  PickedImage copyWith({String name, String path, PickedImageStatus status}) {
    return PickedImage(
      name: name ?? this.name,
      path: path ?? this.path,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'PickedImage { name: $name, path: $path, status: $status }';
  }

  @override
  int get hashCode => name.hashCode ^ path.hashCode ^ status.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PickedImage &&
          name == other.name &&
          path == other.path &&
          status == other.status;

  PickedImageEntity toEntity() {
    return PickedImageEntity(
      name: name,
      path: path,
      status: status,
    );
  }

  static PickedImage fromEntity(PickedImageEntity entity) {
    return PickedImage(
      name: entity.name,
      path: entity.path,
      status: entity.status,
    );
  }
}
