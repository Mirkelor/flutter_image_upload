part of 'picked_image_bloc.dart';

abstract class PickedImageState extends Equatable {
  const PickedImageState();

  @override
  List<Object> get props => [];
}

class PickedImageEmpty extends PickedImageState {}

class PickedImageLoading extends PickedImageState {}

class PickedImageLoaded extends PickedImageState {
  final List<PickedImage> pickedImageList;

  const PickedImageLoaded(this.pickedImageList);

  @override
  List<Object> get props => [pickedImageList];
}

class PickedImageError extends PickedImageState {
  final String message;

  const PickedImageError({@required this.message});

  @override
  List<Object> get props => [message];
}
