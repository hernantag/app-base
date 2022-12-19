import 'dart:async';

import 'package:app_base_v0/app/authentication/bloc/state_authentication.dart';

class AuthenticationRepository {
  final controller = StreamController<String>();

  Stream status() async* {
    yield "Unauthenticated";

    yield* controller.stream;
  }

  logIn() async {
    Future.delayed(Duration(seconds: 1));

    controller.add("Authenticated");
  }

  logOut() async {
    Future.delayed(Duration(seconds: 1));

    controller.add("Unauthenticated");
  }
}
