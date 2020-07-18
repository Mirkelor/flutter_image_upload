import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class PickImageFailure extends Failure {}

class ServerFailure extends Failure {}
