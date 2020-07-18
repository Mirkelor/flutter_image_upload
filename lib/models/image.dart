import 'package:flutter_image_upload/entities/image_entity.dart';
import 'package:meta/meta.dart';

@immutable
class Image {
  final String name;
  final String url;

  Image({
    this.name,
    this.url,
  });

  Image copyWith({String name, String url}) {
    return Image(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Image && name == other.name && url == other.url;

  ImageEntity toEntity() {
    return ImageEntity(
      name: name,
      url: url,
    );
  }

  static Image fromEntity(ImageEntity entity) {
    return Image(
      name: entity.name,
      url: entity.url,
    );
  }
}
