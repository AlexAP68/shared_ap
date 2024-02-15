import 'package:flutter/material.dart';
import 'package:shared_ap/Preferences/preferences.dart'; 
import 'package:shared_ap/screen/myhomepage.dart';

//Async para que se ejecute antes de que se inicie la app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba simple de Shared Preferences by Alex Alameda Petersen',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        
      ),
      home: const MyHomePage(title: 'Prueba simple de SP by Alex AP'),
    );
  }
}
