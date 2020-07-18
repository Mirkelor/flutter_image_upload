part of 'image_bloc.dart';

@immutable
abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageLoaded extends ImageState {
  final List<Image> imageList;

  ImageLoaded(this.imageList);

  @override
  List<Object> get props => [imageList];
}

class ImageNotLoaded extends ImageState {}
