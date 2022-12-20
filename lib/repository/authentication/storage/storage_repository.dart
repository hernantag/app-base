import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  Future getToken() {
    return SharedPreferences.getInstance().then((storage) {
      return storage.getString("token");
    });
  }

  setToken(String value) async {
    try {
      final instance = await SharedPreferences.getInstance();
      await instance.setString("token", value);
    } catch (e) {
      throw e;
    }
  }
}
