import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
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
          spacing: 10,
          children: [
            RowItems("Task 1", "Finish Homework"),
            RowItems("Task 2", "Finish Homework"),
            RowItems("Task 3", "Finish Homework"),
            RowItems("Task 4", "Finish Homework"),
            RowItems("Task 5", "Finish Homework"),
            RowItems("Task 6", "Finish Homework"),
            RowItems("Task 7", "Finish Homework"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          dialogBuilder(context);
        },
        label: Text("Add"),
        icon: const Icon(
          Icons.add,
        )
      )
    );
  }

  Future<void> dialogBuilder(BuildContext context){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Enter a Task")
        );
      }
    );
  }
}

class RowItems extends StatelessWidget{
  final String buttonText;
  final String taskText;

  const RowItems(
    this.buttonText,
    this.taskText,
    {super.key}
  );


  @override
  Widget build(BuildContext context){ 
    return Row(
      spacing: 15,
      children: [
        Column(
          children: [
            SizedBox(
              width: 90,
              height: 40,
              child: 
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(buttonText)
              ),
            )
          ]
        ),
        Column(
          children: [
            Text(taskText),
          ]
        ),
      ]
    );
  }
}