
import 'package:flutter/material.dart';
import 'package:shared_ap/Preferences/preferences.dart'; 

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Counter inicial a 0
  int _counter = 0;

//Recuperamos su estado inicial
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

//Cargamos el estado del contador
  Future<void> _loadCounter() async {
    _counter = Preferences.getCounter();
    setState(() {});
  }

//Sumamos 1 al contador y guardamos su estado
  Future<void> _sumarCounter() async {
    setState(() {
      _counter++;
    });
    await Preferences.setCounter(_counter);
  }


//Restamos 1 al contador y guardamos su estado
 Future<void> _restarCounter() async {
  if (_counter > 0) {
    setState(() {
      _counter--;
    });
    await Preferences.setCounter(_counter);
  }
}

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
      backgroundColor: Colors.blue[900],
      
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'El contador esta en:',
          ),
          //Mostramos el contador
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    ),
    floatingActionButton: Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            //Sumamos 1 al contador
            onPressed: _sumarCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: FloatingActionButton(
            //Restamos 1 al contador
            onPressed: _restarCounter,        
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ),
      ],
    ),
  );
}

}