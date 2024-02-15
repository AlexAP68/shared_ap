import 'package:flutter/material.dart';
import 'package:shared_ap/Preferences/preferences.dart'; // Ensure this path matches your project structure
import 'package:shared_ap/screen/myhomepage.dart';


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
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // Use Material 3 features
        useMaterial3: true,
        
      ),
      home: const MyHomePage(title: 'Prueba simple de SP by Alex AP'),
    );
  }
}
