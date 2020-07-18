import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String name;
  final String url;

  ImageEntity({
    this.name,
    this.url,
  });

  static ImageEntity fromSnapshot(DocumentSnapshot snap) {
    return ImageEntity(
      name: snap.data['name'],
      url: snap.data['url'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'name': name,
      'url': url,
    };
  }

  @override
  String toString() {
    return 'ImageEntity { name: $name, url: $url }';
  }

  @override
  List<Object> get props => [name, url];
}
