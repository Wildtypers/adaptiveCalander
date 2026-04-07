import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key}); //creating a super key for unique identification on tree

  @override
  State<MyHomePage> createState() => _HomePageState(); //creating state
}

class _HomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Sample Bar')),
      body: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Test')
                    ),
                  ]
                ),
                Column(
                  children: [
                    Text('Task 1'),
                  ]
                ),
              ]
            ),
            Row(),
            Row(),
          ],
        ),
      ),
    );
  }
}