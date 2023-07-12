import 'package:flutter/material.dart';

class PetitDejPage extends StatelessWidget {
  const PetitDejPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),

      ),
      body: Text("hi petit dej"),
    );
  }
}
