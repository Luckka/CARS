sealed class HomeEvent {}

class InitialEvent extends HomeEvent {

}

class GetCarsEvent extends HomeEvent{}

class SendLeadsEvent extends HomeEvent{
  final String username;

  SendLeadsEvent({required this.username});
}


