import 'package:cars/app/core/shared/app_routes.dart';
import 'package:cars/app/modules/home/domain/usecase/cars_usecase_impl.dart';
import 'package:cars/app/modules/home/external/cars_datasource_impl.dart';
import 'package:cars/app/modules/home/external/lead_datasource_impl.dart';
import 'package:cars/app/modules/home/infra/repository/cars_repository_impl.dart';
import 'package:cars/app/modules/home/presenter/bloc/home_bloc.dart';
import 'package:cars/app/modules/home/presenter/bloc/home_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/home_page.dart';

class HomeModule extends Module{
  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton((i) => LeadDatasourceImpl()),
    Bind.lazySingleton((i) => HomeBloc(carsUseCase: i(), leadDatasourceImpl: i())),
    Bind.lazySingleton((i) => Dio()),
    Bind.lazySingleton((i) => CarsDatasourceImpl(dio: i())),
    Bind.lazySingleton((i) => CarsRepositoryImpl(carsDatasource: i())),
    Bind.lazySingleton((i) => CarsUseCaseImpl(carsRepository: i()))
   

  ];


  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (args,context) => HomePage(homeBloc: Modular.get<HomeBloc>(),))
  ];
}