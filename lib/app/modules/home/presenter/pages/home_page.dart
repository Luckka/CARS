import 'dart:async';

import 'package:cars/app/modules/home/infra/mappers/lead_mapper.dart';
import 'package:cars/app/modules/home/presenter/bloc/home_bloc.dart';
import 'package:cars/app/modules/home/presenter/bloc/home_event.dart';
import 'package:cars/app/modules/home/presenter/bloc/home_state.dart';
import 'package:cars/app/modules/home/presenter/widgets/cars_widget.dart';
import 'package:cars/app/modules/home/presenter/widgets/text_form_field_widget.dart';
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
      child: Builder(
        builder: (context) => _buildPage(context),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final size = MediaQuery.of(context).size;

    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
          bloc: widget.homeBloc,
          builder: (context, state) {
            if (state is HomeStateInit) {
              Timer.periodic(const Duration(minutes: 1), (timer) {
                widget.homeBloc.add(PostLeadsEvent());
              });
              widget.homeBloc.add(GetCarsEvent());
            }

            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return state is HomeLoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                  child: Column(
                      children: [
                        SizedBox(height: 15),
                        Image.asset('assets/ws_work_logo.png'),
                        
                        Form(
                          key: _key,
                          child: SizedBox(
                            height: size.height,
                            child: ListView.builder(
                                itemCount: widget.homeBloc.listOffCars.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CarsWidget(
                                      ano: widget.homeBloc.listOffCars[index].ano,
                                      nomeModelo: widget
                                          .homeBloc.listOffCars[index].nomeModelo,
                                      numeroPortas: widget
                                          .homeBloc.listOffCars[index].numPortas,
                                      cor: widget.homeBloc.listOffCars[index].cor,
                                      valor: widget.homeBloc.listOffCars[index].valor,
                                      combustivel: widget
                                          .homeBloc.listOffCars[index].combustivel,
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: const Text(
                                                      'Preencha seus dados corretamente'),
                                                  content: SizedBox(
                                                    height: 230,
                                                    child: Column(
                                                      children: [
                                                        TextFormFieldWidget(
                                                            controller:
                                                                usernameController,
                                                            hintText: 'Nome Completo',
                                                            keyboardType: null,
                                                            validator: (value) {
                                                              if (value!.isEmpty) {
                                                                return 'Coloque um nome valido';
                                                              }
                                                              return null;
                                                            }),
                                                        SizedBox(height: 12),
                                                        TextFormFieldWidget(
                                                            controller:
                                                                phoneController,
                                                            hintText: 'Telefone',
                                                            keyboardType: null,
                                                            validator: (value) {
                                                              if (value!.isEmpty) {
                                                                return 'Coloque um telefone valido';
                                                              }
                                                              return null;
                                                            }),
                                                        SizedBox(height: 12),
                                                        TextFormFieldWidget(
                                                            controller:
                                                                emailController,
                                                            hintText: 'Email',
                                                            keyboardType: null,
                                                            validator: (value) {
                                                              if (value!.isEmpty) {
                                                                return 'Coloque um email valido';
                                                              }
                                                              return null;
                                                            }),
                                                        SizedBox(height: 12),
                                                        InkWell(
                                                          onTap: () {
                                                            if(_key.currentState!.validate()){
                                                              print('TEST');
                                                               widget.homeBloc.add(CreateLeadsEvent(
                                                                leadMapper: LeadMapper(
                                                                    email:
                                                                        emailController
                                                                            .text,
                                                                    username:
                                                                        usernameController
                                                                            .text,
                                                                    phone:
                                                                        phoneController
                                                                            .text,
                                                                    id: 0)));

                                                                Modular.to.pop();
                                                            }
                                                           
                                              
                                                    
                                                            
                                                          },
                                                          child: Container(
                                                            height: 50,
                                                            width: 150,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(20),
                                                                color: Colors.amber),
                                                            child: Center(
                                                                child: Text(
                                                              'Confirmar Compra',
                                                              style: TextStyle(
                                                                  color:
                                                                      Colors.black),
                                                            )),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                      },
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                );
          }),
    );
  }
}
