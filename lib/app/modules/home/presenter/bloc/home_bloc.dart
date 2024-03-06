import 'dart:async';

import 'package:cars/app/core/db/db.dart';
import 'package:cars/app/modules/home/domain/entity/cars_entity.dart';
import 'package:cars/app/modules/home/domain/usecase/cars_usecase.dart';
import 'package:cars/app/modules/home/domain/usecase/lead_usecase.dart';
import 'package:cars/app/modules/home/external/lead_datasource_impl.dart';
import 'package:cars/app/modules/home/presenter/bloc/home_event.dart';
import 'package:cars/app/modules/home/presenter/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc( {required this.carsUseCase, required this.leadDatasourceImpl, required this.leadUseCase,}) : super(HomeStateInit()) {
    on<InitialEvent>(_init);
    on<GetCarsEvent>(_getCarsEvent);
    on<CreateLeadsEvent>(_createLeadsEvent);
    on<PostLeadsEvent>(_postLeadsEvent);
  }

  final CarsUseCase carsUseCase;
  final LeadUseCase leadUseCase;
  final LeadDatasourceImpl leadDatasourceImpl;
   List<CarsEntity> listOffCars = [];

  void _init(InitialEvent event, Emitter<HomeState> emit) async {
    
     emit(HomeStateInit());
    add(GetCarsEvent());

  }

  Future<void> _getCarsEvent(GetCarsEvent event, Emitter<HomeState> emit) async{

     emit(HomeLoadingState());

    await SqFliteDb.sqFliteDb.database;
  
     
    var result = await leadDatasourceImpl.db.rawQuery("select * from lead");

   
     

    
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

  Future<void> _createLeadsEvent(CreateLeadsEvent event, Emitter<HomeState> emit) async{

      

      await leadDatasourceImpl.setDateUsers(event.leadMapper);

     

      var result = await leadDatasourceImpl.db.rawQuery("select * from lead");

     
     

  }

  Future<void> _postLeadsEvent(PostLeadsEvent event, Emitter<HomeState> emit) async{

       await leadUseCase.call();
  }
}
