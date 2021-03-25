import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Herois"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            EntradaDeDados(),
            EntradaDeDados(),
            ExibeListView(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class ExibeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class EntradaDeDados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
