import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SecondPage extends StatelessWidget{
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Route')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Back Route'),
              onPressed: () {
                Navigator.pop(context);// Navigate to second route when tapped.
              },
            ),
            ElevatedButton(
              child: const Text('Front Route'),
              onPressed: (){
              }
            )
          ]
        )
      ),
    );
  }
}