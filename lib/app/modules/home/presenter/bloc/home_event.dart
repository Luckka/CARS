import 'package:cars/app/modules/home/infra/mappers/lead_mapper.dart';

sealed class HomeEvent {}

class InitialEvent extends HomeEvent {

}

class GetCarsEvent extends HomeEvent{}

class CreateLeadsEvent extends HomeEvent{

  final LeadMapper leadMapper;

  CreateLeadsEvent({required this.leadMapper, });
}

class PostLeadsEvent extends HomeEvent{}


