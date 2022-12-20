import 'package:app_base_v0/app/authentication/bloc/bloc_authentication.dart';
import 'package:app_base_v0/app/router/app_router.dart';
import 'package:app_base_v0/repository/authentication/authentication_repository.dart';
import 'package:app_base_v0/repository/authentication/storage/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthenticationRepository(),
      child: GetUserFromStorageWidget(),
    );
  }
}

/* class AuthenticationProviderWidget extends StatelessWidget {
  const AuthenticationProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
          authenticationRepository:
              RepositoryProvider.of<AuthenticationRepository>(context)),
      child: GetUserFromStorageWidget(),
    );
  }
} */

class GetUserFromStorageWidget extends StatelessWidget {
  const GetUserFromStorageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StorageRepository().getToken(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) {
              print("tiene data");
              return BlocProvider(
                  create: (context) => AuthenticationBloc(
                      authenticationRepository:
                          RepositoryProvider.of<AuthenticationRepository>(
                              context),
                      state: snapshot.data),
                  child: AppView());
            } else {
              print("nottiene data");
              return BlocProvider(
                  create: (context) => AuthenticationBloc(
                      authenticationRepository:
                          RepositoryProvider.of<AuthenticationRepository>(
                              context)),
                  child: AppView());
            }

          default:
            return Container();
        }
      },
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().appRouter(context),
    );
  }
}
