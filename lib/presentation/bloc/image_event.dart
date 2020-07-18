part of 'image_bloc.dart';

@immutable
abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class LoadImage extends ImageEvent {}

class ImageListUpdated extends ImageEvent {
  final List<Image> imageList;

  const ImageListUpdated(this.imageList);

  @override
  List<Object> get props => [imageList];
}
