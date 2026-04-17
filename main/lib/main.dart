import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'tasks.db'),
    onCreate: (db, version){
      return db.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY, task TEXT',
      );
    },
    version: 1,
  );

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
  final display = <Widget>[];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Task List')),
      body: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          spacing: 10,
          children: display
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await dialogBuilder(context);
          if (result != null && result.isNotEmpty) {
            final taskNumber = display.length + 1;
            setState(() {
              display.add(RowItems("Task $taskNumber", result));
            });
          }
        },
        label: Text("Add"),
        icon: const Icon(
          Icons.add,
        )
      )
    );
  }

  Future<String?> dialogBuilder(BuildContext context){
    final TextEditingController controller = TextEditingController();
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Enter a Task"),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText:'Example task'
            ),
          ),
          actions: [
            TextButton(
              onPressed: ()
              {
                return Navigator.pop(context);
              },
            child: Text("Cancel")
            ),
            TextButton(
              onPressed: (){
                return Navigator.pop(context, controller.text);
              },
            child: Text("Add")
            )
          ]
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