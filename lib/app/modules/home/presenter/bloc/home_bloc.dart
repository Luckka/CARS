import 'dart:async';

import 'package:cars/app/modules/home/domain/entity/cars_entity.dart';
import 'package:cars/app/modules/home/domain/usecase/cars_usecase.dart';
import 'package:cars/app/modules/home/presenter/bloc/home_event.dart';
import 'package:cars/app/modules/home/presenter/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.carsUseCase}) : super(HomeStateInit()) {
    on<InitialEvent>(_init);
    on<GetCarsEvent>(_getCarsEvent);
  }

  final CarsUseCase carsUseCase;
   List<CarsEntity> listOffCars = [];

  void _init(InitialEvent event, Emitter<HomeState> emit) async {
    
     emit(HomeStateInit());
    add(GetCarsEvent());

    
    
    
  }

  Future<void> _getCarsEvent(GetCarsEvent event, Emitter<HomeState> emit) async{

     emit(HomeLoadingState());

    print('TEST');

    
    var listOfCars = await carsUseCase.call();

    listOfCars.fold(
    ifLeft: (l) {
       print(l.message);
    },
    ifRight: (r) {
      print('TEST: ${r[0].timestampCadastro}');
      	listOffCars = r;
    });

   emit(HomeGetCarsState());



  }
}
