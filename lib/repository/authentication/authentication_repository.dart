import 'dart:async';
import 'package:app_base_v0/repository/authentication/models/response_create_token.dart';
import 'package:app_base_v0/repository/authentication/storage/storage_repository.dart';
import 'package:dio/dio.dart';

import 'package:app_base_v0/app/authentication/bloc/state_authentication.dart';

class AuthenticationRepository {
  final controller = StreamController<String>();

  Stream status() async* {
    yield "Unauthenticated";

    yield* controller.stream;
  }

  logIn() async {
    print("inside");
    Dio dio = Dio();
    /* dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Accept"] = "application/json"; */

    try {
      var response = await dio.post(
          "https://desarrollo.macamedia.com.ar/siprocapi/api/login",
          data: {"email": "superadmin1@yopmail.com", "password": "1234"});

      final substring = (response.data.toString())
          .substring(1, response.data.toString().length - 1);
      print(substring);
      final parsedResponse =
          CreateTokenResponse.fromJson(response.data.toString());

      try {
        print("no entramos");
        await StorageRepository()
            .setToken(parsedResponse.datos.datos.accessToken);
      } catch (e) {
        print("error");
      }
    } catch (e) {
      print(e);
    }
    controller.add("Authenticated");
  }

  logOut() async {
    await Future.delayed(Duration(seconds: 2));

    controller.add("Unauthenticated");
  }
}
