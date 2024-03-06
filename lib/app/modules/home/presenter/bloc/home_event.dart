sealed class HomeEvent {}

class InitialEvent extends HomeEvent {

}

class GetCarsEvent extends HomeEvent{}

class CreateLeadsEvent extends HomeEvent{
  final String username;
  final String email;
  final String phone;

  CreateLeadsEvent({required this.username, required this.email, required this.phone});
}

class PostLeadsEvent extends HomeEvent{}


