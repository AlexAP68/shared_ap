import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? _preferences;
  
  static const _keyCounter = 'counter';

  //Inicializamos las preferencias

  static Future init() async => _preferences = await SharedPreferences.getInstance();

//Guardamos el estado del contador
  static Future setCounter(int counter) async => await _preferences?.setInt(_keyCounter, counter);

//Recuperamos el estado del contador
  static int getCounter() => _preferences?.getInt(_keyCounter) ?? 0;
}
