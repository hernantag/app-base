import 'package:app_base_v0/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  /* WidgetsFlutterBinding.ensureInitialized();
  final instance = await SharedPreferences.getInstance();
  instance.setString("token", "asd");

  final a = await SharedPreferences.getInstance();
  final valor = await a.containsKey("token");
  print(valor); */
  runApp(App());
}
