import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counter2 = 0;

  void _incrementCounter() {
    _counter++;
    print(_counter);
    setState(() {});
  }

  void _incrementCounter2() {
    _counter2++;
    print(_counter2);
    setState(() {});
  }

  void somaDosContadores() {
    var msg = "$_counter somando com $_counter2 é: ${_counter + _counter2}";
    print(msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contagem _counter: ${_counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Contagem _counter2: ${_counter2}',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: _incrementCounter2,
              child: Text("Conta 2"),
            ),
            TextButton(
                onPressed: somaDosContadores, child: Icon(Icons.plus_one)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), title: Text("Ola")),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), title: Text("Ola")),
        ],
      ),
    );
  }
}
