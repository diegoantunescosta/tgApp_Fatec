import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  save(Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    data.forEach((key, value) {
      (value is Map)
          ? value.forEach((key, value) {
              prefs.setString(key, value.toString());
            })
          : prefs.setString(key, value.toString());
    });
    print("Executou salvar os dados");
  }

  Future<String> getIfExists(String keyName) async {
    var data = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getKeys().contains(keyName)) data = prefs.getString(keyName);
    print("Executou pegar os dados");
    return data;
  }

  delete(List<String> keys) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    keys.forEach((keyDesc) {
      prefs.remove(keyDesc);
    });
  }
}
