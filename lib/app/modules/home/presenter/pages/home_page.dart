import 'package:cars/app/modules/home/presenter/bloc/home_bloc.dart';
import 'package:cars/app/modules/home/presenter/bloc/home_event.dart';
import 'package:cars/app/modules/home/presenter/bloc/home_state.dart';
import 'package:cars/app/modules/home/presenter/widgets/cars_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final HomeBloc homeBloc;
  const HomePage({super.key, required this.homeBloc});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => widget.homeBloc..add(InitialEvent()),
      child: Builder(builder: (context) => _buildPage(context),),

    );
  }

  Widget _buildPage(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
          bloc: widget.homeBloc,
          builder: (context, state) {
            
            if(state is HomeStateInit){
              widget.homeBloc.add(GetCarsEvent());
            }

            if(state is HomeLoadingState){
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return state is HomeLoadingState ? const Center(child: CircularProgressIndicator(),): ListView.builder(
              itemCount: widget.homeBloc.listOffCars.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarsWidget(ano: widget.homeBloc.listOffCars[index].ano, nomeModelo: widget.homeBloc.listOffCars[index].nomeModelo, numeroPortas: widget.homeBloc.listOffCars[index].numPortas, cor: widget.homeBloc.listOffCars[index].cor, valor: widget.homeBloc.listOffCars[index].valor, combustivel: widget.homeBloc.listOffCars[index].combustivel),
                );
              }
            );
          }),
    );
  }

}
