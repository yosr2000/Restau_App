import 'package:flutter/material.dart';

class CoffeePage extends StatelessWidget {
  var data = [
    {
      'name': 'cofee',
      'children': [
        {
          'name': 'cofee chaud',
          'children': [
            {
              'name': 'cappucino',
              'price':45
            },
            {'name': 'cappucino2',
              'children':[
                {
                  'name': 'cappucino aa',
                  'price':450
                },
                {
                  'name': 'cappucino bb',
                  'price':458
                },
              ]}
          ]
        },
        {}
      ]
    }
  ];


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
