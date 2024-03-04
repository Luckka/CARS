import 'dart:async';

import 'package:cars/app/modules/home/domain/usecase/cars_usecase.dart';
import 'package:cars/app/modules/home/presenter/bloc/home_event.dart';
import 'package:cars/app/modules/home/presenter/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc(super.initialState, {required this.carsUseCase}){
    on<InitialEvent>(_init);
  }

  final CarsUseCase carsUseCase;

  Future<void> _init(InitialEvent event, Emitter<HomeState> emit) async{

      emit(state.clone());

  }

  
}