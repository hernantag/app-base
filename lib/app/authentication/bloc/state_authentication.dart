import '../../../repository/user/models/model_user.dart';

abstract class AuthenticationState {}

class Authenticated extends AuthenticationState {
  Authenticated({required this.user});
  User user;
}

class Unauthenticated extends AuthenticationState {}

class Unknown extends AuthenticationState {}
