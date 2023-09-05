import 'dart:convert';
import 'dart:developer';

import 'package:chatgpt_client/logic/events.dart';
import 'package:chatgpt_client/logic/states.dart';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

class ProductBloc extends Bloc<Events, States> {
  ProductBloc() : super(InitialState()) {
    on<ChangeModel>((event, emit) {
      try {
        String model;
        emit(ChangeModelState(model: event.model));
      } catch (e) {
        log("Change Model :: $e");
      }
    });
  }
}
