import 'package:flutter/material.dart';

class CoffeePage extends StatelessWidget {
  const CoffeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),

      ),
      body: Text("hi Coffee"),
    );
  }
}
