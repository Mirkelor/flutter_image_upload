import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'picked_image_status.dart';

class PickedImageEntity extends Equatable {
  final String name;
  final String path;
  final PickedImageStatus status;

  PickedImageEntity({
    this.name,
    this.path,
    this.status,
  });

  static PickedImageEntity fromFilePath(String path) {
    return PickedImageEntity(
      name: DateTime.now().toString(),
      path: path,
      status: PickedImageStatus.INITIAL,
    );
  }

  Map<String, Object> toDocument() {
    return {
      'name': name,
      'path': path,
      'status': status,
    };
  }

  @override
  String toString() {
    return 'PickedImageEntity { name: $name, path: $path, status: $status }';
  }

  @override
  List<Object> get props => [name, path, status];
}
