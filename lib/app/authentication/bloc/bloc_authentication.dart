import 'dart:async';

import 'package:app_base_v0/app/authentication/bloc/state_authentication.dart';
import 'package:app_base_v0/app/login/bloc/event_login.dart';
import 'package:app_base_v0/repository/authentication/authentication_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/user/models/model_user.dart';
import 'event_authentication.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(AuthenticationRepository authenticationRepository)
      : super(Unknown()) {
    on<StatusChanged>(_onStatusChange);
    on<LogoutRequest>(_logoutRequest, transformer: sequential());
    statusSubscription = authenticationRepository.status().listen((event) {
      return add(StatusChanged(status: event));
    });
  }

  late final StreamSubscription statusSubscription;
  @override
  Future<void> close() {
    return super.close();
  }

  _onStatusChange(StatusChanged event, Emitter<dynamic> emit) async {
    switch (event.status) {
      case "Unauthenticated":
        {
          emit(Unauthenticated());
          break;
        }
      case "Authenticated":
        {
          emit(Authenticated(user: User(id: "123")));
          break;
        }
      case "Unknown":
        {
          emit(Unknown());
          break;
        }
      default:
        print("ninguno ");
    }
  }

  _logoutRequest(LogoutRequest event, Emitter<dynamic> emitter) async {}
}
