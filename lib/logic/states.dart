import 'package:equatable/equatable.dart';

abstract class States extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends States {}

class ChangeModelState extends States {
  final String model;

  ChangeModelState({required this.model});
}

class LoadingState extends States {
  LoadingState();
}
