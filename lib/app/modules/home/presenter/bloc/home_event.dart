sealed class HomeEvent {}

class InitialEvent extends HomeEvent {

}

class GetCarsEvent extends HomeEvent{}

class SendLeadsEvent extends HomeEvent{
  final String username;
  final String email;
  final String phone;

  SendLeadsEvent({required this.username, required this.email, required this.phone});
}


