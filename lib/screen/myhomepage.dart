// Import statements from your snippet...
import 'package:flutter/material.dart';
import 'package:shared_ap/Preferences/preferences.dart'; // Ensure this path matches your project structure

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    _counter = Preferences.getCounter();
    setState(() {});
  }

  Future<void> _sumarCounter() async {
    setState(() {
      _counter++;
    });
    await Preferences.setCounter(_counter);
  }


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
            onPressed: _sumarCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: FloatingActionButton(
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