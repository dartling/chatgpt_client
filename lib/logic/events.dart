import 'package:equatable/equatable.dart';

abstract class Events extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeModel extends Events {
  final String model;

  ChangeModel({required this.model});
}
